[CmdletBinding()]
param(
    [switch]$Strict
)

$ErrorCount = 0
$WarningCount = 0

function Add-ValidationError {
    param([string]$Message)
    $script:ErrorCount++
    Write-Host "ERROR: $Message" -ForegroundColor Red
}

function Add-ValidationWarning {
    param([string]$Message)
    $script:WarningCount++
    Write-Host "WARNING: $Message" -ForegroundColor Yellow
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$projectsPath = Join-Path $repoRoot "projects"
$knowledgePath = Join-Path $repoRoot "knowledge"
$libraryPath = Join-Path $repoRoot "library"
$copilotInstructionsPath = Join-Path $repoRoot ".github\copilot-instructions.md"

# --- Git helpers, needed early by the pre-commit-hook-activation check
#     below as well as the append-only checks further down: compare the
#     working copy against the version committed at HEAD. This only
#     catches edits made since the last commit — matches how this script
#     is actually used, immediately before each commit — not full repo
#     history. ---
$isGitRepo = $false
if (Test-Path (Join-Path $repoRoot ".git")) {
    git -C $repoRoot rev-parse --is-inside-work-tree *> $null
    $isGitRepo = ($LASTEXITCODE -eq 0)
}

function Get-GitHeadContent {
    param([string]$RelativePath)
    $result = git -C $repoRoot show "HEAD:$RelativePath" 2>$null
    if ($LASTEXITCODE -ne 0) { return $null }
    return ($result -join "`n")
}

function Test-LinesAppendOnly {
    param([string[]]$OldLines, [string[]]$NewLines)
    if ($NewLines.Count -lt $OldLines.Count) { return $false }
    for ($i = 0; $i -lt $OldLines.Count; $i++) {
        if ($NewLines[$i] -ne $OldLines[$i]) { return $false }
    }
    return $true
}

Write-Host "Context Architecture - Repo Validation"
Write-Host "Root: $repoRoot"
Write-Host ""

# --- Required root files ---
foreach ($file in @("README.md", "ROUTING.md", "Architecture.md", "MarkdownConventions.md")) {
    if (-not (Test-Path (Join-Path $repoRoot $file))) {
        Add-ValidationError "Missing root file: $file"
    }
}

if (-not (Test-Path $copilotInstructionsPath)) {
    Add-ValidationError "Missing entry point: .github\copilot-instructions.md"
}

# --- Pre-commit hook: files must exist, and the hook must actually be
#     activated (git config core.hooksPath). See Architecture.md §6. ---
if (-not (Test-Path (Join-Path $repoRoot ".githooks\pre-commit"))) {
    Add-ValidationError "Missing .githooks/pre-commit"
}
if (-not (Test-Path (Join-Path $repoRoot "scripts\pre-commit-check.ps1"))) {
    Add-ValidationError "Missing scripts/pre-commit-check.ps1"
}
if ($isGitRepo) {
    $hooksPath = (git -C $repoRoot config --get core.hooksPath 2>$null)
    if ($hooksPath -ne ".githooks") {
        Add-ValidationWarning "core.hooksPath is not set to '.githooks' in this clone — the pre-commit hook is inactive here. Run: git config core.hooksPath .githooks"
    }
}

# --- knowledge/flow/ ---
$flowPath = Join-Path $knowledgePath "flow"
foreach ($file in @("operating-principles.md", "turn-protocol.md", "routing-rules.md", "project-types.md", "upstream-sync.md")) {
    if (-not (Test-Path (Join-Path $flowPath $file))) {
        Add-ValidationError "Missing knowledge/flow file: $file"
    }
}

# --- knowledge/domains/ ---
$domainsPath = Join-Path $knowledgePath "domains"
if (-not (Test-Path (Join-Path $domainsPath "index.md"))) {
    Add-ValidationError "Missing knowledge/domains/index.md"
}
if (-not (Test-Path (Join-Path $domainsPath "authoring-guidelines.md"))) {
    Add-ValidationWarning "Missing knowledge/domains/authoring-guidelines.md"
}

$domainDirs = Get-ChildItem -Path $domainsPath -Directory -ErrorAction SilentlyContinue
foreach ($domainDir in $domainDirs) {
    $descPath = Join-Path $domainDir.FullName "description.md"
    $knowledgeFilePath = Join-Path $domainDir.FullName "knowledge.md"
    if (-not (Test-Path $descPath)) {
        Add-ValidationWarning "Domain '$($domainDir.Name)' is missing description.md"
    }
    if (-not (Test-Path $knowledgeFilePath)) {
        Add-ValidationWarning "Domain '$($domainDir.Name)' is missing knowledge.md"
    }
}

# --- projects/ ---
if (-not (Test-Path $projectsPath)) {
    Add-ValidationError "Missing projects folder"
}

$projectDirs = Get-ChildItem -Path $projectsPath -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne "_template" }
$activeProjects = @()
$retiredProjects = @()

foreach ($projectDir in $projectDirs) {
    $todoPath = Join-Path $projectDir.FullName "TODO.md"
    $sessionLogPath = Join-Path $projectDir.FullName "session-log.md"

    if (-not (Test-Path $todoPath)) {
        Add-ValidationWarning "Project '$($projectDir.Name)' is missing TODO.md"
    }
    if (-not (Test-Path $sessionLogPath)) {
        Add-ValidationWarning "Project '$($projectDir.Name)' is missing session-log.md"
    }

    if (Test-Path $todoPath) {
        $todoText = Get-Content -Path $todoPath -Raw
        if ($todoText -match '(?mi)^Version\s+.+\|\s+\d{4}-\d{2}-\d{2}\s+\|\s+Active\s*$') {
            $activeProjects += $projectDir.Name
        } elseif ($todoText -match '(?mi)^Version\s+.+\|\s+\d{4}-\d{2}-\d{2}\s+\|\s+Retired\s*$') {
            $retiredProjects += $projectDir.Name
        }
    }
}

# --- Shared helper: strip fenced code blocks before scanning prose for
#     headings/fields/links, so a documentation *example* embedded in a
#     ``` fence (e.g. the template block in library/reference-index.md
#     itself) is never mistaken for a real entry or a real citation. ---
function Remove-CodeFences {
    param([string]$Text)
    return [regex]::Replace($Text, '(?s)```.*?```', '')
}

