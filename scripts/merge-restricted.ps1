[CmdletBinding()]
param(
    [string]$OutputPath
)

# Reconstructs a complete, unredacted family-tree/tree.ged for private use by
# overlaying restricted/tree-sensitive.ged's full individual records onto a
# copy of the public tree.ged's placeholders, matched by @I@ id. FAM records
# never need touching - redaction happens per-individual only, and every
# FAMC/FAMS/HUSB/WIFE/CHIL pointer is identical in both files.
#
# Requires restricted/ to be initialized (git submodule update --init
# restricted) and readable - if it isn't, this script has nothing to merge
# and exits with an error rather than silently producing a copy of the
# public file.
#
# Output is never committed anywhere - it contains the same restricted data
# restricted/tree-sensitive.ged does, just recombined into one file. Defaults
# to a local, gitignored path.

$repoRoot = Split-Path -Parent $PSScriptRoot
$publicPath = Join-Path $repoRoot "family-tree\tree.ged"
$restrictedPath = Join-Path $repoRoot "restricted\tree-sensitive.ged"

if (-not (Test-Path $publicPath)) {
    Write-Host "ERROR: family-tree/tree.ged not found at $publicPath" -ForegroundColor Red
    exit 1
}
if (-not (Test-Path $restrictedPath)) {
    Write-Host "ERROR: restricted/tree-sensitive.ged not found — is the restricted/ submodule initialized?" -ForegroundColor Red
    Write-Host "Run: git submodule update --init restricted" -ForegroundColor Yellow
    exit 1
}

if (-not $OutputPath) {
    $OutputPath = Join-Path $repoRoot "temp\tree-merged.ged"
}
$outputDir = Split-Path -Parent $OutputPath
if ($outputDir -and -not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

function Get-IndiRecords {
    param([string[]]$Lines)
    $records = @{}
    $currentId = $null
    $currentLines = @()
    foreach ($line in $Lines) {
        $m = [regex]::Match($line, '^0 @(I\d+)@ INDI\s*$')
        if ($m.Success) {
            if ($currentId) { $records[$currentId] = $currentLines }
            $currentId = $m.Groups[1].Value
            $currentLines = @($line)
            continue
        }
        if ($line -match '^0 ') {
            if ($currentId) { $records[$currentId] = $currentLines }
            $currentId = $null
            $currentLines = @()
            continue
        }
        if ($currentId) { $currentLines += $line }
    }
    if ($currentId) { $records[$currentId] = $currentLines }
    return $records
}

$publicLines = Get-Content -Path $publicPath
$restrictedLines = Get-Content -Path $restrictedPath

$restrictedRecords = Get-IndiRecords -Lines $restrictedLines
Write-Host "Loaded $($restrictedRecords.Count) full records from restricted/tree-sensitive.ged"

$output = New-Object System.Collections.Generic.List[string]
$i = 0
$replaced = 0
while ($i -lt $publicLines.Count) {
    $line = $publicLines[$i]
    $m = [regex]::Match($line, '^0 @(I\d+)@ INDI\s*$')
    if ($m.Success -and $restrictedRecords.ContainsKey($m.Groups[1].Value)) {
        $id = $m.Groups[1].Value
        # $restrictedRecords[$id] already includes its own "0 @I..@ INDI"
        # header line as the first element - don't add $line too, or the
        # header ends up duplicated.
        $output.AddRange([string[]]$restrictedRecords[$id])
        $replaced++
        # skip the placeholder body in the public file
        $i++
        while ($i -lt $publicLines.Count -and $publicLines[$i] -notmatch '^0 ') {
            $i++
        }
        continue
    }
    $output.Add($line)
    $i++
}

$output | Set-Content -Path $OutputPath -Encoding utf8
Write-Host "Merged $replaced individuals into $OutputPath" -ForegroundColor Green
Write-Host "This file contains unredacted personal data — do not commit it anywhere." -ForegroundColor Yellow
