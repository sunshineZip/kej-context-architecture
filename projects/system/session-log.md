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

---

## [Claude] — Turn 3 | 2026-08-05

The grandfather sent his first email: one document ("2024 Boe-slægen fra Mors og Fur.docx") plus, in his own words, a full manifest of everything he plans to send afterward. This is Phase 2 actually starting, confirmed implicitly by the human providing real material rather than a fresh ambiguous request — no separate plan-approval cycle needed on top of the Phase 2 already agreed in Turn 2.

Opened `projects/archive-digitization/` (`session-log.md`, `TODO.md`, `context/intake-manifest.md`) and transcribed the grandfather's full email into the intake manifest — 53 items across 8 categories (Boe-slægten, Hopp-slægten, Svend Åge Pedersens 7 slægter, Dølby-slægten, Inges slægt, broader Hopp-surname research, mills in Sundsøre Kommune, Sundsøre Lokalarkiv). This is project-layer work, appended freely without an approval gate — no `knowledge/domains/` content was touched.

The manifest itself surfaced three real classification questions, recorded as open items in `projects/archive-digitization/TODO.md` rather than silently resolved: whether the mills/Lokalarkiv material should be `library/` deep wells rather than domains (proposed default, per `authoring-guidelines.md` §9.2's "large, cross-domain, mined incrementally" test), whether the broader Hopp-surname research connects to the family's own Hopp-slægt, and whether Svend Åge Pedersen's seven slægter are additional family lines or belong under an existing one.

Because this added a new project, `ROUTING.md` Step 2 needed a new row — this is system-layer work per the Hard Constraints, hence this turn. Also updated the Quick Task Guide's setup-sequence note (Phase 2: "next" → "open, in progress"). No actual document content was ingested this turn — the one file the grandfather sent was not actually attached to the conversation, only its filename; still waiting on the human to provide it.

**Files changed:** `ROUTING.md` (1.10 → 1.11) — new Step 2 row for Archive Digitization, Quick Task Guide status update. New: `projects/archive-digitization/session-log.md`, `TODO.md`, `context/intake-manifest.md`.

### Session close

Knowledge candidates: None — no source material ingested yet, this was intake scaffolding only.
Open flags: None.
Push status: Pending — will push immediately after this turn is logged.

STATUS: CHECKPOINT
Completed: Opened the Archive Digitization project and transcribed the grandfather's full intake manifest (53 items, 8 categories); added its `ROUTING.md` routing row.
Next: Receive the actual "2024 Boe-slægen fra Mors og Fur.docx" file from the human; resolve the three open classification questions (mills/Lokalarkiv as deep wells, Hopp-surname research connection, Svend Åge Pedersen's slægter status) — ideally with input from the grandfather, not guessed.
Waiting for: The human to provide the actual file, and/or direction on the open classification questions.

---

## [Claude] — Turn 4 | 2026-08-05

Human raised a governance concern that this session's own cross-referencing work (see Archive Digitization Turn 6 — the Hopp herredsfoged external-source analysis) made concrete rather than hypothetical: this repo, by aggregating and cross-referencing the grandfather's research, may surface discoveries or connections he has never made himself. The human does not want this repo's own inferences to silently alter or replace his conclusions, wants a running list of such findings he can review periodically (his own cadence, not automated — confirmed via `AskUserQuestion`, human declined an automated monthly reminder), and wants it explicit that the grandfather — not the human operating this repo — remains the final signer on research conclusions, for as long as he is able to continue his own research.

Proposed a concrete design before building, per the Plan-first rule (a new Hard Constraint plus a new cross-cutting mechanism is structural, system-layer work): a third `[FLAG FOR GRANDFATHER REVIEW]` flag type alongside the existing knowledge-update/system flags, and a new top-level `grandfather-review/` folder (`queue.md` for open items, `log.md` as an append-only history of what was sent and how he responded). Human confirmed the design as described.

**Built:**

- `knowledge/flow/operating-principles.md` (1.1 → 1.2) — new "Grandfather review flags" subsection in §5, defining the flag format and the promotion path (confirmed items get `[VERIFIED: grandfather, YYYY-MM-DD]` when written into a domain).
- `ROUTING.md` (1.11 → 1.12) — new Hard Constraint naming the grandfather as final authority on genealogical conclusions specifically (not overriding his ordinary latitude to make system/project-layer decisions himself); new Quick Task Guide entry.
- `Architecture.md` (1.4 → 1.5) — `grandfather-review/` added to the §2 file structure diagram; new §3 subsection, "A third layer — fork-specific: grandfather review," explaining why this fork's promotion gate is stricter than the generic template's (the human's own approval is insufficient for a genealogical claim; only the grandfather's explicit confirmation, recorded in `log.md`, allows promotion).
- `README.md` (1.3 → 1.4) — matching folder-diagram and "How it works" updates.
- New `grandfather-review/queue.md` and `grandfather-review/log.md` — the mechanism itself, both starting fresh (`log.md` empty, no digests sent yet).
- Migrated the three open questions from `projects/archive-digitization/context/external-source-hopp-herredsfoged.md`'s own Open Items into `grandfather-review/queue.md` as its first real entries, and replaced that section with a pointer to the queue (own-vs-reference rule — one owning list, not two copies that could drift).

This is the first structural addition this fork has made beyond what the template itself provides — everything else so far has been filling in the template's own scaffolding. Recorded here in full per the Hard Constraint requiring system-layer changes to be logged before committing.

### Session close

Knowledge candidates: None — this was a governance/process mechanism, not a domain fact.
Open flags: None.
Push status: Pending — will push immediately after this turn is logged.

STATUS: CHECKPOINT
Completed: Designed and built the `grandfather-review/` mechanism (new flag type, queue + log files, Hard Constraint) establishing the grandfather as final authority on genealogical conclusions; migrated the first three real findings into it.
Next: None planned — awaiting the Boe-slægten file or further direction.
Waiting for: Nothing further this turn — pushing now.

---

## [Claude] — Turn 5 | 2026-08-05

Human pointed out the grandfather's English is limited while the research itself is Danish, and asked whether `grandfather-review/` content should be authored natively in Danish or translated at send-time. Recommended native Danish — translating at send-time adds a manual step and a real risk of losing nuance on names/dates every cycle, for a file whose only audience is him. Flagged one technical constraint before acting: `scripts/validate.ps1` recognizes the Version History section by matching the literal English heading text, so translating that specific heading would silently stop the file from being checked — the same class of bug this repo's own history already hit once with `MarkdownConventions.md`'s numbered heading. Kept that one heading, plus the `Version | Date | Status` line, in the standard convention; translated everything else.

**Built:**

- `grandfather-review/queue.md` (1.0 → 1.1) and `grandfather-review/log.md` (1.0 → 1.1) — fully translated into Danish (title, Document Purpose, usage instructions, all three existing entries), each with a top-of-file note explaining the language exception and which two structural elements stay English for tooling compatibility.
- `knowledge/flow/operating-principles.md` (1.2 → 1.3) — §5 clarified: the in-turn `[FLAG FOR GRANDFATHER REVIEW]` block stays in whatever language the session log itself is in (that's an internal working note), but the actual entry appended to `queue.md` must be in Danish — added the Danish field-label template (Kategori/Kilde/Fund/Grundlag/Status) so future sessions have the real template to copy, not just a translation instruction.
- `ROUTING.md` (1.12 → 1.13) — Quick Task Guide's grandfather-review entry now flags the Danish requirement inline.
- `Architecture.md` (1.5 → 1.6) — §3 notes the language exception and its rationale.

No change to `README.md` this turn — its existing one-line mention of `grandfather-review/` didn't need updating for this.

### Session close

Knowledge candidates: None — language/process convention, not a domain fact.
Open flags: None.
Push status: Pending — will push immediately after this turn is logged.

STATUS: CHECKPOINT
Completed: Translated `grandfather-review/queue.md` and `log.md` into Danish per the human's request; documented the convention (and the one tooling exception) across `operating-principles.md`, `ROUTING.md`, and `Architecture.md`.
Next: None planned — awaiting the Boe-slægten file or further direction.
Waiting for: Nothing further this turn — pushing now.

---

## [Claude] — Turn 6 | 2026-08-05

Human asked (in an Archive Digitization session — see that project's Turn 11) that Knud Erik Jakobsen be referred to by name/initials, "KEJ" or "Knud Erik Jakobsen," rather than the relational term "grandfather," going forward. Searched the repo for every occurrence (13 files) before touching anything, to scope the change precisely rather than guessing.

**Judgment call, stated explicitly rather than assumed:** treated this as a prose change, not a rename of structural identifiers. Kept the `grandfather-review/` folder and file paths, the `[FLAG FOR GRANDFATHER REVIEW]` tag, and the two section headings that name the mechanism ("Grandfather review flags" here in §5; "grandfather review" in `Architecture.md` §3) — a path/tag rename would have touched significantly more files (every path reference across the whole repo) for a request that read as being about how he's referred to in running text, not the mechanism's internal naming. Flagged this distinction to the human rather than silently deciding it was the full scope.

**Updated, system-layer files (this repo's own tracked set):**
- `ROUTING.md` (1.13 → 1.14) — Hard Constraint, Quick Task Guide entry, Step 2 table, and Quick Task Guide's fork-sequence status now say "KEJ" / "Knud Erik Jakobsen (KEJ)"; `[VERIFIED: grandfather, ...]` → `[VERIFIED: KEJ, ...]`.
- `Architecture.md` (1.6 → 1.7) — §3 prose updated the same way.
- `knowledge/flow/operating-principles.md` (1.3 → 1.4) — §5 prose and both the English and Danish flag-template examples updated.
- `README.md` (1.4 → 1.5) — "How it works" bullet updated.

**Also updated, project-layer files** (freely revisable, no gate needed): `projects/archive-digitization/TODO.md`, `projects/system/TODO.md`, `context/intake-manifest.md`, `context/external-source-hopp-herredsfoged.md`, and the Danish `grandfather-review/queue.md`/`log.md` (`bedstefar` → `KEJ`, same rationale applied to the Danish content).

**Explicitly not touched:** any already-committed `session-log.md` turn (this file's own history included) and any already-committed Version History row in any file — both are append-only by Hard Constraint, mechanically enforced by `validate.ps1`. The old wording stands in the historical record; only new content uses "KEJ."

### Session close

Knowledge candidates: None — naming-convention change, not a domain fact.
Open flags: None.
Push status: Pending — will push immediately after this turn is logged.

STATUS: CHECKPOINT
Completed: Renamed "grandfather" to "KEJ" in prose across all tracked system-layer files, keeping structural identifiers (folder paths, the flag tag, mechanism-naming headings) and historical append-only records untouched.
Next: None planned — awaiting the Boe-slægten file or further direction.
Waiting for: Nothing further this turn — pushing now.

---

## [Claude] — Turn 7 | 2026-08-05

Human's stated aim for this whole repo, given directly this turn: generate output that would be recognized as quality work by the genealogy research community — not just a private backup. Asked to fully adopt the Genealogical Proof Standard (GPS) and Elizabeth Shown Mills' Evidence Explained (EE) citation format, and explicitly asked whether these are actually valid outside the US — a fair question given both originate from American institutions (BCG for GPS, Mills' own publishing for EE).

**Verified rather than assumed**, via web search, before writing anything: GPS is widely respected but not universal — some European genealogical traditions historically emphasize lineage reconstruction over citation rigor, which if anything argues for adopting GPS here rather than against it. EE is similarly US-centric in its worked examples; even Swedish citation examples were only added in its 4th edition (2024), and it has no ready-made Danish templates. Conclusion: adopt GPS as a methodology and EE's general citation *logic*, but build genuinely Danish record-type templates ourselves rather than claim the book already covers this — cross-checked against Rigsarkivet's own Arkivalieronline documentation (parish/sogn organization, event-type codes, "opslag" image numbering) rather than guessed.

**Built**, in `knowledge/domains/authoring-guidelines.md` (1.7 → 1.8), new §9.5 "Genealogical Proof Standard and Citation Format":
- A table mapping GPS's five elements to mechanisms this repo already has (inventory-first intake, `[CONTRADICTS]`, `[VERIFIED]`/`[UNVERIFIED]`, cross-reference analysis) — adopting GPS didn't require new machinery, mostly formalizing what was already the direction of travel.
- An explicit international-validity note, stating the US origin and non-universality plainly rather than glossing over it.
- Citation anatomy (who / what / where / how-accessed) and four Danish-adapted templates: kirkebog via Arkivalieronline, folketælling, skifteprotokol, and secondary sources — each with a worked example, one of them using this repo's own real akj-cbj.dk source.
- A new **Citation** column added to the `sources/manifest.md` template (§9.1) and a matching Quick Checklist item (§11).

**Demonstrated immediately, not left abstract:** added a real citation string to `projects/archive-digitization/context/external-source-hopp-herredsfoged.md`'s Source table using the new secondary-source template — the first real application, not just documentation nobody has tried yet.

Explicitly noted in the guidelines that the Danish templates are a starting adaptation, to be refined once real kirkebog/folketælling material is in hand and its actual on-the-ground structure is known firsthand.

### Session close

Knowledge candidates: None — this is itself a knowledge-authoring-standard change (system-layer), not a domain fact.
Open flags: None.
Push status: Pending — will push immediately after this turn is logged.

STATUS: CHECKPOINT
Completed: Adopted GPS and an Evidence Explained-derived citation format as this repo's explicit research/citation standard, with Danish-adapted templates verified against real Rigsarkivet documentation rather than assumed; demonstrated on the existing akj-cbj.dk source.
Next: Refine the Danish templates once real parish/census/probate material is actually in hand.
Waiting for: The Boe-slægten file, or further direction.

---

## [Claude] — Turn 8 | 2026-08-06

Human, working in Archive Digitization on the Boe-slægten Chapter 1 read-through, confirmed all four decision items from an orientation-turn review pass at once: (1) build `family-tree/possible-duplicates.md` now, (2) use whichever citation-retrofit approach is most robust, (3) the "wait for real data" threshold for creating `family-tree/` is now passed (two full generations read), and (4) asked what a transcription-fidelity safeguard would look like and whether it's worth building. This turn covers only the structural, system-layer piece of that work — creating the actual `family-tree/` folder and updating `Architecture.md` — per Subproject Transcendence (`Architecture.md` §5); the project-layer content (the seeded `tree.ged`, the extraction-notes citation retrofit, the intake-manifest and TODO updates) is recorded in `projects/archive-digitization/` context files directly, not narrated here.

**Built:**

- `family-tree/tree.ged` — the actual file `context/data-structure-proposal.md` had only sketched, created and seeded with 40 individuals / 14 families from Boe-slægten Chapter 1 (generations "02" and "03" at full detail; "04"/"05" and generation-05's children at Aneoversigt-level detail only, explicitly noted as such in each record's `NOTE` rather than implying a fuller read that hasn't happened yet). Append-only `@I@`/`@F@` ID assignment per the design doc's §4.1.
- `family-tree/possible-duplicates.md` — the other half of the two-tier duplicate-tracking system that was previously half-built (`grandfather-review/queue.md` existed and was in use; this file didn't). Backfilled with the recurring low-confidence anomaly instances already found and reasoned about across three `boe-slaegten-chapter1-extraction.md` Version History rows, now counted centrally instead of scattered — six instances logged across two sub-patterns, with an explicit reassessment trigger (a 4th instance of either shape escalates to `grandfather-review/queue.md` instead of staying a probable tooling artifact).
- `Architecture.md` (1.7 → 1.8) — §2 file structure diagram gained the `family-tree/` folder; new §3 subsection "Cross-*slægt* structural data — fork-specific: `family-tree/`" explaining why this data sits alongside `library/` as cross-cutting rather than inside any one domain, and cross-referencing the ID-stability and duplicate-tier rules already designed in `data-structure-proposal.md`.

**Also touched this turn, not gated by this file** (registered but not requiring system-project routing — `library/reference-index.md` deep-well registration only requires the cornerstone confirmation already given, per `authoring-guidelines.md` §9.2-9.3, not a separate system-layer log entry): registered the Boe-slægten manuscript as this repo's first deep well. Its physical storage is partial — a full plain-text extraction (147,860 characters) is stored, but the original `.docx` (46.1 MB) could not be retrieved this session; the Google Drive connector's `download_file_content` tool caps at 10 MB, which is a session/tooling limit, not the GitHub size limit (well clear at 46.1 MB) or the cornerstone decision (confirmed). Flagged as an open item in `projects/archive-digitization/TODO.md` rather than silently treated as resolved.

### Session close

Knowledge candidates: None — structural/tooling additions, not domain facts.
Open flags: None new. One pre-existing tooling limitation flagged as an open TODO item (original .docx binary not retrievable this session), not a `[FLAG FOR ...]` in the formal sense since it's a technical blocker, not a content or research question.
Push status: Pending — will push after this turn is logged, together with the rest of this session's archive-digitization work in the same commit.

STATUS: CHECKPOINT
Completed: Created `family-tree/tree.ged` and `family-tree/possible-duplicates.md`, formalizing what `data-structure-proposal.md` had only sketched; updated `Architecture.md` to match. Registered the Boe-slægten manuscript as the first `library/` deep well (partially stored — text only, original binary blocked by a connector limit, not a decision).
Next: Continue `family-tree/tree.ged` incrementally as further Boe-slægten sections are read (generation "04" next); re-attempt the original `.docx` retrieval when a suitable path exists.
Waiting for: Nothing further this turn — pushing now.

---

## [Claude] — Turn 9 | 2026-08-06

Same session as Turn 8, continued. Human asked directly how to solve the Boe-slægten `.docx` size problem going forward, since more (possibly larger) files are coming. Investigated rather than assumed: the Google Drive connector's `download_file_content` tool caps at 10 MB regardless of file permissions, and — tried directly — this environment's outbound network policy separately blocks a direct `curl` to `drive.google.com` at the proxy level (`403`, confirmed via the proxy's own status endpoint), so even public-sharing the file plus a raw fetch wouldn't have worked here. Two independent blockers, not one; loosening either alone doesn't fix it, and Google's own large-file interstitial would still complicate a raw fetch even if the network policy allowed it.

Recommended routing large-file intake through a direct git push instead of an AI tool connector fetch — the human has ordinary unrestricted access to their own Drive downloads, so pushing straight into the repo sidesteps both blockers entirely, up to GitHub's own ~100 MB per-file limit. Human asked for a dedicated `incoming/` folder to make that concrete.

**Built:**

- `incoming/README.md` — new top-level, git-tracked landing zone for untriaged raw files. Flat, no required subfolder structure (matches the human's stated goal of minimizing upload-time friction); explicitly distinguished from `temp/`, which is gitignored and for transient handoff material only, not durable storage. States the triage procedure (check against `projects/archive-digitization/context/intake-manifest.md`, decide the real destination per existing `library/deep-wells/`/`sources/`/registry-only rules, then move the file out — `incoming/` is a waiting room, not a permanent home).
- `Architecture.md` (1.8 → 1.9) — §2 file structure diagram gained `incoming/`; new §3 subsection "Untriaged file intake — fork-specific: `incoming/`".
- `ROUTING.md` (1.14 → 1.15) — new Quick Task Guide entry: push a raw file into `incoming/` directly rather than defaulting to an AI tool connector fetch for anything of meaningful size.
- `projects/archive-digitization/TODO.md` — added checking `incoming/` at the start of each working session as a standing item.

No design fork genuinely needed the human's input beyond "yes, build this" — folder location (top-level, sibling to `library/`/`family-tree/`/`grandfather-review/`, not project-scoped, since intake isn't specific to one project) and the flat/no-subfolder structure were both reasonably unambiguous defaults given the stated goal, so built directly rather than raising a separate design question first.

### Session close

Knowledge candidates: None — structural/tooling addition, not a domain fact.
Open flags: None.
Push status: Pending — will push after this turn is logged, together with Turn 8's work if not already pushed.

STATUS: CHECKPOINT
Completed: Diagnosed the Boe-slægten `.docx` size problem as two independent, environment-level blockers (connector cap + network policy), not something fixable from within the session; built `incoming/` as the sustainable fix — direct git push instead of a connector fetch for future large files.
Next: Human to start pushing queued files into `incoming/`; triage them in a subsequent session per `incoming/README.md`.
Waiting for: Nothing further this turn — pushing now.

---

## [Claude] — Turn 10 | 2026-08-06

Different session, continued from `archive-digitization` after `family-tree/tree.ged` reached "Fully read" and a subsequent Gramps import reported "483 errors detected." Diagnosed (in that project's own context, not repeated here) two real, previously-undetected GEDCOM bug classes accumulated across the long manual editing session: missing bidirectional `FAMC`/`FAMS`/`HUSB`/`WIFE`/`CHIL` back-references (8 instances), and 127 lines with informal `@I123@`/`@F45@`-style cross-references left unescaped inside free-text `NOTE` fields (GEDCOM 5.5.1 requires a literal `@` in a value to be escaped as `@@` wherever it occurs, not just at line-start). Both fixed directly in `tree.ged`. Human then asked, as a system-layer question, how to catch this automatically on every future edit rather than relying on a one-off manual diagnosis.

**Built:** extended the existing `scripts/validate.ps1` — deliberately not a separate script — with a new "family-tree/tree.ged — GEDCOM structural consistency" section, since `validate.ps1` already runs automatically via the pre-commit hook on every commit; a standalone script would depend on someone remembering to run it. Gated on `Test-Path family-tree/tree.ged` so it's a no-op for forks without this fork's `family-tree/` addition. Ports the exact logic already validated ad hoc via a throwaway Python script while diagnosing the Gramps failure:

- Duplicate `@I@`/`@F@` id detection (error).
- Dangling-reference detection: `FAMC`/`FAMS` pointing at a `FAM` id that doesn't exist, `HUSB`/`WIFE`/`CHIL` pointing at an `INDI` id that doesn't exist (error).
- Full bidirectional consistency, both directions: every `FAM`'s `HUSB`/`WIFE`/`CHIL` must have a matching `FAMS`/`FAMC` on the referenced individual, and vice versa (error).
- Unescaped `@` in free text: any non-structural line containing an `@I###@`/`@F###@` pattern (error) — the exact mistake that produced Gramps' "Line ignored" output.
- Line length >255 chars (warning only — Gramps is known to tolerate this even though the spec doesn't formally allow it, already confirmed to the human in the source project).

Ran `pwsh -NoProfile -File scripts/validate.ps1` against the now-fixed `tree.ged`: 0 errors, 140 warnings (139 are the new line-length notices — expected, matches what was already told to the human about Gramps tolerating long lines — plus one pre-existing, unrelated orphan-file warning). Confirms the new checks are clean against current state and would have caught both real bug classes had they existed.

Also added one paragraph to `Architecture.md`'s "Cross-*slægt* structural data — fork-specific: `family-tree/`" subsection, documenting that `validate.ps1` now checks `tree.ged` structurally, so the mechanism is discoverable there rather than only in the script's own comments.

### Session close

Knowledge candidates: None — tooling/validation addition, not a domain fact.
Open flags: None.
Push status: Pending — will push after this turn is logged.

STATUS: CHECKPOINT
Completed: `scripts/validate.ps1` now runs GEDCOM structural consistency checks (duplicate/dangling ids, full bidirectional `FAMC`/`FAMS`/`HUSB`/`WIFE`/`CHIL` consistency, unescaped `@` in free text) against `family-tree/tree.ged` on every commit, via the existing pre-commit hook — no separate script to remember to run. Verified clean against the current file.
Next: None specific — mechanism is live going forward. Return to `archive-digitization` for the next open item (`family-tree/possible-duplicates.md` reassessment trigger, or the open `TODO.md` items).
Waiting for: Nothing further this turn — pushing now.

---

## [Claude] — Turn 11 | 2026-08-06

Same session, immediate correction. Human re-imported the Turn 10-fixed `tree.ged` into Gramps and still got "482 errors detected," almost entirely "Line ignored" — essentially unchanged from the original 483. This falsified Turn 10's claim that the unescaped-`@` cross-references were "the exact mistake that produced Gramps' 'Line ignored' output": that bug was real and worth fixing, but it was not the dominant cause. That claim was never actually verified against Gramps itself (no Gramps available in this environment; `python-gedcom`, the only parser on hand, was too lenient to reproduce the failure at all) — it was a plausible-sounding hypothesis stated with more confidence than the evidence supported. Recorded here as a correction rather than silently fixed, per this file's own append-only discipline.

Re-diagnosed from scratch by checking for the one thing that would explain a count that large and that unmoved by the earlier fix: lines that don't start with a GEDCOM level number at all. Found exactly 482 blank lines in `tree.ged`, used throughout as human-readable visual spacing between `0`-level records — not valid GEDCOM (every line must start with a level number; a bare blank line has none). 482 blank lines against "482 errors" is not a coincidence; this is the actual, complete root cause.

**Fixed:** stripped all 482 blank lines from `tree.ged` (4395 → 3913 lines). Verified record counts unchanged after the strip (363 `INDI`, 118 `FAM`, one `HEAD`, one `TRLR`) — pure whitespace removal, no data lost. Added a new check to `scripts/validate.ps1`'s GEDCOM section, ahead of the existing per-line checks: any blank line is now a hard error, with a message pointing at this turn so a future reader doesn't repeat Turn 10's misattribution. Re-ran `scripts/validate.ps1`: 0 errors, 140 warnings (same as Turn 10 — the blank-line strip didn't touch line lengths).

### Session close

Knowledge candidates: None.
Open flags: None.
Push status: Pending — will push after this turn is logged.

STATUS: CHECKPOINT
Completed: Corrected Turn 10's misdiagnosis. The actual, complete cause of Gramps' "Line ignored" flood was 482 invalid blank lines used as record spacing, not primarily the `@`-escaping bug (which was a real but minor secondary issue, already fixed). Blank lines stripped from `tree.ged`; `validate.ps1` now hard-errors on any blank line in the file. Verified clean.
Next: Human to re-import `tree.ged` into Gramps to confirm 0 errors now. If anything still surfaces, treat this incident as a reminder not to trust an unverified root-cause theory again — check the error count arithmetic against the fix before declaring it solved.
Waiting for: Nothing further this turn — pushing now.

---

## [Claude] — Turn 12 | 2026-08-07

Different session, continued from `archive-digitization`. While researching a family-history question (why the family sought a 1904/05 royal name grant for the "Boe" surname), general Danish naming-law background was found via web search — not from KEJ's manuscript, not from direct family testimony. Human's follow-up question, as a system-layer concern: how to keep this kind of AI-contributed material clearly separated from KEJ's own research and from the human's own direct contributions, rather than letting provenance blur.

Reviewed the existing mechanism first rather than inventing a parallel one: `knowledge/domains/authoring-guidelines.md` §9.5 already defines a GPS-based citation vocabulary (`[VERIFIED: ...]`, `[UNVERIFIED: ...]`, `[CONTRADICTS: ...]`) with Danish record-type citation templates, adopted 2026-08-05. It had no category for "general background, not a claim about the family" — every existing tag means "this specific fact about this specific family is evidenced by X." Proposed extending it rather than replacing it, iterated on the design with the human twice:

- First round: proposed a new `[CONTEXT: ai-research, YYYY-MM-DD]` tag, distinct from `[VERIFIED: ...]` precisely because it plays a different evidentiary role (background, not a claim).
- Human pushed back, correctly: a bare `ai-research` label with no actual citation is not "scientifically valid" — fails the same GPS standard everything else here is held to. Same objection applied retroactively to the already-existing `[VERIFIED: familieidentifikation, YYYY-MM-DD]` tag, which never recorded who made an identification or how confident they were.
- Revised: `familieidentifikation` now requires `[VERIFIED: familieidentifikation — <name>, <confidence: sikker/formodet>, YYYY-MM-DD]`. `ai-research` now requires the short in-file tag to point at a file carrying full real citations (title/author/URL/access date), never a bare label. Human's only further edit: drop the `(barnebarn)` relation qualifier from the name — just the name, no relation annotation.

**Built:**

- `knowledge/domains/authoring-guidelines.md` (1.8 → 1.9) — §9.5 gained both refined formats, documented as the authoritative definitions.
- `projects/archive-digitization/context/ai-research-danske-navnelove.md` — new file, the first real use of the `ai-research` tag: patronymic naming, the 1828/1856/1904 naming laws, and why "Boe" specifically (an informal family nickname since 1771, formalized in 1904/05). Headed with an explicit provenance notice distinguishing it from KEJ's manuscript and from family testimony.
- `family-tree/tree.ged` — added a `[CONTEXT: ai-research, ...]` NOTE on `I27` (generation "05"'s father, whose family sought the 1904/05 grant) pointing to the new file. Retrofitted all 11 existing `[VERIFIED: familieidentifikation, ...]` tags (Astrid Kirk's record, the image26/27 identifications) to the new who/confidence format — all attributable to Nikolaj, all stated with no hedging, so all became `— Nikolaj Boe, sikker, 2026-08-06`. Also retrofitted one matching instance in `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` for consistency.

Deliberately did not build a new central registry for `ai-research` sources (parallel to `library/reference-index.md`'s deep-well registry) — the tag's relative file path already serves as the pointer, and a handful of background files doesn't yet justify that infrastructure. Revisit if this pattern grows large.

### Session close

Knowledge candidates: None — citation-format refinement, not a domain fact.
Open flags: None.
Push status: Pending — will push after this turn is logged.

STATUS: CHECKPOINT
Completed: `authoring-guidelines.md` §9.5 now defines two refined citation formats — `familieidentifikation` requires who + confidence, `ai-research` requires a real traceable citation file, not a bare label — closing a real provenance gap the human caught. Retrofitted across all existing usage in `tree.ged`, not just applied going forward.
Next: None specific — mechanism is live going forward for future AI-researched background and future family-testimony citations.
Waiting for: Nothing further this turn — pushing now.

---

## [Claude] — Turn 13 | 2026-08-07

Same session, continued. Human found a promising MyHeritage SuperSearch lead on Jens Christian Christensen (the American emigrant, `family-tree/tree.ged#I29`) and uploaded the search-results page HTML, but everything on MyHeritage is paywalled — only collection names and field labels are visible without a subscription, actual values are blurred. Human's broader point: rather than subscribing (or making a physical archive trip, for the anticipated future Hopp-slægten Dutch-records case) to resolve one question at a time, questions that depend on a specific costly external resource should be piled up by source and resolved in one batch once the pile justifies the cost.

Extracted what's actually readable from the uploaded HTML (mostly paywall chrome; the file itself was too large to read directly, so grepped for visible content): several FamilySearch/Filae family-tree hits and 1930 Danish census hits with blurred fields, plus one partially-visible newspaper snippet ("SANTA MONICA, Sept. 1 — Jens Christian Christensen, a seaman on the...", from an OldNews.com California/Hawaii/Alaska/Puerto Rico/US Virgin Islands newspaper collection) — flagged with the same caution as the earlier FamilySearch false-positive (2026-08-06): "Jens Christian Christensen" is a very common name, a name match alone isn't a person match.

**Built:** a new top-level `research-queue.md` — not part of the generic template, distinct in both purpose and audience from `grandfather-review/` (questions only KEJ can answer) and `family-tree/possible-duplicates.md` (routine ambiguity resolvable from evidence already in hand). Groups open questions by which external resource (paid subscription, paid record request, physical archive trip) would resolve them, so cost gets spent once against an accumulated batch rather than repeatedly. Seeded with the MyHeritage lead (full context: what's known about I29, the search URL, what's visible vs. paywalled, the name-commonality caution) and an empty placeholder section for the anticipated future Dutch-archive Hopp-slægten case the human named as the other motivating example.

Documented as a proper structural addition, same treatment as `incoming/` and `grandfather-review/` got: `Architecture.md` (1.9 → 1.10) gained the file in its §2 diagram and a new §3 subsection; `ROUTING.md` (1.15 → 1.16) gained a matching Quick Task Guide entry.

### Session close

Knowledge candidates: None — structural/tooling addition, not a domain fact.
Open flags: None.
Push status: Pending — will push after this turn is logged.

STATUS: CHECKPOINT
Completed: New top-level `research-queue.md` groups open genealogical questions by which paid/travel external resource would resolve them, seeded with a real MyHeritage lead on the American emigrant ancestor. Documented in `Architecture.md` and `ROUTING.md` to the same standard as prior fork-specific structural additions.
Next: None specific — mechanism is live going forward. Revisit MyHeritage once its pile of open questions justifies a subscription.
Waiting for: Nothing further this turn — pushing now.
