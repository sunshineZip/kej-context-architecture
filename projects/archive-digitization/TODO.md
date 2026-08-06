---
type: project
project: archive-digitization
---

# Archive Digitization — TODO

Version 1.4 | 2026-08-06 | Active

> **Routing check:** This is a task tracking file, not a work queue. Do not start work on any item here unless you have completed ROUTING.md routing and received explicit human confirmation for this session.

---

## Open

- [ ] **Image extraction now proceeds alongside text extraction, not as a separate pass (decided 2026-08-06):** the Boe-slægten `.docx` has 48 embedded images (photos, scanned documents, maps) that the text-only extraction had ignored entirely. First batch (6 images tied to Aneoversigt/generations "02"-"05", the sections already read) is done — see `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-media/manifest.md`. Going forward: when reading a new section of the manuscript, pull and process its images in the same working session, not deferred to a later catch-up pass. Efterslægt in particular will need this — its images will very likely depict living or recently-living people, so expect `[SENSITIVE]` handling to become the default there, not the exception.
- [ ] **Check `incoming/` for new files at the start of each working session** (2026-08-06): the human now pushes raw files directly into `incoming/` via git/GitHub instead of an AI tool connector fetch (see `incoming/README.md`), specifically to avoid connector size caps. Anything found there needs the same triage as any other manifest item: update `context/intake-manifest.md`, decide its real home, move it out of `incoming/`. First real use (2026-08-06): the Boe-slægten original `.docx`, see Done below.
- [ ] Decide an approach to handwriting transcription for older Danish church records (possibly Gothic/Kurrent script) — manual transcription, a specialized OCR tool, or the family's own knowledge of the handwriting
- [ ] As each item in `context/intake-manifest.md` arrives: mark it received, do a rough triage pass (slægt/category, source type) using the working assumptions below, update its status
- [ ] Ask KEJ if he has copies of his own published articles "Om den sidste herredsfoged i Salling Nørre herred" (1978, *Skiveegnens Jul*) and "Degnekår om slægten Hop" (1991) — referenced by an external source (see `context/external-source-hopp-herredsfoged.md`) as the primary source for the Hopp-slægt's herredsfoged history; would be excellent evidentiary sources if he has them
- [ ] Confirm with KEJ the proposed matches in `context/external-source-hopp-herredsfoged.md` (his chapters "01"/"01F" vs. this external page's Knud Danielsen Hopp/Knud Knudsen Hopp), and whether Hans Hop/Mads Hopp (pre-dating chapter "01") belong in the main Hopp-slægt or are separate — not yet confirmed, do not treat as settled
- [x] **Individual/family extraction plan (decided 2026-08-05, started 2026-08-06):** `family-tree/tree.ged` created and built incrementally, one generation at a time as each is read — generations "02"-"05" of Chapter 1 now fully read, 44 individuals / 16 families, append-only IDs per `context/data-structure-proposal.md` §4.1. Efterslægt (descendants, p.25-54) is next and will be the largest remaining chunk. The extraction file (`context/boe-slaegten-chapter1-extraction.md`) cross-references the specific `@I@`/`@F@` IDs each section produced.
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
- [x] Original Boe-slægten `.docx` stored (2026-08-06): human pushed it into `incoming/` via GitHub Desktop, first real use of that mechanism; triaged into `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024.docx` after verifying zip/docx integrity. Supersedes the earlier text-only interim measure — see `library/reference-index.md#boe-slaegten-fra-mors-og-fur`.
- [x] First image batch extracted and inventoried (2026-08-06): 6 images tied to Aneoversigt/generations "02"-"05" — see `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-media/manifest.md`. Two served as genuine fidelity spot-checks against already-extracted text (family gravestone photo, 1905 name-grant certificate — all 6 names/dates on the certificate matched `family-tree/tree.ged` exactly).