# --- Shared helper: parse a minimal YAML frontmatter block (key: value
#     pairs only, no nesting) from the very start of a file. Anchored to
#     the true start of the string so a document's own "---" section
#     separators are never mistaken for a frontmatter delimiter. ---
function Get-Frontmatter {
    param([string]$Text)
    $result = @{}
    $m = [regex]::Match($Text, '\A---\r?\n(.*?)\r?\n---\r?\n', 'Singleline')
    if (-not $m.Success) { return $result }
    foreach ($line in ($m.Groups[1].Value -split "`r?`n")) {
        $kv = [regex]::Match($line, '^([a-zA-Z0-9_-]+):\s*(.+?)\s*$')
        if ($kv.Success) {
            $result[$kv.Groups[1].Value] = $kv.Groups[2].Value
        }
    }
    return $result
}

# --- Shared helper: extract the Status field from a file's standard header
#     line ("Version X.Y | YYYY-MM-DD | Status"), used by the retirement
#     consistency checks below. See MarkdownConventions.md §1. ---
function Get-HeaderStatus {
    param([string]$Text)
    $m = [regex]::Match($Text, '(?m)^Version\s+[\d.]+\s*\|\s*\d{4}-\d{2}-\d{2}\s*\|\s*(.+?)\s*$')
    if ($m.Success) { return $m.Groups[1].Value.Trim() }
    return $null
}

# --- Frontmatter: domain files ---
# See MarkdownConventions.md §1 (Frontmatter).
foreach ($domainDir in $domainDirs) {
    foreach ($fileName in @("description.md", "knowledge.md")) {
        $filePath = Join-Path $domainDir.FullName $fileName
        if (-not (Test-Path $filePath)) { continue }

        $fm = Get-Frontmatter -Text (Get-Content -Path $filePath -Raw)
        if ($fm.Count -eq 0) {
            Add-ValidationError "'$($domainDir.Name)/$fileName' is missing frontmatter (expected type: domain, domain: $($domainDir.Name))"
            continue
        }
        if ($fm['type'] -ne 'domain') {
            Add-ValidationError "'$($domainDir.Name)/$fileName' frontmatter has type: $($fm['type']), expected 'domain'"
        }
        if ($fm['domain'] -ne $domainDir.Name) {
            Add-ValidationError "'$($domainDir.Name)/$fileName' frontmatter has domain: $($fm['domain']), expected '$($domainDir.Name)' (folder name mismatch)"
        }
    }

    $sourcesManifestPath = Join-Path (Join-Path $domainDir.FullName "sources") "manifest.md"
    if (Test-Path $sourcesManifestPath) {
        $fm = Get-Frontmatter -Text (Get-Content -Path $sourcesManifestPath -Raw)
        if ($fm.Count -eq 0) {
            Add-ValidationError "'$($domainDir.Name)/sources/manifest.md' is missing frontmatter (expected type: source-manifest, domain: $($domainDir.Name))"
        } else {
            if ($fm['type'] -ne 'source-manifest') {
                Add-ValidationError "'$($domainDir.Name)/sources/manifest.md' frontmatter has type: $($fm['type']), expected 'source-manifest'"
            }
            if ($fm['domain'] -ne $domainDir.Name) {
                Add-ValidationError "'$($domainDir.Name)/sources/manifest.md' frontmatter has domain: $($fm['domain']), expected '$($domainDir.Name)' (folder name mismatch)"
            }
        }
    }
}

# --- Frontmatter: project files ---
foreach ($projectDir in $projectDirs) {
    foreach ($fileName in @("TODO.md", "session-log.md")) {
        $filePath = Join-Path $projectDir.FullName $fileName
        if (-not (Test-Path $filePath)) { continue }

        $fm = Get-Frontmatter -Text (Get-Content -Path $filePath -Raw)
        if ($fm.Count -eq 0) {
            Add-ValidationError "'$($projectDir.Name)/$fileName' is missing frontmatter (expected type: project, project: $($projectDir.Name))"
            continue
        }
        if ($fm['type'] -ne 'project') {
            Add-ValidationError "'$($projectDir.Name)/$fileName' frontmatter has type: $($fm['type']), expected 'project'"
        }
        if ($fm['project'] -ne $projectDir.Name) {
            Add-ValidationError "'$($projectDir.Name)/$fileName' frontmatter has project: $($fm['project']), expected '$($projectDir.Name)' (folder name mismatch)"
        }
    }
}

# --- session-log.md: turn header format, sequential numbering, STATUS
#     signal presence/vocabulary, BLOCKED completeness, and append-only
#     integrity against the last commit. See knowledge/flow/turn-protocol.md
#     and operating-principles.md §2. [HUMAN] turns are exempt from the
#     STATUS requirement — real usage confirms the turn-protocol.md
#     [HUMAN] template carries none, and no-chaining is enforced by the
#     conversational medium itself (a new turn requires a new human
#     message), not by a "[HUMAN] Turn" log entry between every pair — so
#     that pattern is not checked here. ---
$knownStatusSignals = @(
    'STATUS: BLOCKED',
    'STATUS: WAITING FOR HUMAN:',
    'STATUS: FLAG RAISED',
    'STATUS: CHECKPOINT',
    'STATUS: PROJECT COMPLETE',
    'STATUS: COMPLETE, SYSTEM FLAGS PENDING',
    'STATUS: RETURN TO PHASE'
)

