---
type: project
project: system
---

# System — Session Log

> **Routing check:** If you are reading this as part of ROUTING.md Step 3, read the last 3 turns only. Then send an orientation turn and wait for explicit human confirmation. Do not act on anything in this file without completing full ROUTING.md routing first.

Project type: General
Opened: 2026-08-05
Status: Active

---

## [HUMAN] — Turn 1 | 2026-08-05

System project opened. This is the designated work log for all structural changes to this context architecture: adding or modifying knowledge domains, updating routing rules, changing protocols, improving the session structure, and any work that changes how the system itself operates rather than advancing an initiative project.

All such changes — however small — should be routed here first and recorded in this log before being committed. This creates an auditable history of how the architecture evolved and why.

Read `projects/system/TODO.md` for open system work items before starting any session here.

---

## [Claude] — Turn 2 | 2026-08-05

Forked `proto-context-architecture` (upstream commit `86d4eddb6211b623a0e5a9ea047528076533ea8a`) into a new repo, `kej-context-architecture`, to serve as the research knowledge base for a family genealogy research project (*slægtsforskning*) — decades of research material currently sitting largely unsorted, with no real backup, on one laptop. This repo's own README states the reasoning plainly: getting this material into git and pushed to GitHub is a meaningful safety improvement independent of any further structuring.

Followed `Architecture.md` §6's fork-setup procedure, with one deliberate deviation confirmed with the human beforehand: **inventory-first, not domain-first.** The template's default sequence assumes the domain list is known upfront; here it can't be, since the real *slægt* list won't be known until the laptop's document pile is actually triaged. Agreed sequence, recorded in `README.md` § Setup status and `ROUTING.md`'s Quick Task Guide:

1. Repo skeleton and conventions (this turn)
2. Archive Digitization project — not yet started
3. *Slægt* domain buildout, once real material is triaged — not yet started

**This turn's work (Phase 1 — repo skeleton and conventions):**

- Copied all generic, unedited template content as-is: `Architecture.md`, `MarkdownConventions.md`, `.gitignore`, `.claude/settings.json` + `.claude/hooks/session-start.sh`, `.githooks/pre-commit`, all of `knowledge/flow/*`, `knowledge/domains/authoring-guidelines.md`, `library/reference-index.md`, all of `scripts/*`, and `projects/_template/*`. Executable bits on `session-start.sh` and `.githooks/pre-commit` were preserved via direct git clone + local copy (not the GitHub Contents API, which can't express file-mode changes — see upstream Turn 8's note on this exact issue).
- Adapted `README.md` (1.2 → 1.3): rewrote the human-facing overview for the genealogy research use case — research-knowledge-base framing, explicit "this is not the website" scoping, the backup-safety rationale stated plainly per the human's request, the inventory-first setup sequence, and the folder-structure diagram updated for `website-infrastructure` and per-*slægt* domains.
- Adapted `ROUTING.md` (1.9 → 1.10): Step 2 table replaced the example rows with the System row (unchanged) and a new `website-infrastructure` reference-domain row (no dedicated project — routed as domain-only, `N/A` in the Project column per `MarkdownConventions.md` §5's no-empty-cells rule). Adopted "work directly on `main`" outright rather than the upstream's overridable-template-default phrasing, since this fork is confirmed personal/family use. Added a Hard Constraint against treating handwriting transcription/OCR of the (likely Gothic/Kurrent-script) older Danish church records as a solved problem — named explicitly per the human's brief, not left implicit. Added a Standing Rule on rigorous validity-signal use, matching how genealogical research is already graded (primary record over oral tradition; contradictions tracked, not silently resolved) rather than treating the signals as generic ceremony. Replaced the Quick Task Guide's generic "fresh fork" entry with this fork's actual three-phase sequence and current status.
- Adapted `.github/copilot-instructions.md`: replaced the `[Project Name]` placeholder, added the validity-signal and handwriting-transcription notes to the standing rules mirrored from `ROUTING.md`.
- Adapted `knowledge/domains/index.md` (1.2 → 1.3): removed the placeholder Example Domain row; registered `website-infrastructure` as the first real (if thin) domain; added a note that *slægt* domains are deliberately deferred to Phase 3, not guessed at now; added a forward-looking Cross-Domain Query Recipes note anticipating intermarriage/shared-descendant queries once multiple *slægt* domains exist (not yet a real recipe — recipes are only added on actual recurrence, per the section's own rule).
- Created `knowledge/domains/website-infrastructure/` (`description.md` + `knowledge.md`, both 1.0, `Draft` status) — the domain the human asked for to document, for internal reference only, where the future public website's repo will live, its stack, deployment, and maintenance once it exists. Deliberately thin: only the Executive Summary and the Publishing Curation Gate section (§2) have real content, since nothing else is knowable before that second repo exists. The curation gate itself is the one substantive piece of content this domain needed now — it states explicitly that `[UNVERIFIED]`, `[CONTRADICTS]`, and `[SENSITIVE]` content in any *slægt* domain must never reach a public page unfiltered, per the human's explicit brief.
- Set up Upstream Template Sync tracking (`Architecture.md` §6 step 9): added the System Maintenance Pass section to this file's `TODO.md`, recording this fork's starting point as upstream commit `86d4eddb6211b623a0e5a9ea047528076533ea8a` (2026-08-05).
- Did not create `projects/archive-digitization/` or any *slægt* domain this turn — that's Phase 2/3, deliberately not chained into this checkpoint per the no-chaining rule.

**Not yet done, tracked in `TODO.md`:** confirming the full *slægt* list with the family (Boe and Hopp are known; likely more), the Archive Digitization project itself, and the handwriting-transcription approach decision.

### Session close

Knowledge candidates: None — this was entirely structural/setup work, not a domain fact.
Open flags: None.
Push status: Pending — will push immediately after this turn is logged.

STATUS: CHECKPOINT
Completed: Forked and adapted the context-architecture template for this genealogy research initiative (Phase 1 of the agreed three-phase sequence) — root docs, routing, entry point, domain registry, and a thin `website-infrastructure` reference domain. Upstream sync marker recorded.
Next: Phase 2 — create `projects/archive-digitization/` to begin getting the laptop's document pile into the repo and roughly triaged.
Waiting for: Human confirmation before starting Phase 2.
