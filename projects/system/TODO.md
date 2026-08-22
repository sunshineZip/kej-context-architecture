---
type: project
project: system
---

# System — TODO

Version 1.2 | 2026-08-09 | Active

> **Routing check:** This is a task tracking file, not a work queue. Do not start work on any item here unless you have completed ROUTING.md routing and received explicit human confirmation for this session.

> **Push policy:** Nearly every change made while working in this project must be committed and pushed (`.\scripts\commit-push.ps1`) — see `ROUTING.md` Standing Rules for cadence guidance. If a push is deferred until a work segment finishes, flag it explicitly to the human before the turn ends; the human may end the session at any point.

---

## Open

- [ ] Confirm the full list of *slægt* (family line) names with the family — KEJ's manifest names at least Boe, Hopp, Dølby (Bruno's line), and Inge's slægt (Rahbæk-Østergaard, Neermann); Svend Åge Pedersen's 7 slægter may be more still
- [ ] Resolve open classification questions from the intake manifest: mills/Lokalarkiv as `library/` deep wells, Hopp-surname-research connection, Svend Åge Pedersen's slægter status — see `projects/archive-digitization/TODO.md`
- [ ] Decide an approach to handwriting transcription for older Danish church records (possibly Gothic/Kurrent script) — manual transcription, a specialized OCR tool, or the family's own knowledge of the handwriting. Not yet solved — see `research-queue.md`'s new kirkebog entries, which will need this the moment either is acted on
- [ ] Fill in `knowledge/domains/website-infrastructure/knowledge.md` §3–5 once the website repository is created
- [ ] Human to review `grandfather-review/queue.md` (20 items total, 15 open as of 2026-08-09) and send it to KEJ when it feels due (no fixed cadence — his own schedule)
- [ ] Refine the Danish citation templates in `authoring-guidelines.md` §9.5 (kirkebog/folketælling/skifteprotokol) once real parish/census/probate material is actually in hand — they're a starting adaptation of Evidence Explained's general logic, not a finished translation. Still nothing but KEJ's own narrative manuscripts processed so far, no raw parish records yet
- [ ] **Long-term, not urgent:** once material is organized into real domains with proper citations, consider depositing it with a recognized Danish genealogy institution — verified two concrete avenues (2026-08-05): **Danskernes Historie Online** (formerly Slægtsforskernes Bibliotek, run by Danske Slægtsforskere/DIS-Danmark) explicitly accepts donated family-history manuscripts (physical, electronic, or scanned) and digitizes them for the community; **local archives via arkiv.dk** (e.g. Sundsøre Lokalarkiv, already in the intake manifest) welcome personal/family papers, though not every lokalarkiv feeds arkiv.dk. Rigsarkivet has a formal "submit research data" process too, but it reads as institutional/bureaucratic (questionnaires, transfer-obligation determination) rather than a natural fit for a personal compilation — would need a direct inquiry to know for sure. Worth raising with KEJ — he may already know these channels, or have views on whether he wants this shared at all.
- [ ] **New (2026-08-09), from the Upstream Template Sync check below:** decide whether/how to reconcile 10 commits' worth of upstream drift, most notably upstream's own generalized `knowledge/flow/restricted-tier.md` — which this fork's own restricted-tier work (built independently, before upstream's version existed) directly informed. See the Upstream Template Sync section for the full commit list; nothing has been applied yet, this is a report only.

---

## Done

