# Context Architecture — System Design

Version 1.16 | 2026-08-25 | Production

---

## Document Purpose

Describes how a context architecture works: the session interface, the file and folder structure, the two-tier knowledge model, knowledge promotion, and dynamic routing. Read this when designing or changing how the system operates, or when setting up a new instance.

> **Routing check:** This is a design reference document. If you have not read `ROUTING.md` and completed all four Route steps, do that first. Reading this file does not authorise you to act.

---

## Index

1. [The Session Interface](#1-the-session-interface)
2. [File Structure](#2-file-structure)
3. [Two-Tier Knowledge Model](#3-two-tier-knowledge-model)
4. [Dynamic Routing](#4-dynamic-routing)
5. [Subproject Transcendence](#5-subproject-transcendence)
6. [Setting Up a New Instance](#6-setting-up-a-new-instance)
7. [Version History](#version-history)

---

## 1. The Session Interface

Each project has a single `session-log.md` file that accumulates entries chronologically. This file is the project's authoritative record — what was done, decided, questioned, and approved.

There is no dedicated application. The interface is the file. Any text editor serves equally.

### Entry format

```
## [Role or Name] — Turn N | YYYY-MM-DD

[Content — analysis, decisions, output, questions]

STATUS: [signal]
```

Human turns follow the same structure:

```
## [HUMAN] — Turn N | YYYY-MM-DD

[Approval, clarification, input, or routing override]
```

The session log only ever grows — no entries are deleted or edited after the fact.

---

## 2. File Structure

```
[repo-name]/
  README.md                           <- Human overview — what this is and how to set it up
  ROUTING.md                          <- LLM routing instructions — Steps 1-4
  Architecture.md                     ← This file
  MarkdownConventions.md              ← Baseline markdown rules for all files
  .github/
    copilot-instructions.md           ← VS Code entry point

  knowledge/                          ← Knowledge layer — human-approved changes only
    flow/
      operating-principles.md         ← Core principles, signals, knowledge promotion
      turn-protocol.md                ← Turn format and STATUS signals
      routing-rules.md                ← Routing logic reference
      project-types.md                ← Project type definitions and phase templates
    domains/
      index.md                        ← Domain registry
      authoring-guidelines.md         ← Standards for writing domain knowledge
      [domain-name]/
        description.md                ← Scope, constraints, when to load
        knowledge.md                  ← Domain reference material
        sources/                      ← Evidentiary source files — only if this domain has any
          manifest.md                 ← Registry of the raw files in this folder

  incoming/                           ← Fork-specific — pointer only, see §3 (moved to restricted/incoming/, 2026-08-09)
    README.md                         ← Redirects to restricted/incoming/README.md

  library/                            ← Cross-domain deep-well registry — see authoring-guidelines.md §9.2
    reference-index.md                ← Registry of every deep well ever touched, stored or not
    deep-wells/                       ← Physical files for cornerstone-status deep wells — except raw KEJ source manuscripts, which go in restricted/deep-wells/ instead (2026-08-09, see §3)

  family-tree/                        ← Fork-specific — cross-slægt structural data, see §3
    tree.ged                          ← GEDCOM 5.5.1 individuals (INDI) and families (FAM), built incrementally
    possible-duplicates.md            ← Routine same-name-ambiguity tracking — see §3

  grandfather-review/                 ← Fork-specific — see §3, "A Third Layer" below
    queue.md                          ← Open discoveries/connections/inconsistencies/gaps, not yet reviewed
    log.md                            ← Append-only history of what was sent and how KEJ responded

  research-queue.md                   ← Fork-specific — open questions grouped by external resource, see §3

  restricted/                         ← Fork-specific — git submodule, separate private repo, see §3
    README.md                         ← Purpose, access list, the Hard Constraint governing this path
    incoming/                         ← Untriaged raw file landing zone — moved here 2026-08-09, see §3
      README.md                       ← How to drop files here and how they get triaged out
    deep-wells/                       ← Raw KEJ source manuscripts — moved here 2026-08-09, see §3

  projects/                           ← One folder per project
    system/                           ← Pre-created — tracks all structural changes to this system
      session-log.md                  ← Audit log of architecture decisions and changes
      TODO.md                         ← Open system work items and setup checklist
    _template/
      session-log.md
      TODO.md
    [project-name]/
      session-log.md                  ← Turn-by-turn project record
      TODO.md                         ← Open items and done list
      context/                        ← Project-specific working notes
      outputs/                        ← Phase deliverables

  scripts/
    commit-push.ps1
    validate.ps1

  temp/                               ← .gitignored transient artifacts
```

---

## 3. Two-Tier Knowledge Model

### Knowledge layer — stable

Contains what the system knows regardless of which project is active. Changes to this layer require human approval before being committed.

- **`knowledge/flow/operating-principles.md`** — shared across all sessions: core principles, signal vocabulary, knowledge promotion procedure, and layer boundary rules.
- **`knowledge/flow/turn-protocol.md`** — turn format, STATUS signal vocabulary, BLOCKED format.
- **`knowledge/domains/[name]/description.md`** — domain scope, constraints, and load conditions.
- **`knowledge/domains/[name]/knowledge.md`** — domain reference material. Each has a numbered Index — entries name key concepts so a routing LLM can decide which sections to load without reading the whole file.
- **`knowledge/domains/[name]/sources/`** — evidentiary source files a domain's knowledge cites back to, plus a `manifest.md` registry. Present only for domains that have them. See `knowledge/domains/authoring-guidelines.md` §9.1.
- **`library/`** — cross-domain deep-well registry (`reference-index.md`) and, for cornerstone-status works only, the physical files themselves (`deep-wells/`). See `knowledge/domains/authoring-guidelines.md` §9.2–9.3.

### Project layer — append freely

Contains project-specific state that accumulates during work. The LLM appends to these files as it works, without approval gates.

- **`session-log.md`** — the living project record: everything done, decided, and approved.
- **`context/[name].md`** — current working knowledge for this project: relevant background, phase outputs, open questions, and any corrections to knowledge-layer content discovered during the project.

### Knowledge promotion

When something discovered during a project should update the knowledge layer — a factual correction, a newly identified pattern, an outdated reference — the process is:

1. Document the discovery in the project's `context/` notes.
2. Raise a `[FLAG FOR KNOWLEDGE UPDATE]` (format in `knowledge/flow/operating-principles.md` §5).
3. The flag is reviewed by the human, who approves, edits, or rejects it.
4. Only after approval is the change committed to `knowledge/`.

This gate exists because the knowledge layer is loaded by every future session. An incorrect or premature update propagates everywhere. The same gate applies, with one addition, to promoting a deep well from registry-only to physically stored in `library/deep-wells/` — the cornerstone rule (`knowledge/domains/authoring-guidelines.md` §9.3) requires explicit human confirmation before the file is stored.

### Untriaged file intake — fork-specific: `restricted/incoming/` (moved 2026-08-09, formerly `incoming/`)

This fork adds an untriaged-file landing zone for raw files that haven't been triaged yet — not part of the generic template. It exists to solve two distinct problems:

1. **Mechanical, since 2026-08-06:** pulling a large file from an external source (e.g. Google Drive) through an AI tool connector can hit that connector's own size caps and this environment's network policy, independent of anything about the file itself. Pushing the file directly into the repo via a normal git commit — the human's own upload, not a tool fetch — sidesteps both, up to GitHub's own per-file limit (~100 MB without Git LFS).
2. **Confidentiality, discovered 2026-08-09:** raw material lands here *before* anyone — including KEJ himself — has assessed it for content involving a living person. This turned out not to be hypothetical: personal correspondence from KEJ carried a home address and an unresolved family matter incidentally, and this same session's media-extraction work across the Hopp-slægten and Boe-slægten deep wells (`library/deep-wells/*-media/manifest.md`) found repeatedly that KEJ does not reliably recognize when an embedded photograph involves a living person — he has never once flagged an image as a concern, despite several turning out to need restriction. Neither risk is caught by `[SENSITIVE]`-tagging or post-hoc triage; both exist the moment a file becomes readable to anyone with access, which starts at landing, not at triage.

Problem 2 is why this landing zone moved from a top-level `incoming/` in this repo to `restricted/incoming/` inside the private companion repo — see "Restricted companion repo," below, for the access-boundary reasoning and the Hard Constraint carve-out the move required. The mechanics are unchanged: it's tracked in git and durable, unlike `temp/` (§2), which is gitignored and for transient handoff material only. A file here is a to-do, not a permanent home — triage checks it against `projects/archive-digitization/context/intake-manifest.md`, assesses it (including any embedded media, per `knowledge/domains/authoring-guidelines.md` §9.6) independent of whether KEJ flagged anything, and moves it to its real destination: a public `library/deep-wells/`/`knowledge/domains/[name]/sources/` home once confirmed safe, or permanent `restricted/` storage if it needs to stay there. See `restricted/incoming/README.md` for the full procedure. The old `incoming/README.md` is now a one-line pointer to that file.

### Cross-*slægt* structural data — fork-specific: `family-tree/`

This fork adds `family-tree/tree.ged`, a single top-level GEDCOM file — not part of the generic template. Genealogical relationships are inherently cross-*slægt* (marriages connect one family line to another by design), so this data does not belong inside any one domain's folder; it sits alongside `library/` as cross-cutting structural data, built incrementally as each source document is read rather than in one bulk pass. Domain `knowledge.md` files cite into it for the canonical vital-record entry (e.g., "see `family-tree/tree.ged#I4`"), the same pattern used to cite a `library/reference-index.md` entry.

ID assignment is append-only, same discipline as `session-log.md` turn numbers: once `@I137@` exists it is never reused or renumbered, even for a confirmed duplicate (marked merged-into-survivor instead of deleted). Routine same-name ambiguity — expected at volume, given Danish patronymic naming — is tracked in `family-tree/possible-duplicates.md`; only well-evidenced duplicate candidates escalate to `grandfather-review/queue.md`. Full design rationale: `projects/archive-digitization/context/data-structure-proposal.md`.

Since 2026-08-06, `scripts/validate.ps1` also checks `tree.ged` itself on every commit: duplicate or dangling `@I@`/`@F@` ids, full bidirectional `FAMC`/`FAMS`/`HUSB`/`WIFE`/`CHIL` consistency, and unescaped `@` characters left inside free-text `NOTE` fields (as errors), plus a >255-character line-length check (as a warning — Gramps tolerates long lines even though the spec doesn't). Added after a real Gramps import surfaced all of these at once on a file a more lenient parser had accepted without complaint — see `projects/system/session-log.md`.

### A third layer — fork-specific: grandfather review

This fork adds a third layer, `grandfather-review/`, not part of the generic template. It exists because the human operating this repo is not the subject-matter authority his own knowledge-promotion approval would normally imply — Knud Erik Jakobsen (KEJ) is. `grandfather-review/queue.md` behaves like the project layer (appended to freely, no gate on raising an item) but is cross-cutting like `library/` (not scoped to one project or domain). `grandfather-review/log.md` is append-only, same discipline as a `session-log.md`.

The promotion path this layer feeds is stricter than ordinary knowledge promotion: a `[FLAG FOR GRANDFATHER REVIEW]` item never reaches `knowledge/` on the human's approval alone. It is only promoted after KEJ's own explicit confirmation is recorded in `log.md`, at which point it is written into the relevant domain's `knowledge.md` with `[VERIFIED: KEJ, YYYY-MM-DD]`. See `knowledge/flow/operating-principles.md` §5 and `ROUTING.md` Hard Constraints.

Both files in this layer are written in Danish, unlike the rest of this repo — KEJ's English is limited and the research itself is Danish, so translating at send-time would risk losing nuance on every cycle. Each file's own top-of-file note explains this; the `## Version History` section of each is the one part that stays in the repo's standard English convention, so `scripts/validate.ps1` keeps recognizing it.

### External-resource research queue — fork-specific: `research-queue.md`

This fork adds `research-queue.md`, a single top-level file — not part of the generic template. It exists to solve a cost-batching problem distinct from `grandfather-review/`'s: some open questions can't be resolved by KEJ, the family, or anything already in this repo — they need an external resource that costs money or travel to reach (a paid subscription site like MyHeritage, a physical archive visit). Rather than paying or traveling once per question as each one turns up, this file groups open questions **by which resource would resolve them**, so the cost gets spent once against an accumulated batch. Written in English, unlike `grandfather-review/`, since it isn't addressed to KEJ.

### Restricted companion repo — fork-specific: `restricted/`

This fork adds `restricted/`, a **git submodule**, not a plain folder — not part of the generic template. It exists for a confidentiality tier above `[SENSITIVE]`: findings KEJ is fine keeping within the research foundation but does not want shared or publicized without careful review and attached disclaimers. `[SENSITIVE]` (§ Standing Rules, `ROUTING.md`) flags facts about presumed-living people, but it's a prose convention — content tagged `[SENSITIVE]` is exactly as visible as anything else in the repo to anyone who can read the repo at all. This tier needs an actual access boundary, not just a label.

GitHub access control is repo-wide, not per-folder — there is no way to grant someone read access to this repo while withholding one specific folder from them. `restricted/` solves this by being mounted from a genuinely separate, more restricted private repo (`kej-restricted-context-architecture`), pinned via `.gitmodules`. Someone with access to this repo but not to that one sees `restricted/` as an empty, uninitialized directory — a real boundary, not a convention. A `.gitattributes` `export-ignore` entry is defense-in-depth on top of that for archive/ZIP exports.

That access boundary only protects against people (or sessions) without access to the underlying repo. Inside a session where the submodule *is* initialized, `restricted/`'s content is just files on disk, reachable the same way anything else is — so a second, behavioral safeguard exists alongside the technical one: a `ROUTING.md` Hard Constraint that this path is never opened, searched, quoted, or referenced in any output unless the human explicitly names the specific file, by path, in that same turn. The submodule repo's own `README.md` restates this rule for any LLM session operating on it directly, independent of whether this repo's own `ROUTING.md` was loaded first.

As of 2026-08-08, access to `kej-restricted-context-architecture` is Nikolaj Boe only — deliberately narrower than this repo's own collaborator list, and not extended by default when new collaborators are added here.

**`restricted/incoming/` (added 2026-08-09).** The untriaged-file landing zone described in §3 above (formerly a top-level `incoming/` in this repo) now lives here. This required one explicit, narrow exception to the Hard Constraint above, restated in the submodule's own `README.md`: `restricted/incoming/` is checked routinely at the start of every session — the same habit the old main-repo `incoming/` had — rather than only being opened when the human names a specific file that turn. The exception is scoped to that one subfolder; everything else in `restricted/`, including anything `incoming/` triage has already moved into permanent storage here, stays fully gated. This also means intake/triage work now requires access to the restricted repo, not just this one — a narrowing that fits, on reflection: anyone with only main-repo access would only ever need already-cleared material in `knowledge/domains/` and `library/deep-wells/`, never KEJ's raw, unfiltered drops.

**`restricted/deep-wells/` (added 2026-08-09).** Raw KEJ source manuscripts — not their extracted facts or media, which stay public, but the source files themselves (`.doc`/`.docx`). Prompted by an audit (`restricted/remediation-plan-2026-08-09.md`) that found the public repo's git history exposed 155 individuals' unredacted records, 26 sensitive images, and one paternity detail before later redaction, and — separately, and more directly — that the original source manuscripts were sitting unredacted in the public repo's *current* working tree the entire time, since redaction had only ever been applied to content derived from them. Same default as `restricted/incoming/`: a source moves here unless it's already been individually assessed and confirmed to carry no living-person content, not the other way around. See `knowledge/domains/authoring-guidelines.md` §9.2-9.3 for the cornerstone-storage rule this modifies.

**Two redaction categories, not one.** `family-tree/tree.ged` placeholders use two distinct `NAME` markers, and they mean different things:
- **`Living /<surname>/`** — individual has no death date on record, so is treated as presumed living by default (§ Standing Rules). Birth year is kept; full record lives at `restricted/tree-sensitive.ged`.
- **`Withheld /?/`** — an *entire individual's* content is restricted by KEJ's explicit instruction, independent of vital status. Not currently used by any individual: the case that prompted it (`@I164@`, a disputed-paternity matter) turned out to need something narrower — his basic identity was already public and non-sensitive, only the surrounding investigative narrative was restricted, which fits as ordinary `NOTE`-level content in `restricted/tree-sensitive.ged` without redacting the person himself. Kept as a category for the case where a whole individual's record genuinely does need this treatment.

Both categories point to `restricted/tree-sensitive.ged`, and both are covered by the `scripts/validate.ps1` placeholder-regression guard. `restricted/grandfather-review-queue.md` is the same idea applied to the `grandfather-review/` mechanism: when an open question itself turns out to be `Withheld`-tier, the public `queue.md`/`log.md` entries become neutral stubs and the full question-and-answer moves here instead of being deleted outright.

---

## 4. Dynamic Routing

Routing is the mechanism by which the system decides what to load and what to do next. It is defined in `ROUTING.md` (Steps 1–4) and elaborated in `knowledge/flow/routing-rules.md`.

### Routing inputs

- The request content (Step 2 table match)
- The current project's last STATUS signal
- Open flags and outstanding human asks
- Explicit human override instructions
- Retirement status of matched domains/projects — `Retired` entries are excluded from default routing (`ROUTING.md` Step 4, `knowledge/domains/index.md`)

### Priority order

1. Human override
2. Hard blocker (`STATUS: BLOCKED`)
3. Approval gate
4. Explicit rework signal
5. Signal-driven default phase progression
6. Safe fallback (`STATUS: WAITING FOR HUMAN`)

---

## 5. Subproject Transcendence

A session focused on Project A may produce findings that belong in Project B (or in the knowledge layer itself). This creates a recurring tension: act immediately (convenient but untracked) or defer entirely (clean but easy to forget).

**Correct handling:**

| Finding type | Where it belongs | How to handle |
|---|---|---|
| Knowledge correction or new domain fact | Knowledge layer (`knowledge/domains/`) | Raise `[FLAG FOR KNOWLEDGE UPDATE]` — do not edit directly |
| Structural or routing improvement to the system itself | System project `session-log.md` | Raise `[FLAG FOR SYSTEM]` and append a handoff turn at session end |
| Project-specific discovery | Source project's `context/` | Document in-session in the appropriate context file |
| Template-level finding — a bug or gap inherited from the upstream template, not specific to this fork | This fork's own `projects/system/TODO.md` (Upstream Feedback Log) | Raise `[FLAG FOR UPSTREAM]` — never write directly to the upstream repo, even if it's accessible; the human relays confirmed entries. See `knowledge/flow/upstream-sync.md` §7. |

Do not act on knowledge-layer or system-layer changes from within another project's session. Surface them as flags, hand off via session-log, and resolve in the correct project.

---

## 6. Setting Up a New Instance

To fork this template for a new initiative:

1. **Rename** the repo to `[initiative-name]-context-architecture`.
2. **Configure your LLM entry point** — in VS Code with GitHub Copilot, update `.github/copilot-instructions.md` and replace `[Project Name]` with your initiative name. For other setups (Cursor, Claude Projects, custom system prompts), load `ROUTING.md` directly at session start through your environment's equivalent mechanism.
3. **Update `ROUTING.md`** — replace the document purpose, update routing table rows.
4. **Define your knowledge domains** — copy `knowledge/domains/example-domain/`, rename, fill in `description.md` and `knowledge.md`.
5. **Register domains** in `knowledge/domains/index.md`.
6. **Create your first project** — copy `projects/_template/`, rename, write Turn 1 in `session-log.md`.
7. **Remove example content** — delete `example-domain/` and `example-project/` once replaced.
8. **Initialize git** — run `git init`, add remote, push.
9. **Set up Upstream Template Sync tracking** — add the System Maintenance Pass section to your own `projects/system/TODO.md`, recording this fork's starting commit as the initial "last synced" point. See `knowledge/flow/upstream-sync.md` §2 for the exact format and the rest of this mechanism.
10. **Activate the git hooks** — run `git config core.hooksPath .githooks` once per clone. This is local git config, not something a fresh clone inherits, so it needs re-running after every fresh clone (a Claude Code session's `.claude/hooks/session-start.sh` does this automatically; other setups need the manual command). One command activates both hooks: the pre-commit hook enforces that system-layer edits are logged in `projects/system/session-log.md` in the same commit (`scripts/pre-commit-check.ps1`); the pre-push hook enforces the Hard Constraint that pushes default to `main` unless deliberately bypassed (`scripts/pre-push-check.ps1`).
11. **(Optional) Set up a restricted-tier companion repo** — only if the fork will systematically handle real third-party sensitive/restricted material (personal records, confidential documents, regulated data) at volume, and only before ingesting the first real source file. See `knowledge/flow/restricted-tier.md`. Most forks won't need this — occasional sensitive content is already covered by `ROUTING.md`'s pause-and-ask Hard Constraint and the pre-commit secret-pattern check. This fork already has one — `restricted/`, §3 above — built for exactly this reason.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-06-29 | Initial creation. Generic context architecture system design document. |
| 1.1 | 2026-07-16 | §2 File Structure and §3 Two-Tier Knowledge Model updated for the new `sources/` per-domain folder and top-level `library/` deep-well registry, and a cornerstone-promotion note added to the knowledge promotion procedure (§3). See `knowledge/domains/authoring-guidelines.md` §9. |
| 1.2 | 2026-07-24 | §6 (Setting Up a New Instance) gained a step for setting up Upstream Template Sync tracking. See `knowledge/flow/upstream-sync.md`, the new mechanism a fork uses to check for and apply upstream template changes. |
| 1.3 | 2026-07-25 | §4 Routing inputs gained a bullet for domain/project retirement status — `Retired` entries are excluded from default routing. See `MarkdownConventions.md` §1 and `knowledge/domains/index.md` § Retiring a Domain for the underlying convention. |
| 1.4 | 2026-07-25 | §6 gained a step for activating the new `.githooks/pre-commit` hook (`git config core.hooksPath .githooks`), which mechanically enforces that system-layer edits are logged in the same commit. See `scripts/pre-commit-check.ps1`. |
| 1.5 | 2026-08-05 | Fork-specific addition (`kej-context-architecture`): new top-level `grandfather-review/` folder (§2) and a new §3 subsection, "A third layer — fork-specific: grandfather review," documenting why this fork's knowledge-promotion gate is stricter than the generic template's — the grandfather, not the human operating this repo, is the subject-matter authority whose explicit confirmation genealogical findings require. See `knowledge/flow/operating-principles.md` §5 and `ROUTING.md` Hard Constraints. |
| 1.6 | 2026-08-05 | §3 noted that `grandfather-review/`'s two files are written in Danish, unlike the rest of the repo — the grandfather's English is limited and the research itself is Danish. |
| 1.7 | 2026-08-05 | §3 prose now refers to Knud Erik Jakobsen by name/initials (KEJ) rather than "the grandfather," per the human's preference — including the `[VERIFIED: KEJ, YYYY-MM-DD]` signal value. The `grandfather-review/` folder name and the `[FLAG FOR GRANDFATHER REVIEW]` tag are kept as-is — stable structural identifiers, not prose. |
| 1.8 | 2026-08-06 | Fork-specific addition: created the actual `family-tree/tree.ged` (GEDCOM) and `family-tree/possible-duplicates.md`, previously only sketched in `projects/archive-digitization/context/data-structure-proposal.md` — human confirmed the "wait for real data" threshold was passed once two full generations of Boe-slægten data were in hand. §2 file structure diagram and new §3 subsection "Cross-*slægt* structural data — fork-specific: `family-tree/`" added. |
| 1.9 | 2026-08-06 | Fork-specific addition: created `incoming/`, a tracked (non-gitignored) landing zone for untriaged raw files, after the Boe-slægten manuscript's original `.docx` repeatedly hit a Google Drive connector's 10 MB download cap plus this environment's network policy blocking direct Drive access — pulling large files through an AI tool connector was becoming unsustainable, so the human now pushes them into the repo directly instead. §2 file structure diagram and new §3 subsection "Untriaged file intake — fork-specific: `incoming/`" added; explicitly distinguished from `temp/`, which is gitignored and for transient material only. |
| 1.10 | 2026-08-07 | Fork-specific addition: created `research-queue.md`, a single top-level file grouping open research questions by which external resource (paid subscription site, physical archive trip) would resolve them — prompted by a paywalled MyHeritage lead on an American emigrant ancestor, to batch subscription/travel cost against an accumulated pile of questions rather than spending it per question. §2 file structure diagram and new §3 subsection "External-resource research queue — fork-specific: `research-queue.md`" added. Distinct from `grandfather-review/` (questions only KEJ can answer) and `family-tree/possible-duplicates.md` (routine ambiguity resolved by evidence already in hand). |
| 1.11 | 2026-08-08 | Fork-specific addition: created `restricted/`, a git submodule mounting a separate, more restricted private repo (`kej-restricted-context-architecture`) for a confidentiality tier above `[SENSITIVE]` — findings KEJ wants kept within the research foundation but not shared or publicized without review and disclaimers. Prompted by realizing `[SENSITIVE]` is a prose convention, not an access boundary, and that GitHub access control is repo-wide rather than per-folder. §2 file structure diagram and new §3 subsection "Restricted companion repo — fork-specific: `restricted/`" added; matching `ROUTING.md` Hard Constraint added so a session with the submodule initialized doesn't surface it unprompted. |
| 1.12 | 2026-08-08 | Added a second `family-tree/tree.ged` redaction category, `Withheld /?/`, distinct from the existing `Living /<surname>/` — for content KEJ explicitly instructed never be published regardless of whether the person is alive (first case: a disputed-paternity matter, `@I164@`). Also added `restricted/grandfather-review-queue.md`, mirroring `grandfather-review/queue.md` and `log.md` for cases where an open question itself turns out to be `Withheld`-tier — the public files get a neutral stub, full content moves to the restricted mirror rather than being deleted. Prompted by KEJ's first substantive reply since `restricted/` was built, which contained exactly this kind of material, some of which had already been sitting in the public repo (added before `restricted/` existed) and had to be retroactively pulled. |
| 1.13 | 2026-08-08 | Correction to 1.12: the human clarified that `@I164@`'s basic identity wasn't actually restricted-tier — it was already public and non-sensitive (from the manuscript itself); only KEJ's own follow-up narrative around it was. Restored `@I164@` to a full public record; the restricted content narrowed to a `NOTE` in `restricted/tree-sensitive.ged`, not a redacted individual. `Withheld /?/` stays defined for the case it does fit, but currently has zero instances. |
| 1.14 | 2026-08-09 | **`incoming/` moved to `restricted/incoming/`,** per explicit human decision. Prompted by two incidents in one session: a home address surfaced incidentally in KEJ's own correspondence, and this session's media-extraction work confirmed KEJ doesn't reliably recognize when an embedded photo involves a living person — so landing raw material anywhere world-readable before independent review is a real exposure window, not a formality. §2 diagram updated (old `incoming/` is now a pointer only); §3's subsection rewritten with the two-problem framing (mechanical + confidentiality); "Restricted companion repo" section gained a paragraph on the new subfolder and the one explicit, scoped exception this required to the "never opened unless named that turn" Hard Constraint. Matching updates to `ROUTING.md`, `scripts/validate.ps1`, and `projects/archive-digitization/TODO.md`. |
| 1.15 | 2026-08-09 | **Phase 1 of `restricted/remediation-plan-2026-08-09.md`:** an audit (prompted by the human asking whether git history and the stored source documents were themselves exposure risks) found the public repo's history had carried 155 individuals' unredacted records, 26 sensitive images, and one paternity detail before later redaction — and, separately, that the raw source manuscripts were sitting unredacted in the public repo's *current* working tree the whole time, since redaction only ever applied to derived content. Human declined making the public repo private (accepted that risk deliberately) but approved moving the live sources: all raw KEJ manuscripts moved from `library/deep-wells/` to the new `restricted/deep-wells/`. "Restricted companion repo" section gained a matching paragraph. A git history rewrite (Phase 2) is planned but held pending a confirmed backup. |
| 1.16 | 2026-08-25 | Upstream sync from `proto-context-architecture` (`86d4eddb`..`1b7401d`). §5 Subproject Transcendence gained a fourth row for template-level findings, routed to this fork's own Upstream Feedback Log via `[FLAG FOR UPSTREAM]`, never written directly to the upstream repo. §6 step 10 reworded from "activate the pre-commit hook" to "activate the git hooks" (one `core.hooksPath` command now also activates the new `pre-push` hook enforcing the `main`-by-default Hard Constraint); added an optional step 11 for the restricted-tier companion-repo pattern, noting this fork already has one. **Not adopted:** the "deep well" → "reference work" rename and the generic top-level `incoming/` addition — both upstream changes conflict with or are superseded by this fork's own already-diverged, more specific implementations (`library/deep-wells/` terminology throughout; this fork's `incoming/` was deliberately moved into `restricted/incoming/` on 2026-08-09 for reasons upstream's generic version doesn't share). See `ROUTING.md` v1.23 and `projects/system/session-log.md` for the full sync record. |