foreach ($projectDir in $projectDirs) {
    $sessionLogPath = Join-Path $projectDir.FullName "session-log.md"
    if (-not (Test-Path $sessionLogPath)) { continue }
    $rawContent = Get-Content -Path $sessionLogPath -Raw
    $scanText = Remove-CodeFences -Text $rawContent

    $turnMatches = [regex]::Matches($scanText, '(?m)^## \[([^\]]+)\] — Turn (\d+) \| (\d{4}-\d{2}-\d{2})\s*$')
    $expectedNext = 1

    for ($i = 0; $i -lt $turnMatches.Count; $i++) {
        $m = $turnMatches[$i]
        $role = $m.Groups[1].Value
        $turnNum = [int]$m.Groups[2].Value

        if ($turnNum -ne $expectedNext) {
            Add-ValidationError "'$($projectDir.Name)/session-log.md': Turn numbering breaks at 'Turn $turnNum' — expected Turn $expectedNext (turns must be sequential, no gaps or repeats)"
        }
        $expectedNext = $turnNum + 1

        if ($role.ToUpper() -ne 'HUMAN') {
            $turnEnd = if ($i -lt $turnMatches.Count - 1) { $turnMatches[$i + 1].Index } else { $scanText.Length }
            $turnBody = $scanText.Substring($m.Index, $turnEnd - $m.Index)

            $statusMatch = [regex]::Match($turnBody, '(?m)^STATUS:.*$')
            if (-not $statusMatch.Success) {
                Add-ValidationError "'$($projectDir.Name)/session-log.md': Turn $turnNum ([$role]) has no STATUS: line (turn-protocol.md §1 requires one on every non-HUMAN turn)"
            } else {
                $statusLine = $statusMatch.Value.Trim()
                $recognized = $false
                foreach ($sig in $knownStatusSignals) {
                    if ($statusLine.StartsWith($sig)) { $recognized = $true; break }
                }
                if (-not $recognized) {
                    Add-ValidationWarning "'$($projectDir.Name)/session-log.md': Turn $turnNum ([$role]) has an unrecognized STATUS signal: '$statusLine' — confirm this is an intentional project-specific phase signal (project-types.md), not a typo"
                }
                if ($statusLine -eq 'STATUS: BLOCKED') {
                    if ($turnBody -notmatch '(?m)^Reason:' -or $turnBody -notmatch '(?m)^Need:' -or $turnBody -notmatch '(?m)^Suggested contact:') {
                        Add-ValidationError "'$($projectDir.Name)/session-log.md': Turn $turnNum's STATUS: BLOCKED is missing one of Reason:/Need:/Suggested contact: (turn-protocol.md §3)"
                    }
                }
            }
        }
    }

    if ($isGitRepo) {
        $relPath = ("projects/{0}/session-log.md" -f $projectDir.Name)
        $oldContent = Get-GitHeadContent -RelativePath $relPath
        if ($null -ne $oldContent) {
            $oldLines = $oldContent -split "`r?`n"
            $newLines = $rawContent -split "`r?`n"
            if (-not (Test-LinesAppendOnly -OldLines $oldLines -NewLines $newLines)) {
                Add-ValidationError "'$($projectDir.Name)/session-log.md' has changed content that existed at the last commit — session-log.md is append-only, never edit or remove a prior turn (operating-principles.md §2)"
            }
        }
    }
}

# --- Retirement: domain Status consistency (description.md vs knowledge.md vs
#     index.md's Status column). See MarkdownConventions.md §1 and
#     knowledge/domains/index.md § Retiring a Domain. Only the Retired/
#     not-Retired distinction is compared — the three non-retired values
#     (Draft, Review Pending, Production) are legitimately independent of
#     each other and not what this check is for. ---
$indexDomainStatus = @{}
$indexPath = Join-Path $domainsPath "index.md"
if (Test-Path $indexPath) {
    $indexText = Remove-CodeFences -Text (Get-Content -Path $indexPath -Raw)
    foreach ($line in ($indexText -split "`r?`n")) {
        $trimmed = $line.Trim()
        if (-not $trimmed.StartsWith("|")) { continue }
        $cells = $trimmed.Trim('|') -split '\|' | ForEach-Object { $_.Trim() }
        if ($cells.Count -lt 3) { continue }
        $slugMatch = [regex]::Match($cells[1], 'knowledge/domains/([a-zA-Z0-9_-]+)/?')
        if (-not $slugMatch.Success) { continue }
        $indexDomainStatus[$slugMatch.Groups[1].Value] = $cells[2]
    }
}

foreach ($domainDir in $domainDirs) {
    $descPath = Join-Path $domainDir.FullName "description.md"
    $knowledgeFilePath = Join-Path $domainDir.FullName "knowledge.md"
    $descStatus = $null
    $knowledgeStatus = $null
    if (Test-Path $descPath) { $descStatus = Get-HeaderStatus -Text (Get-Content -Path $descPath -Raw) }
    if (Test-Path $knowledgeFilePath) { $knowledgeStatus = Get-HeaderStatus -Text (Get-Content -Path $knowledgeFilePath -Raw) }

    $descRetired = ($descStatus -eq "Retired")
    $knowledgeRetired = ($knowledgeStatus -eq "Retired")
    if ($descStatus -and $knowledgeStatus -and ($descRetired -ne $knowledgeRetired)) {
        Add-ValidationWarning "Domain '$($domainDir.Name)': description.md status is '$descStatus' but knowledge.md status is '$knowledgeStatus' — retirement status should match across both files"
    }

    if ($indexDomainStatus.ContainsKey($domainDir.Name)) {
        $indexStatus = $indexDomainStatus[$domainDir.Name]
        $indexRetired = ($indexStatus -eq "Retired")
        $filesRetired = $descRetired -or $knowledgeRetired
        if ($indexRetired -and -not $filesRetired) {
            Add-ValidationWarning "Domain '$($domainDir.Name)': index.md lists Status 'Retired' but description.md/knowledge.md do not — update the files or revert the index"
        } elseif ($filesRetired -and -not $indexRetired) {
            Add-ValidationWarning "Domain '$($domainDir.Name)': description.md/knowledge.md status is 'Retired' but index.md still lists Status '$indexStatus' — update the index"
        }
    }
}

# --- knowledge/domains/*/sources/ — evidentiary source manifests ---
# See knowledge/domains/authoring-guidelines.md §9.1.
function Get-ManifestTableFirstColumn {
    param([string]$Text)
    $values = @()
    foreach ($line in ($Text -split "`r?`n")) {
        $trimmed = $line.Trim()
        if (-not $trimmed.StartsWith("|")) { continue }
        $cells = $trimmed.Trim('|') -split '\|' | ForEach-Object { $_.Trim() }
        if ($cells.Count -eq 0) { continue }
        $first = $cells[0]
        if ($first -eq "" -or $first -eq "File" -or $first -match '^-+$') { continue }
        $values += $first
    }
    return $values
}

