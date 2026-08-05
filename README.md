# Kej Context Architecture

> **If you are an LLM:** stop reading this file and open `ROUTING.md` instead. That file contains your routing instructions.

---

This repo is the **research knowledge base** for a family genealogy research project (*slægtsforskning*) — structured, sourced findings organized per family line (*slægt*). It is a fork of the generic [context architecture](https://github.com/sunshinezip/proto-context-architecture) template.

**What this repo is not:** the public website. A website to publish curated parts of this research is a real future goal, but its code and deployment will live in a separate repo, created later. This repo holds a thin reference domain (`website-infrastructure`) documenting that plan and, once the second repo exists, how to maintain it — for our own reference, not because this repo hosts it.

**Why this repo exists, plainly stated:** decades of research material currently sit, largely unsorted and with no real backup, on one laptop. Getting that material into git and pushed to GitHub is itself a meaningful safety improvement — redundancy against fire, theft, or the laptop simply dying — independent of any further structuring. Everything else this repo does (domains, sources, validity signals) is a second, additional benefit on top of that first one.

---

## How it works

- **Knowledge domains** (`knowledge/domains/`) hold deep, curated knowledge about specific subject areas — one per *slægt*, plus supporting domains like `website-infrastructure`.
- **Evidentiary sources** (`knowledge/domains/[slægt]/sources/`) hold the primary documents a claim cites back to — church records (*kirkebøger*), census records (*folketællinger*), certificates, letters, captioned photographs. Small and definitive; always stored.
- **Deep wells** (`library/`) hold large, cross-*slægt* reference material mined incrementally — e.g. a scanned parish record book spanning multiple families and decades.
- **Flow files** (`knowledge/flow/`) define the operating principles, turn protocol, routing rules, and project templates that govern how sessions behave.
- **Projects** (`projects/`) each have a session log (append-only turn record) and a TODO list. The AI works through projects by appending turns to the session log.
- **Routing** (`ROUTING.md`) is a four-step instruction set loaded by the AI at the start of every session. It tells the AI what to load and how to behave based on the request.
- **Validity signals** (`[VERIFIED: source]` / `[UNVERIFIED]` / `[CONTRADICTS: source]` / `[OUTDATED: date]`) are applied rigorously here — this maps directly onto how genealogical research is already graded (a primary record outranks family oral tradition; conflicting records are tracked, not silently resolved). See `MarkdownConventions.md` §8.
- **Privacy:** `[SENSITIVE]` is applied to anything involving living relatives — addresses, health information, or anything else that surfaces incidentally but shouldn't be casually re-shared.

For the full structural design: see [Architecture.md](Architecture.md).

---

## Setup status

This fork deliberately deviates from the template's default domain-first setup order, because the real *slægt* list can't be known until the source material — a large, unsorted pile of digital documents — has actually been triaged. The sequence being followed:

1. **Repo skeleton and conventions** (this commit) — fork the template, adapt routing and entry points, scaffold a `website-infrastructure` reference domain.
2. **Archive Digitization project** — get the raw material off the laptop, into the repo, and roughly triaged by likely *slægt* and source type. Includes explicitly flagging the handwriting-transcription problem (older church records may be in Gothic/Kurrent script) as unsolved, not assumed away.
3. **Domain buildout** — once the real *slægt* list is confirmed and material is triaged, create each *slægt* domain properly, with `sources/` used from day one for primary documents.

See `projects/system/TODO.md` and `projects/system/session-log.md` for current status.

For domain authoring standards: see [knowledge/domains/authoring-guidelines.md](knowledge/domains/authoring-guidelines.md).

---

## Folder structure

```
kej-context-architecture/
  README.md                           ← This file — human overview
  ROUTING.md                          ← LLM routing instructions (Steps 1-4)
  Architecture.md                     ← System design reference
  MarkdownConventions.md              ← Markdown standards for all files
  .github/
    copilot-instructions.md           <- VS Code + Copilot adapter — loads ROUTING.md
                                         (for other LLM setups, load ROUTING.md directly)

  knowledge/
    flow/
      operating-principles.md         ← Core principles, signals, layer boundaries
      turn-protocol.md                ← Turn format, STATUS signals, BLOCKED format
      routing-rules.md                ← Routing logic for structured work
      project-types.md                ← Project type definitions and phase templates
      upstream-sync.md                ← How this fork checks for and applies template updates
    domains/
      index.md                        ← Domain registry
      authoring-guidelines.md         ← Standards for writing domain knowledge
      website-infrastructure/         ← Reference domain for the future public website (stub — pending)
        description.md
        knowledge.md
      [slægt-name]/                   ← One per family line, added as Phase 3 unfolds
        description.md                ← Domain scope, constraints, when to load
        knowledge.md                  ← Domain reference material
        sources/                      ← Evidentiary source files (only if this domain has any)
          manifest.md                 ← Registry of the raw files in this folder

  library/                            ← Cross-domain deep-well registry
    reference-index.md                ← Registry of every deep well, stored or not
    deep-wells/                       ← Physical files for cornerstone-status deep wells only

  projects/
    system/                           ← Pre-created — audit log for structural changes to this system
      session-log.md
      TODO.md
    _template/                        ← Copy this when starting a new project
      session-log.md
      TODO.md
    [project-name]/
      session-log.md                  ← Turn-by-turn record — append only
      TODO.md                         ← Open items and done list
      context/                        ← Project-specific working notes (optional)
      outputs/                        ← Phase deliverables (optional)

  scripts/
    commit-push.ps1                   ← Stage, commit, and push all changes
    validate.ps1                      ← Structural integrity check

  temp/                               ← Transient handoff artifacts (.gitignored)
```

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-06-29 | Initial creation. Generic context architecture template. |
| 1.1 | 2026-06-29 | Rewritten as human-readable document. LLM routing instructions moved to ROUTING.md. |
| 1.2 | 2026-07-16 | Added `library/` (cross-domain deep-well registry) and the per-domain `sources/` folder to the folder structure diagram — see `knowledge/domains/authoring-guidelines.md` §9. Also fixed a pre-existing formatting break in the `projects/` block of this same diagram (missing line breaks had collapsed three tree rows onto one line). |
| 1.3 | 2026-08-05 | Forked from `proto-context-architecture` (upstream commit `86d4eddb6211b623a0e5a9ea047528076533ea8a`) for family genealogy research (*slægtsforskning*). Adapted human-facing overview: research-knowledge-base framing, the backup-safety rationale stated plainly, the inventory-first setup deviation, and the folder structure diagram updated for a `website-infrastructure` reference domain and per-*slægt* domains. |