- [x] System project created (2026-08-05, on fork)
- [x] Forked `proto-context-architecture` (upstream commit `86d4eddb6211b623a0e5a9ea047528076533ea8a`) into `kej-context-architecture` (2026-08-05)
- [x] Adapted `README.md`, `ROUTING.md`, `.github/copilot-instructions.md`, `knowledge/domains/index.md` for this initiative (2026-08-05)
- [x] Scaffolded `website-infrastructure` as a thin stub domain (2026-08-05)
- [x] Created `projects/archive-digitization/` (Phase 2) and transcribed KEJ's full intake manifest (53 items, 8 categories) (2026-08-05)
- [x] Built the `grandfather-review/` mechanism — new flag type, `queue.md` + `log.md`, Hard Constraint naming KEJ as final authority on genealogical conclusions (2026-08-05)
- [x] Adopted GPS and an Evidence Explained-derived citation format as this repo's explicit research/citation standard (`authoring-guidelines.md` §9.5), with Danish-adapted templates (2026-08-05)
- [x] Received the "2024 Boe-slægen fra Mors og Fur.docx" file from the human (2026-08-06) and fully read it, along with the "Forskellige Boe-slægter" comparative compilation (2026-08-08) — see `projects/archive-digitization/TODO.md` Done for the full extraction history
- [x] Built `research-queue.md` — a mechanism for batching external-resource questions (paid subscriptions, archive visits) by source rather than acting on each as it's found (2026-08-07)
- [x] Built the two-tier restricted-content architecture, prompted by a full exposure audit finding the public repo's git history and live working tree had exposed ~150 individuals' unredacted records, 26 images, a paternity detail, and every raw source manuscript (2026-08-09): a private `kej-restricted-context-architecture` companion repo mounted as a submodule at `restricted/`; the Hard Constraint gating it (with the one `incoming/` exception); `incoming/` and its triage discipline moved there from the main repo; the `authoring-guidelines.md` §9.3 Cornerstone Rule extension (raw sources default restricted); the `tree.ged`/`tree-sensitive.ged` placeholder-and-pointer pattern; the `grandfather-review/queue.md` restricted counterpart; a `git-filter-repo` history rewrite removing the historical exposure, with exhaustive before/after verification. Full account: `restricted/remediation-plan-2026-08-09.md`, `session-log.md` Turns 41-43. **This work was later written up as a generalized LLM-to-LLM report (2026-08-09) and appears to have directly informed upstream's own `knowledge/flow/restricted-tier.md` (added 2026-08-11) — see the Upstream Template Sync section below.**
- [x] Decided against giving the restricted repo its own `ROUTING.md`, deliberately, after the human asked whether routing/processing structure should move there as it grew into the de facto home for raw material — documented in `restricted/README.md`'s "Why this repo has no `ROUTING.md`" section (2026-08-09)
- [x] **Phase 3 — first two real *slægt* domains created (2026-08-09):** `knowledge/domains/boe-slaegten/` and `knowledge/domains/hopp-slaegten/`, promoted from the fully-read manuscript chapters, synthesizing what had previously only lived in `projects/archive-digitization/context/*-extraction.md` working notes. Registered in `knowledge/domains/index.md`, routed in `ROUTING.md` Step 2, cross-referenced from `library/reference-index.md`'s four affected deep-well entries. `family-tree/tree.ged` remains the authoritative structured record; the new domains cover overview, notable history, the Hopp direct-line confirmation boundary, and open questions.

---

## System Maintenance Pass

**Upstream Template Sync**
- Upstream: https://github.com/sunshinezip/proto-context-architecture
- Last synced commit: 86d4eddb6211b623a0e5a9ea047528076533ea8a
- Last synced date: 2026-08-05
- **Last checked (not applied): 2026-08-09.** 10 commits since the last sync, all touching tracked paths — nothing applied yet, this is the Check Procedure report only (`knowledge/flow/upstream-sync.md` §4):
  - `3495dc6` Add multi-writer git safety: fetch-before-push, rebase, and re-validate
  - `15d31c0` Rename "deep well" to "reference work" and flatten `library/` structure
  - `e1876ca` Add sensitive/confidential-content handling: Hard Constraint, secret-scan pre-commit check, opt-in restricted-tier pattern (`knowledge/flow/restricted-tier.md`) — **generalizes this fork's own restricted-tier work, built independently a day or two before this commit; see the Done entry above**
  - `f5e4774` Add downstream feedback mechanism: forks log template-level findings for human relay, never write upstream directly
  - `c89f4a5` Fix phantom-file bug in source manifest validation
  - `2ed0353` Add generic `incoming/` folder to base template; restricted-tier's is now the restricted variant of it, not its origin
  - `02161b9` Add Index structural-integrity and domain-heaviness checks to `validate.ps1`
  - `5ac566c` Promote main-by-default from Standing Rule to Hard Constraint, backed by a new pre-push hook
  - `cd12398` Add session-start sync check, closing the cross-interface staleness gap
  - `46bb419` Log context-engineering/industry-tooling ambitions to the system backlog

  Not reconciled against this fork's own customizations yet — that's a real piece of work (10 commits touching `ROUTING.md`, `Architecture.md`, `MarkdownConventions.md`, `README.md`, `authoring-guidelines.md`, `knowledge/flow/*`, and several scripts, most of which this fork has already diverged from in fork-specific ways) worth scoping on its own rather than folding into routine maintenance. See `knowledge/flow/upstream-sync.md` §5 for the Apply Procedure whenever that's greenlit.

See `knowledge/flow/upstream-sync.md` for the check/apply procedure. Run opportunistically — not on a schedule.