foreach ($domainDir in $domainDirs) {
    $sourcesPath = Join-Path $domainDir.FullName "sources"
    if (-not (Test-Path $sourcesPath)) { continue }

    $manifestPath = Join-Path $sourcesPath "manifest.md"
    if (-not (Test-Path $manifestPath)) {
        Add-ValidationError "Domain '$($domainDir.Name)' has a sources/ folder but no sources/manifest.md"
        continue
    }

    $manifestText = Remove-CodeFences -Text (Get-Content -Path $manifestPath -Raw)
    $manifestFiles = Get-ManifestTableFirstColumn -Text $manifestText

    $actualFiles = Get-ChildItem -Path $sourcesPath -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ne "manifest.md" } |
        Select-Object -ExpandProperty Name

    foreach ($mf in $manifestFiles) {
        if ($actualFiles -notcontains $mf) {
            Add-ValidationError "'$($domainDir.Name)/sources/manifest.md' lists '$mf' but that file does not exist in sources/"
        }
    }
    foreach ($af in $actualFiles) {
        if ($manifestFiles -notcontains $af) {
            Add-ValidationWarning "'$($domainDir.Name)/sources/$af' exists but is not listed in manifest.md (orphan source file)"
        }
    }
}

# --- library/ — deep-well registry vs. stored files ---
# See knowledge/domains/authoring-guidelines.md §9.2-9.3.
$refIndexPath = Join-Path $libraryPath "reference-index.md"
$deepWellsPath = Join-Path $libraryPath "deep-wells"
$storedLocations = @()

if (Test-Path $refIndexPath) {
    $refText = Remove-CodeFences -Text (Get-Content -Path $refIndexPath -Raw)
    $entryBlocks = [regex]::Split($refText, '(?m)^## ')

    foreach ($block in $entryBlocks) {
        if ($block.Trim() -eq "") { continue }
        $slugLine = ($block -split "`r?`n")[0].Trim()
        if ($slugLine -eq "") { continue }

        $storedMatch = [regex]::Match($block, '(?mi)^\s*-\s*\*\*Stored:\*\*\s*(yes|no)')
        if (-not $storedMatch.Success) { continue }

        if ($storedMatch.Groups[1].Value.ToLower() -eq "yes") {
            $locationMatch = [regex]::Match($block, '(?m)^\s*-\s*\*\*Location:\*\*\s*(\S+)')
            if (-not $locationMatch.Success) {
                Add-ValidationError "library/reference-index.md entry '$slugLine' is Stored: yes but has no Location field"
                continue
            }
            $location = $locationMatch.Groups[1].Value
            $storedLocations += $location
            $fullPath = Join-Path $repoRoot $location
            if (-not (Test-Path $fullPath)) {
                if ($location -like "restricted/*") {
                    # restricted/ is a separate submodule (Architecture.md §3) - an
                    # uninitialized checkout (no access to that repo) legitimately
                    # can't resolve this path. Not a data-integrity problem, so warn
                    # rather than error.
                    Add-ValidationWarning "library/reference-index.md entry '$slugLine' points Location at '$location' (restricted/), which doesn't resolve in this checkout - expected if the restricted/ submodule isn't initialized here"
                } else {
                    Add-ValidationError "library/reference-index.md entry '$slugLine' points Location at '$location', which does not exist"
                }
            }
        }
    }

    if (Test-Path $deepWellsPath) {
        $actualDeepWellFiles = Get-ChildItem -Path $deepWellsPath -File -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -notlike "*-manifest.md" } |
            ForEach-Object { "library/deep-wells/$($_.Name)" }

        foreach ($f in $actualDeepWellFiles) {
            if ($storedLocations -notcontains $f) {
                Add-ValidationWarning "'$f' exists in library/deep-wells/ but no reference-index.md entry claims it via Location (orphan deep-well file)"
            }
        }
    }

    # restricted/deep-wells/ (added 2026-08-09) - raw KEJ source manuscripts, same
    # orphan check as library/deep-wells/ above, recursive since this one has
    # per-slaegt subfolders (e.g. hopp-slaegten/). Silently skipped if the
    # restricted/ submodule isn't initialized in this checkout.
    $restrictedDeepWellsPath = Join-Path $repoRoot "restricted/deep-wells"
    if (Test-Path $restrictedDeepWellsPath) {
        $actualRestrictedDeepWellFiles = Get-ChildItem -Path $restrictedDeepWellsPath -File -Recurse -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -notlike "*-manifest.md" } |
            ForEach-Object { "restricted/deep-wells/" + ($_.FullName.Substring($restrictedDeepWellsPath.Length + 1) -replace '\\', '/') }

        foreach ($f in $actualRestrictedDeepWellFiles) {
            # A Location ending in "/" (e.g. restricted/deep-wells/hopp-slaegten/)
            # claims everything under that folder, not just an exact-string match -
            # hopp-slaegten/ in particular holds many per-chapter files under one
            # folder-level registry entry.
            $claimed = $storedLocations | Where-Object { $f -eq $_ -or ($_.EndsWith("/") -and $f.StartsWith($_)) }
            if (-not $claimed) {
                Add-ValidationWarning "'$f' exists in restricted/deep-wells/ but no reference-index.md entry claims it via Location (orphan deep-well file)"
            }
        }
    }
} elseif (Test-Path $deepWellsPath) {
    Add-ValidationError "library/deep-wells/ exists but library/reference-index.md is missing"
}

# --- Referential integrity: links from domain files into sources/ or library/reference-index.md ---
$refIndexHeadings = @()
if (Test-Path $refIndexPath) {
    $refText = Remove-CodeFences -Text (Get-Content -Path $refIndexPath -Raw)
    $refIndexHeadings = [regex]::Matches($refText, '(?m)^## (.+)$') | ForEach-Object { $_.Groups[1].Value.Trim() }
}

