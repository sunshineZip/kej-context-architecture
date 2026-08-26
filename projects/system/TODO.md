---
type: project
project: system
---

# System — TODO

Version 1.4 | 2026-08-25 | Active

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
- [ ] **Not urgent:** a future Maintenance Pass could clear the ~85 pre-existing orphan-Index-entry warnings the new `validate.ps1` structural check (2026-08-25 sync) surfaced across `intake-manifest.md` and a couple of other files — ordinary content upkeep, not a sync-scope item.

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
- [x] **Full upstream sync applied (2026-08-25):** reconciled all 17 tracked-path files against 15 commits of upstream drift (`86d4eddb`..`1b7401d`) via the Apply Procedure — new multi-writer git safety (`git-collaboration.md`, `sync-check.ps1`, fetch/rebase logic in `commit-push.ps1`), the pre-push branch-default hook, the secret-pattern pre-commit scan, the formal `[FLAG FOR UPSTREAM]`/§7 Downstream Feedback mechanism, and new `validate.ps1` checks (Index structural integrity, domain heaviness, cross-reference scope-exclusion differentiation). Confirmed both of this fork's own prior `[FLAG FOR UPSTREAM]` findings had already landed upstream, crediting this fork by name. Deliberately skipped the cosmetic "deep well" → "reference work" rename and the generic top-level `incoming/` addition — both conflict with or are superseded by this fork's own already-diverged implementations. `validate.ps1` passes clean (0 errors) after the sync; a handful of pre-existing structural gaps it newly surfaced (a wrong Danish-character anchor, a missing `## 5.` heading, three missing "Version History" Index entries) were fixed as direct byproducts. Full account: `session-log.md` Turn 56.

---

## System Maintenance Pass

**Upstream Template Sync**
- Upstream: https://github.com/sunshinezip/proto-context-architecture
- Last synced commit: 1b7401d
- Last synced date: 2026-08-25

See `knowledge/flow/upstream-sync.md` for the check/apply procedure (now including the formal §7 Downstream Feedback mechanism, adopted in the 2026-08-25 sync). Run opportunistically — not on a schedule.

**Upstream Feedback Log**

*(Confirmed template-level findings — not yet relayed, or relayed but not yet confirmed landed upstream. Delete an entry once it's confirmed relayed and landed, or the human says it's been handled otherwise.)*

*(No open entries. The two findings this fork previously logged here — external-review-authority flag type, and the structured-data cross-reference redaction gotcha — were confirmed landed upstream during the 2026-08-25 sync (`git-collaboration.md` commit history and `restricted-tier.md` v1.2 respectively both credit this fork by name) and have been removed per this section's own lifecycle rule.)*
