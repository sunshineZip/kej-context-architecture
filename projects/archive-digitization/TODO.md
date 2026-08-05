---
type: project
project: archive-digitization
---

# Archive Digitization — TODO

Version 1.0 | 2026-08-05 | Active

> **Routing check:** This is a task tracking file, not a work queue. Do not start work on any item here unless you have completed ROUTING.md routing and received explicit human confirmation for this session.

---

## Open

- [ ] Receive "2024 Boe-slægen fra Mors og Fur.docx" (Boe-slægten, Mors/Fur, Kapitel 1-4, v. maj 2026) — waiting on the human to upload or link the actual file, not yet in this session. This is the real blocker on any further progress right now.
- [ ] Decide an approach to handwriting transcription for older Danish church records (possibly Gothic/Kurrent script) — manual transcription, a specialized OCR tool, or the family's own knowledge of the handwriting
- [ ] As each item in `context/intake-manifest.md` arrives: mark it received, do a rough triage pass (slægt/category, source type) using the working assumptions below, update its status
- [ ] Ask the grandfather if he has copies of his own published articles "Om den sidste herredsfoged i Salling Nørre herred" (1978, *Skiveegnens Jul*) and "Degnekår om slægten Hop" (1991) — referenced by an external source (see `context/external-source-hopp-herredsfoged.md`) as the primary source for the Hopp-slægt's herredsfoged history; would be excellent evidentiary sources if he has them
- [ ] Confirm with the grandfather the proposed matches in `context/external-source-hopp-herredsfoged.md` (his chapters "01"/"01F" vs. this external page's Knud Danielsen Hopp/Knud Knudsen Hopp), and whether Hans Hop/Mads Hopp (pre-dating chapter "01") belong in the main Hopp-slægt or are separate — not yet confirmed, do not treat as settled
- [ ] **Individual/family extraction plan (decided 2026-08-05, not yet started):** commit to the GEDCOM structure in `context/data-structure-proposal.md`, but build `family-tree/tree.ged` incrementally, one document's worth of individuals at a time, as each piece of material is actually read and triaged — not as a single bulk "extract everyone" pass. Reasons: (1) nothing to extract from yet at real scale, (2) the source material reads as narrative prose (per the akj-cbj.dk example), so pulling a person out requires actually understanding the passage, best done alongside triage rather than as a separate mechanical sweep. Creating the actual `family-tree/` folder is still deferred until the first real document arrives — this item just records the agreed approach for when it does.
- [ ] **Transcription vs. inference boundary for `grandfather-review/` at this volume:** a fact transcribed as-is from one of the grandfather's own documents (e.g. "chapter 3 says Niels was born in 1707") does NOT need a `[FLAG FOR GRANDFATHER REVIEW]` entry — it's just reformatting his own stated words into GEDCOM. Only genuine inferences beyond a single source — a proposed cross-document match, a resolved name-spelling ambiguity (Hop/Hopp/Hoph/Hopf/Hoppe), a filled-in gap — go through the queue. Recorded explicitly so the review queue doesn't become unmanageable once individual extraction is actually underway.

---

## Deferred — not blocking ingestion

Human confirmed (2026-08-05) that absorbing the material matters more right now than nailing down relationships between topics — the architecture can accommodate reclassification later, so these don't gate anything. Proceeding on the working assumptions below; revisit if it turns out wrong, ideally with the grandfather's input, but no rush.

- "Møller i Sundsøre Kommune" (mills) and "Sundsøre Lokalarkiv" — working assumption: `library/` deep wells, not domains (place-based, likely cross-*slægt*; see `authoring-guidelines.md` §9.2)
- "Andre Hopp-slægter" research (unconnected Hopp/Hop/Hoph/Hopf/Hoppe lines) — working assumption: triage as its own thing for now, connection to the family's own Hopp-slægt unresolved
- Svend Åge Pedersen's seven slægter (II–VIII) — working assumption: treat as their own lines unless/until something ties them to an existing one

---

## Done

- [x] Project opened (2026-08-05)
- [x] Full intake manifest transcribed from the grandfather's email (2026-08-05) — see `context/intake-manifest.md`