foreach ($domainDir in $domainDirs) {
    foreach ($fileName in @("knowledge.md", "description.md")) {
        $filePath = Join-Path $domainDir.FullName $fileName
        if (-not (Test-Path $filePath)) { continue }
        $text = Remove-CodeFences -Text (Get-Content -Path $filePath -Raw)

        $linkMatches = [regex]::Matches($text, '\]\(([^)]+)\)')
        foreach ($m in $linkMatches) {
            $target = $m.Groups[1].Value
            $anchor = $null
            if ($target -match '^(.*?)(#[^#]*)$') {
                $target = $Matches[1]
                $anchor = $Matches[2]
            }
            if ($target -notmatch '^(sources/|(\.\./){3}library/)') { continue }

            $resolvedPath = [System.IO.Path]::GetFullPath((Join-Path $domainDir.FullName $target))
            if (-not (Test-Path $resolvedPath)) {
                Add-ValidationError "'$($domainDir.Name)/$fileName' links to '$target', which does not resolve to a real file"
                continue
            }
            if ($anchor -and $target -like "*reference-index.md") {
                $slug = $anchor.TrimStart('#')
                if ($refIndexHeadings -notcontains $slug) {
                    Add-ValidationWarning "'$($domainDir.Name)/$fileName' links to reference-index.md#$slug, which has no matching '## $slug' heading"
                }
            }
        }
    }
}

# --- Cross-domain reference reciprocity (warning only) ---
# See knowledge/domains/authoring-guidelines.md §5 and §8. Ground truth is
# the actual links inside each domain's own files, not index.md's prose
# References column — that column is a human-authored summary and could
# itself drift from the real links.
$domainNames = $domainDirs | ForEach-Object { $_.Name }
$domainLinkMap = @{}

foreach ($domainDir in $domainDirs) {
    $linkedDomains = New-Object System.Collections.Generic.HashSet[string]
    foreach ($fileName in @("description.md", "knowledge.md")) {
        $filePath = Join-Path $domainDir.FullName $fileName
        if (-not (Test-Path $filePath)) { continue }
        $text = Remove-CodeFences -Text (Get-Content -Path $filePath -Raw)

        $siblingMatches = [regex]::Matches($text, '\]\(\.\./([a-zA-Z0-9_-]+)/')
        foreach ($m in $siblingMatches) {
            $target = $m.Groups[1].Value
            if ($target -ne $domainDir.Name -and ($domainNames -contains $target)) {
                [void]$linkedDomains.Add($target)
            }
        }
    }
    $domainLinkMap[$domainDir.Name] = $linkedDomains
}

foreach ($from in $domainLinkMap.Keys) {
    foreach ($to in $domainLinkMap[$from]) {
        $backLinked = $domainLinkMap.ContainsKey($to) -and $domainLinkMap[$to].Contains($from)
        if (-not $backLinked) {
            Add-ValidationWarning "'$from' links to '$to', but '$to' does not link back to '$from' (one-directional cross-reference — confirm this is intentional, see authoring-guidelines.md §5)"
        }
    }
}

# --- Retirement: a Retired project should not still have a live routing row
#     in ROUTING.md Step 2 — see ROUTING.md's Retirement note under Step 2. ---
$routingPath = Join-Path $repoRoot "ROUTING.md"
$step2ProjectNames = @()
if (Test-Path $routingPath) {
    $routingText = Get-Content -Path $routingPath -Raw
    $step2Match = [regex]::Match($routingText, '(?s)### Step 2.*?(?=### Step 3)')
    if ($step2Match.Success) {
        $step2Text = Remove-CodeFences -Text $step2Match.Value
        foreach ($line in ($step2Text -split "`r?`n")) {
            $trimmed = $line.Trim()
            if (-not $trimmed.StartsWith("|")) { continue }
            $cells = $trimmed.Trim('|') -split '\|' | ForEach-Object { $_.Trim() }
            if ($cells.Count -lt 2) { continue }
            $projectCell = $cells[1]
            if ($projectCell -eq "" -or $projectCell -eq "Project" -or $projectCell -match '^-+$') { continue }
            $step2ProjectNames += ($projectCell.ToLower() -replace '\s+', '-')
        }
    }
}

foreach ($name in $retiredProjects) {
    if ($step2ProjectNames -contains $name.ToLower()) {
        Add-ValidationWarning "Project '$name' is marked Retired but still has a routing row in ROUTING.md Step 2 — remove the row so new work isn't routed there"
    }
}

# --- Version History discipline (every file that has one): header Version
#     must match the latest row, and old rows must never be edited or
#     removed compared to the last commit — only appended to. See
#     MarkdownConventions.md §2. Code-fenced examples (e.g. the format
#     sample inside MarkdownConventions.md itself, which literally contains
#     a "## Version History" heading in a fence) are stripped first so
#     they're never mistaken for a real section. The heading match allows
#     an optional numeric prefix ("## Version History" or "## 10. Version
#     History") — MarkdownConventions.md numbers its own final section,
#     and a first version of this check silently skipped that file
#     entirely because it didn't, missing a real header/row mismatch that
#     shipped for over a week before a fork's sync session caught it by
#     hand. ---
function Get-HeaderVersion {
    param([string]$Text)
    $m = [regex]::Match($Text, '(?m)^Version\s+([\d.]+)\s*\|')
    if ($m.Success) { return $m.Groups[1].Value }
    return $null
}

function Get-VersionHistoryRows {
    param([string]$Text)
    $rows = @()
    $m = [regex]::Match($Text, '(?ms)^## (?:\d+\.\s*)?Version History\s*\r?\n(.*?)(?:\r?\n---|\z)')
    if (-not $m.Success) { return $rows }
    foreach ($line in ($m.Groups[1].Value -split "`r?`n")) {
        $trimmed = $line.Trim()
        if (-not $trimmed.StartsWith("|")) { continue }
        $cells = $trimmed.Trim('|') -split '\|' | ForEach-Object { $_.Trim() }
        if ($cells.Count -eq 0) { continue }
        $first = $cells[0]
        if ($first -eq "" -or $first -eq "Version" -or $first -match '^-+$') { continue }
        $rows += $trimmed
    }
    return $rows
}

# restricted/ is a git submodule with its own separate commit history — this
# script's git-diffing helpers (Get-GitHeadContent, Test-LinesAppendOnly)
# assume everything they check is part of *this* repo's history, which does
# not hold across a submodule boundary. Excluded here rather than let those
# checks misbehave; not a statement that its content matters less.
$allMdFiles = Get-ChildItem -Path $repoRoot -Recurse -Filter "*.md" -File -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch '[\\/]temp[\\/]' -and $_.FullName -notmatch '[\\/]\.git[\\/]' -and $_.FullName -notmatch '[\\/]restricted[\\/]' }

