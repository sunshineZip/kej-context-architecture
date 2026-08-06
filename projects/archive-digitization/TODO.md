---
type: project
project: archive-digitization
---

# Archive Digitization — TODO

Version 1.1 | 2026-08-06 | Active

> **Routing check:** This is a task tracking file, not a work queue. Do not start work on any item here unless you have completed ROUTING.md routing and received explicit human confirmation for this session.

---

## Open

- [ ] **Store the original Boe-slægten `.docx`, not just its text** (2026-08-06): received via Google Drive and read through generation "03," but the true original binary is still not in the repo. A full plain-text extraction is stored as an interim measure (`library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-fulltext.txt`), but this session's Google Drive connector caps `download_file_content` at 10 MB and the file is 46.1 MB — the connector itself is the blocker, not GitHub's ~100 MB limit (46.1 MB is well under that) and not the cornerstone decision (already confirmed). Needs either a Drive connector without the 10 MB cap, or the human attaching the file directly to a session that can receive it whole. See `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-manifest.md`.
- [ ] Decide an approach to handwriting transcription for older Danish church records (possibly Gothic/Kurrent script) — manual transcription, a specialized OCR tool, or the family's own knowledge of the handwriting
- [ ] As each item in `context/intake-manifest.md` arrives: mark it received, do a rough triage pass (slægt/category, source type) using the working assumptions below, update its status
- [ ] Ask KEJ if he has copies of his own published articles "Om den sidste herredsfoged i Salling Nørre herred" (1978, *Skiveegnens Jul*) and "Degnekår om slægten Hop" (1991) — referenced by an external source (see `context/external-source-hopp-herredsfoged.md`) as the primary source for the Hopp-slægt's herredsfoged history; would be excellent evidentiary sources if he has them
- [ ] Confirm with KEJ the proposed matches in `context/external-source-hopp-herredsfoged.md` (his chapters "01"/"01F" vs. this external page's Knud Danielsen Hopp/Knud Knudsen Hopp), and whether Hans Hop/Mads Hopp (pre-dating chapter "01") belong in the main Hopp-slægt or are separate — not yet confirmed, do not treat as settled
- [x] **Individual/family extraction plan (decided 2026-08-05, started 2026-08-06):** `family-tree/tree.ged` created and seeded from Boe-slægten Chapter 1 generations "02" and "03" (fully read) plus "04"/"05" at Aneoversigt-level detail only — 40 individuals, 14 families, append-only IDs per `context/data-structure-proposal.md` §4.1. Continue incrementally as each further section is read; the extraction file (`context/boe-slaegten-chapter1-extraction.md`) now cross-references the specific `@I@`/`@F@` IDs it produced, so future sections should do the same rather than batching the tree update separately from the read.
- [ ] `family-tree/possible-duplicates.md` created (2026-08-06) with a reassessment trigger: a 4th instance of either logged anomaly sub-pattern (19xx/18xx digit shape, or an unreconciled stated-age) should stop being treated as a probable extraction artifact and get queued to `grandfather-review/queue.md` instead. Check this each time a new anomaly of either shape turns up.
- [ ] **Transcription vs. inference boundary for `grandfather-review/` at this volume:** a fact transcribed as-is from one of KEJ's own documents (e.g. "chapter 3 says Niels was born in 1707") does NOT need a `[FLAG FOR GRANDFATHER REVIEW]` entry — it's just reformatting his own stated words into GEDCOM. Only genuine inferences beyond a single source — a proposed cross-document match, a resolved name-spelling ambiguity (Hop/Hopp/Hoph/Hopf/Hoppe), a filled-in gap — go through the queue. Recorded explicitly so the review queue doesn't become unmanageable once individual extraction is actually underway.

---

## Deferred — not blocking ingestion

Human confirmed (2026-08-05) that absorbing the material matters more right now than nailing down relationships between topics — the architecture can accommodate reclassification later, so these don't gate anything. Proceeding on the working assumptions below; revisit if it turns out wrong, ideally with KEJ's input, but no rush.

- "Møller i Sundsøre Kommune" (mills) and "Sundsøre Lokalarkiv" — working assumption: `library/` deep wells, not domains (place-based, likely cross-*slægt*; see `authoring-guidelines.md` §9.2)
- "Andre Hopp-slægter" research (unconnected Hopp/Hop/Hoph/Hopf/Hoppe lines) — working assumption: triage as its own thing for now, connection to the family's own Hopp-slægt unresolved
- Svend Åge Pedersen's seven slægter (II–VIII) — working assumption: treat as their own lines unless/until something ties them to an existing one

---

## Done

- [x] Project opened (2026-08-05)
- [x] Full intake manifest transcribed from KEJ's email (2026-08-05) — see `context/intake-manifest.md`
