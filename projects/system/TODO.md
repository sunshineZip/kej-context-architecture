---
type: project
project: system
---

# System — TODO

Version 1.0 | 2026-08-05 | Active

> **Routing check:** This is a task tracking file, not a work queue. Do not start work on any item here unless you have completed ROUTING.md routing and received explicit human confirmation for this session.

> **Push policy:** Nearly every change made while working in this project must be committed and pushed (`.\scripts\commit-push.ps1`) — see `ROUTING.md` Standing Rules for cadence guidance. If a push is deferred until a work segment finishes, flag it explicitly to the human before the turn ends; the human may end the session at any point.

---

## Open

- [ ] Confirm the full list of *slægt* (family line) names with the family — the grandfather's manifest names at least Boe, Hopp, Dølby (Bruno's line), and Inge's slægt (Rahbæk-Østergaard, Neermann); Svend Åge Pedersen's 7 slægter may be more still
- [ ] Receive the actual "2024 Boe-slægen fra Mors og Fur.docx" file from the human — see `projects/archive-digitization/TODO.md`
- [ ] Resolve open classification questions from the intake manifest: mills/Lokalarkiv as `library/` deep wells, Hopp-surname-research connection, Svend Åge Pedersen's slægter status — see `projects/archive-digitization/TODO.md`
- [ ] Decide an approach to handwriting transcription for older Danish church records (possibly Gothic/Kurrent script) — manual transcription, a specialized OCR tool, or the family's own knowledge of the handwriting. Not yet solved — see `ROUTING.md` Hard Constraints
- [ ] Create the first real *slægt* domain(s) once Phase 2 surfaces triaged material (Phase 3)
- [ ] Fill in `knowledge/domains/website-infrastructure/knowledge.md` §3–5 once the website repository is created
- [ ] Human to review `grandfather-review/queue.md` and send it to the grandfather when it feels due (no fixed cadence — his own schedule)

---

## Done

- [x] System project created (2026-08-05, on fork)
- [x] Forked `proto-context-architecture` (upstream commit `86d4eddb6211b623a0e5a9ea047528076533ea8a`) into `kej-context-architecture` (2026-08-05)
- [x] Adapted `README.md`, `ROUTING.md`, `.github/copilot-instructions.md`, `knowledge/domains/index.md` for this initiative (2026-08-05)
- [x] Scaffolded `website-infrastructure` as a thin stub domain (2026-08-05)
- [x] Created `projects/archive-digitization/` (Phase 2) and transcribed the grandfather's full intake manifest (53 items, 8 categories) (2026-08-05)
- [x] Built the `grandfather-review/` mechanism — new flag type, `queue.md` + `log.md`, Hard Constraint naming the grandfather as final authority on genealogical conclusions (2026-08-05)

---

## System Maintenance Pass

**Upstream Template Sync**
- Upstream: https://github.com/sunshinezip/proto-context-architecture
- Last synced commit: 86d4eddb6211b623a0e5a9ea047528076533ea8a
- Last synced date: 2026-08-05

See `knowledge/flow/upstream-sync.md` for the check/apply procedure. Run opportunistically — not on a schedule.