foreach ($mdFile in $allMdFiles) {
    $rawText = Get-Content -Path $mdFile.FullName -Raw
    $scanText = Remove-CodeFences -Text $rawText
    if ($scanText -notmatch '(?m)^## (?:\d+\.\s*)?Version History\s*$') { continue }

    $relPath = ([System.IO.Path]::GetRelativePath($repoRoot, $mdFile.FullName)) -replace '\\', '/'
    $headerVersion = Get-HeaderVersion -Text $scanText
    $rows = @(Get-VersionHistoryRows -Text $scanText)

    if ($headerVersion -and $rows.Count -gt 0) {
        $lastRowCells = $rows[-1].Trim('|') -split '\|' | ForEach-Object { $_.Trim() }
        $lastRowVersion = $lastRowCells[0]
        if ($lastRowVersion -ne $headerVersion) {
            Add-ValidationWarning "'$relPath': header Version is '$headerVersion' but the latest Version History row is '$lastRowVersion' — a version bump was likely forgotten"
        }
    }

    if ($isGitRepo) {
        $oldRawText = Get-GitHeadContent -RelativePath $relPath
        if ($null -ne $oldRawText) {
            $oldScanText = Remove-CodeFences -Text $oldRawText
            $oldRows = @(Get-VersionHistoryRows -Text $oldScanText)
            if (-not (Test-LinesAppendOnly -OldLines $oldRows -NewLines $rows)) {
                Add-ValidationError "'$relPath': Version History rows changed compared to the last commit — never edit or remove an existing row, only append (MarkdownConventions.md §2)"
            }
        }
    }
}

# --- family-tree/tree.ged — GEDCOM structural consistency ---
# Ports checks that had to be done by hand on 2026-08-06, after a Gramps
# import reported "483 errors" against a file that a lenient parser
# (python-gedcom) had accepted without complaint. Two real bug classes were
# found: missing bidirectional FAMC/FAMS/HUSB/WIFE/CHIL back-references, and
# informal @I123@/@F45@-style cross-references left inside free-text NOTE
# fields — GEDCOM 5.5.1 requires a literal "@" in a value to be escaped
# wherever it appears, since an unescaped one is parsed as a pointer. See
# projects/archive-digitization/context/ extraction notes and
# projects/system/session-log.md for the incident this was written to catch
# automatically from now on.
$treeGedPath = Join-Path $repoRoot "family-tree\tree.ged"
if (Test-Path $treeGedPath) {
    $gedLines = Get-Content -Path $treeGedPath

    $indiIds = New-Object System.Collections.Generic.HashSet[string]
    $famIds = New-Object System.Collections.Generic.HashSet[string]
    $indiFamc = @{}   # INDI id -> List[FAM id]
    $indiFams = @{}   # INDI id -> List[FAM id]
    $famHusb = @{}    # FAM id -> List[INDI id]
    $famWife = @{}    # FAM id -> List[INDI id]
    $famChil = @{}    # FAM id -> List[INDI id]

    $currentType = $null   # 'INDI' or 'FAM'
    $currentId = $null
    $gedLineNum = 0

    foreach ($gedLine in $gedLines) {
        $gedLineNum++

        if ($gedLine.Trim() -eq '') {
            Add-ValidationError "family-tree/tree.ged:$gedLineNum — blank line (invalid GEDCOM; every line must start with a level number). This is what actually produced Gramps' 'Line ignored' import errors on 2026-08-06, not the earlier @-escaping bug — do not use blank lines as visual spacing between records."
            continue
        }

        if ($gedLine.Length -gt 255) {
            Add-ValidationWarning "family-tree/tree.ged:$gedLineNum — line is $($gedLine.Length) chars, over the 255-char soft limit some GEDCOM tools enforce (Gramps tolerates this; flagged as a warning only)"
        }

        $recMatch = [regex]::Match($gedLine, '^0 @(I\d+|F\d+)@ (INDI|FAM)\s*$')
        if ($recMatch.Success) {
            $currentId = $recMatch.Groups[1].Value
            $currentType = $recMatch.Groups[2].Value
            if ($currentType -eq 'INDI') {
                if (-not $indiIds.Add($currentId)) {
                    Add-ValidationError "family-tree/tree.ged:$gedLineNum — duplicate INDI id @$currentId@"
                }
            } else {
                if (-not $famIds.Add($currentId)) {
                    Add-ValidationError "family-tree/tree.ged:$gedLineNum — duplicate FAM id @$currentId@"
                }
            }
            continue
        }
        if ($gedLine -match '^0 ') { $currentType = $null; $currentId = $null; continue }

        if ($currentType -eq 'INDI') {
            $famcFamsMatch = [regex]::Match($gedLine, '^1 (FAMC|FAMS) @(F\d+)@\s*$')
            if ($famcFamsMatch.Success) {
                $tag = $famcFamsMatch.Groups[1].Value
                $famId = $famcFamsMatch.Groups[2].Value
                $targetDict = if ($tag -eq 'FAMC') { $indiFamc } else { $indiFams }
                if (-not $targetDict.ContainsKey($currentId)) { $targetDict[$currentId] = New-Object System.Collections.Generic.List[string] }
                $targetDict[$currentId].Add($famId)
                continue
            }
        }
        if ($currentType -eq 'FAM') {
            $husbWifeChilMatch = [regex]::Match($gedLine, '^1 (HUSB|WIFE|CHIL) @(I\d+)@\s*$')
            if ($husbWifeChilMatch.Success) {
                $tag = $husbWifeChilMatch.Groups[1].Value
                $indiId = $husbWifeChilMatch.Groups[2].Value
                $targetDict = switch ($tag) { 'HUSB' { $famHusb }; 'WIFE' { $famWife }; 'CHIL' { $famChil } }
                if (-not $targetDict.ContainsKey($currentId)) { $targetDict[$currentId] = New-Object System.Collections.Generic.List[string] }
                $targetDict[$currentId].Add($indiId)
                continue
            }
        }

        # Anything reaching here is free text (NAME/NOTE/etc.) — level-0
        # headers and structural pointer lines were already consumed above.
        if ($gedLine -match '@[IF]\d+@') {
            Add-ValidationError "family-tree/tree.ged:$gedLineNum — unescaped '@' in free text (informal @I###@/@F###@ cross-reference) — write the bare id without @ signs, e.g. 'see I6' not 'se @I6@'"
        }
    }

    # Dangling references: FAMC/FAMS must point at a FAM id that exists;
    # HUSB/WIFE/CHIL must point at an INDI id that exists.
    foreach ($indiId in $indiFamc.Keys) {
        foreach ($famId in $indiFamc[$indiId]) {
            if (-not $famIds.Contains($famId)) {
                Add-ValidationError "family-tree/tree.ged — @$indiId@ has FAMC @$famId@, which does not exist"
            }
        }
    }
    foreach ($indiId in $indiFams.Keys) {
        foreach ($famId in $indiFams[$indiId]) {
            if (-not $famIds.Contains($famId)) {
                Add-ValidationError "family-tree/tree.ged — @$indiId@ has FAMS @$famId@, which does not exist"
            }
        }
    }
    $allFamRefIds = @($famHusb.Keys) + @($famWife.Keys) + @($famChil.Keys) | Select-Object -Unique
    foreach ($famId in $allFamRefIds) {
        foreach ($famDict in @($famHusb, $famWife, $famChil)) {
            if ($famDict.ContainsKey($famId)) {
                foreach ($indiId in $famDict[$famId]) {
                    if (-not $indiIds.Contains($indiId)) {
                        Add-ValidationError "family-tree/tree.ged — @$famId@ references @$indiId@, which does not exist"
                    }
                }
            }
        }
    }

    # Bidirectional consistency, FAM side -> INDI side.
    foreach ($famId in $famHusb.Keys) {
        foreach ($indiId in $famHusb[$famId]) {
            if (-not ($indiFams.ContainsKey($indiId) -and $indiFams[$indiId].Contains($famId))) {
                Add-ValidationError "family-tree/tree.ged — @$famId@ HUSB @$indiId@ has no matching '1 FAMS @$famId@' on @$indiId@"
            }
        }
    }
    foreach ($famId in $famWife.Keys) {
        foreach ($indiId in $famWife[$famId]) {
            if (-not ($indiFams.ContainsKey($indiId) -and $indiFams[$indiId].Contains($famId))) {
                Add-ValidationError "family-tree/tree.ged — @$famId@ WIFE @$indiId@ has no matching '1 FAMS @$famId@' on @$indiId@"
            }
        }
    }
    foreach ($famId in $famChil.Keys) {
        foreach ($indiId in $famChil[$famId]) {
            if (-not ($indiFamc.ContainsKey($indiId) -and $indiFamc[$indiId].Contains($famId))) {
                Add-ValidationError "family-tree/tree.ged — @$famId@ CHIL @$indiId@ has no matching '1 FAMC @$famId@' on @$indiId@"
            }
        }
    }

    # Bidirectional consistency, INDI side -> FAM side.
    foreach ($indiId in $indiFams.Keys) {
        foreach ($famId in $indiFams[$indiId]) {
            $isHusb = $famHusb.ContainsKey($famId) -and $famHusb[$famId].Contains($indiId)
            $isWife = $famWife.ContainsKey($famId) -and $famWife[$famId].Contains($indiId)
            if (-not ($isHusb -or $isWife)) {
                Add-ValidationError "family-tree/tree.ged — @$indiId@ FAMS @$famId@ but @$famId@ does not list @$indiId@ as HUSB or WIFE"
            }
        }
    }
    foreach ($indiId in $indiFamc.Keys) {
        foreach ($famId in $indiFamc[$indiId]) {
            if (-not ($famChil.ContainsKey($famId) -and $famChil[$famId].Contains($indiId))) {
                Add-ValidationError "family-tree/tree.ged — @$indiId@ FAMC @$famId@ but @$famId@ does not list @$indiId@ as CHIL"
            }
        }
    }
}

# --- family-tree/tree.ged — redacted-placeholder regression guard ---
# Since 2026-08-08, any individual presumed living has their real name,
# exact birth date, occupation, and notes stripped from the public tree and
# replaced with a "Living /<surname>/" placeholder + birth year only (full
# record kept in restricted/tree-sensitive.ged, see Architecture.md §3).
# A second category, "Withheld /?/", covers content KEJ explicitly
# instructed never be published regardless of vital status — same
# mechanics, different reason, see Architecture.md §3.
# This check catches the placeholder silently regaining real content later
# — e.g. someone pastes a fuller record back in without redacting it again.
if (Test-Path $treeGedPath) {
    $gedLines2 = Get-Content -Path $treeGedPath
    $currentId2 = $null
    $isPlaceholder = $false
    $placeholderLines = @()

    function Test-PlaceholderLine {
        param([string]$Line)
        if ($Line -match '^0 @I\d+@ INDI\s*$') { return $true }
        if ($Line -match '^1 NAME (Living|Withheld) /.*/\s*$') { return $true }
        if ($Line -match '^1 SEX [MFU]\s*$') { return $true }
        if ($Line -match '^1 BIRT\s*$') { return $true }
        if ($Line -match '^2 DATE \d{4}\s*$') { return $true }
        if ($Line -match '^1 FAM[CS] @F\d+@\s*$') { return $true }
        if ($Line -match '^1 NOTE Fulde oplysninger \(navn, dato, noter\): restricted/tree-sensitive\.ged#I\d+') { return $true }
        if ($Line -match '^1 NOTE Ikke offentliggjort efter direkte instruks fra KEJ') { return $true }
        return $false
    }

    function Confirm-PlaceholderBlock {
        if ($script:isPlaceholder) {
            foreach ($pl in $script:placeholderLines) {
                if (-not (Test-PlaceholderLine -Line $pl)) {
                    Add-ValidationError "family-tree/tree.ged — @$script:currentId2@ looks like a redacted placeholder (NAME 'Living/Withheld /.../') but also has a non-placeholder line: '$pl' — real data may have regressed back into the public tree"
                }
            }
        }
    }

    foreach ($gedLine2 in $gedLines2) {
        if ($gedLine2 -match '^0 ') {
            # Flush/validate whatever record was just accumulated, whether
            # this new 0-level line starts another INDI, a FAM, or TRLR.
            Confirm-PlaceholderBlock
            $isPlaceholder = $false
            $placeholderLines = @()
            $m3 = [regex]::Match($gedLine2, '^0 @(I\d+)@ INDI\s*$')
            if ($m3.Success) {
                $currentId2 = $m3.Groups[1].Value
                $placeholderLines = @($gedLine2)
            } else {
                $currentId2 = $null
            }
            continue
        }
        if ($currentId2) {
            $placeholderLines += $gedLine2
            if ($gedLine2 -match '^1 NAME (Living|Withheld) /') { $isPlaceholder = $true }
        }
    }
    # Flush the final record in the file (the line loop never sees a
    # trailing 0-level boundary after it, since TRLR itself already flushed
    # whatever preceded it).
    Confirm-PlaceholderBlock
}

# --- family-tree/tree.ged vs restricted/tree-sensitive.ged — bidirectional
#     completeness. Only runs when the restricted/ submodule is actually
#     initialized (most sessions correctly have no access — that's not an
#     error, just skip silently). ---
$restrictedTreePath = Join-Path $repoRoot "restricted\tree-sensitive.ged"
if ((Test-Path $treeGedPath) -and (Test-Path $restrictedTreePath)) {
    $treeGedRawText = Get-Content -Path $treeGedPath -Raw
    $publicPlaceholderIds = [regex]::Matches($treeGedRawText, '0 @(I\d+)@ INDI\r?\n1 NAME (?:Living|Withheld) /') |
        ForEach-Object { $_.Groups[1].Value }
    $restrictedText = Get-Content -Path $restrictedTreePath -Raw
    $restrictedIds = [regex]::Matches($restrictedText, '(?m)^0 @(I\d+)@ INDI\s*$') | ForEach-Object { $_.Groups[1].Value }

    $publicSet = [System.Collections.Generic.HashSet[string]]::new([string[]]$publicPlaceholderIds)
    $restrictedSet = [System.Collections.Generic.HashSet[string]]::new([string[]]$restrictedIds)

    foreach ($pubId in $publicPlaceholderIds) {
        if (-not $restrictedSet.Contains($pubId)) {
            Add-ValidationError "family-tree/tree.ged — @$pubId@ is a redacted placeholder but has no matching full record in restricted/tree-sensitive.ged"
        }
    }
    foreach ($rid in $restrictedIds) {
        if (-not $publicSet.Contains($rid)) {
            # Some individuals are intentionally public by name (their basic
            # identity was cleared for public disclosure) while restricted/
            # still holds fuller, narrower context under the same ID — not a
            # stale/accidental mismatch. The public record's own NOTE lines
            # link back here in that case (e.g. @I164@, 2026-08-08), so treat
            # that self-reference as confirmation rather than flagging it.
            if ($treeGedRawText.Contains("restricted/tree-sensitive.ged#$rid")) {
                continue
            }
            Add-ValidationWarning "restricted/tree-sensitive.ged — @$rid@ has a full record here but the public tree.ged does not have a matching 'Living /.../' placeholder for it, and its own record doesn't cross-reference this file either (may be stale, or the public individual was un-redacted without removing it here)"
        }
    }
}

# --- restricted/incoming/ — non-empty nudge ---
# restricted/incoming/ is a waiting room for untriaged raw files (Architecture.md §3,
# ROUTING.md Standing Rules), not permanent storage. Moved here from a main-repo
# top-level incoming/ on 2026-08-09 — raw material needs an independent sensitivity
# check before anything is public. This doesn't try to match individual files against
# intake-manifest.md (filenames won't reliably map to named items) — it's a per-commit
# reminder to check whether triage is overdue, not a claim that any specific file is stale.
# Silently skipped if the restricted/ submodule isn't initialized in this checkout.
$restrictedIncomingPath = Join-Path $repoRoot "restricted/incoming"
if (Test-Path $restrictedIncomingPath) {
    $incomingFiles = Get-ChildItem -Path $restrictedIncomingPath -File | Where-Object { $_.Name -ne "README.md" }
    if ($incomingFiles.Count -gt 0) {
        $incomingNames = ($incomingFiles | ForEach-Object { $_.Name }) -join ", "
        Add-ValidationWarning "restricted/incoming/ has $($incomingFiles.Count) untriaged file(s) still present: $incomingNames — triage per restricted/incoming/README.md, then remove them (moved to their real home, or discarded if registry-only)"
    }
}

# --- old incoming/ — habit guard ---
# incoming/ moved to restricted/incoming/ on 2026-08-09 (see Architecture.md §3).
# This just catches anyone still dropping files in the old spot out of habit.
$oldIncomingPath = Join-Path $repoRoot "incoming"
if (Test-Path $oldIncomingPath) {
    $oldIncomingFiles = Get-ChildItem -Path $oldIncomingPath -File | Where-Object { $_.Name -ne "README.md" }
    if ($oldIncomingFiles.Count -gt 0) {
        $oldIncomingNames = ($oldIncomingFiles | ForEach-Object { $_.Name }) -join ", "
        Add-ValidationWarning "incoming/ (old location) has $($oldIncomingFiles.Count) file(s): $oldIncomingNames — this folder moved to restricted/incoming/ on 2026-08-09; move these there instead"
    }
}

# --- Summary ---
Write-Host ""
Write-Host "Active projects: $($activeProjects.Count)"
foreach ($p in $activeProjects) {
    Write-Host "  - $p"
}

if ($retiredProjects.Count -gt 0) {
    Write-Host ""
    Write-Host "Retired projects: $($retiredProjects.Count)"
    foreach ($p in $retiredProjects) {
        Write-Host "  - $p"
    }
}

Write-Host ""
if ($ErrorCount -eq 0 -and $WarningCount -eq 0) {
    Write-Host "Validation passed - no issues found." -ForegroundColor Green
} elseif ($ErrorCount -eq 0) {
    Write-Host ("Validation passed with " + $WarningCount + " warning(s).") -ForegroundColor Yellow
} else {
    Write-Host ("Validation failed: " + $ErrorCount + " error(s), " + $WarningCount + " warning(s).") -ForegroundColor Red
    exit 1
}
