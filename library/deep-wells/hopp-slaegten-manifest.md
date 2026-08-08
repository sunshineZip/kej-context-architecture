# Hopp-slægten — Deep Well Manifest

Version 1.1 | 2026-08-08 | Production

---

## Document Purpose

Detailed extraction log for the "Hopp-slægten" deep well (`library/reference-index.md#hopp-slaegten`). Keeps `reference-index.md` itself short, per `knowledge/domains/authoring-guidelines.md` §9.2.

Unlike `boe-slaegten-fra-mors-og-fur` (one manuscript, four chapters, all in a single `.docx`), KEJ distributes Hopp-slægten as many separate per-chapter files (his own numbering: 01, 01C, 01F, 02, 03... up to 16, plus further branches — see `projects/archive-digitization/context/intake-manifest.md` §3). This deep well is therefore a growing folder, `hopp-slaegten/`, not a single file — new chapters get added here as KEJ sends them, under the same manifest and `reference-index.md` entry, rather than each spawning its own registration.

---

## What Is Stored Here

- **`hopp-slaegten/01-knud-danielsen-hopp-o1640-1723.doc`** (4,849,152 bytes) — legacy binary `.doc`. Received attached to KEJ's 2026-08-08 email (relayed via the human), landed in `incoming/`, triaged same day.
  - **Content gap, confirmed by flyover (2026-08-08):** file metadata claims 5 pages / 422 words; catalog (`library/reference-index.md#kej-slaegtshistorie-og-lokalhistorie-2026-katalog`) expects 33 pages + 3 maps. Actual extracted text (~460 words via `antiword` — LibreOffice fails to load this file, "source file could not be loaded") is only the Kapitel 1 family-overview index table, not an individual biographical entry for Knud Danielsen Hopp himself. KEJ's own words: "Det ser ud, som om det meste af indholdet er slettet ?? Jeg prøver at finde det!" ("Looks like most of the content has been deleted — I'll try to find it!"). Treated as an accepted gap for now, not a blocker — per the human, 2026-08-08: "We can always swap them later if my grandfather manages to find the complete documents."
  - **Partial substitute available:** `projects/archive-digitization/context/external-source-hopp-herredsfoged.md` (a different genealogist's page, itself citing KEJ's own 1978/1991 published articles) already has a full secondary-source narrative for Knud Danielsen Hopp — his herredsfoged career, the 1686 Thise witch trial, his 1723 death. Secondary and not a substitute for KEJ's own primary account, but usable to avoid a total blank pending a complete file.
- **`hopp-slaegten/01c-niels-jorgen-knudsen-hopp-1685-1770.docx`** (11,378,896 bytes) — modern `.docx`, opens normally. Received/landed/triaged same as above.
  - **Flyover (2026-08-08):** 88 pages per file metadata, matching the catalog's "88s" exactly. 6 embedded images. Looks content-complete. KEJ's note that "kortene er p.t. ikke kopieret (2 stk)" most likely means 2 accompanying map scans haven't been sent as separate attachments yet — not confirmed either way by inspection alone.
- **`hopp-slaegten/01f-knud-knudsen-hopp-d1762.doc`** (27,461,632 bytes) — legacy binary `.doc`, same LibreOffice-fails/`antiword`-works situation as the "01" file above. Received/landed/triaged same as above. Filename on arrival was "01F Knud Knudsen Hopp 2002.doc" — the "2002" doesn't match the catalog's "Januar 2016 / januar 2025" version dating for this item; unexplained, not chased (per the human's standing preference to accumulate small discrepancies rather than raise them individually).
  - **Flyover (2026-08-08):** 91 pages per file metadata, matching the catalog's "91s" almost exactly. ~26,000 words extracted via `antiword`; reads as genuine, well-sourced biographical content — quotes an original 1725 lease document from Eskjær Godsarkiv. Looks content-complete. Same "2 kort" caveat as 01C above.

---

## Phased Reading Plan (2026-08-08, revised same day after Checkpoint 1)

Per the human's direction: absorb the two smaller files first (01, 01c), defer the largest (01f) to its own session.

- **Phase 1 — 01 + 01c, Checkpoint 1 (done, 2026-08-08):** root chain from 01's overview table (6-generation direct line + named branches) and Niels Jørgen Knudsen Hopp's own generation (himself, wife, 6 children) from 01c. 34 individuals, 12 families. See `projects/archive-digitization/context/hopp-slaegten-kapitel1-extraction.md`.
- **Scope correction:** 01c alone turned out to be comparable in total size to the *entire* Boe-slægten manuscript, not a single chapter of it — each of Niels Jørgen Knudsen Hopp's 6 children has their own children documented in full ("I.", "II." etc.), and so on further still. Phase 1 is now itself a multi-checkpoint effort, not a single pass. Checkpoint 1 above covers only the first generation; each child's own descendants are separate checkpoints going forward.
- **Phase 2 — 01f:** read the full 91 pages (Knud Knudsen Hopp, d.1762) — the largest single file received so far. Deferred, own session, not started. A stopgap stub sourced from an external secondary source is already in `tree.ged` (`#I384`, `#I385`) pending this.
- **Not scoped yet:** whether/how to model the overview table's forward references to chapters not yet received (02, 03, 04...) — working assumption is the same one used for Boe-slægten's own cross-chapter references: model what's confirmed, leave a `NOTE` pointer for what isn't yet in hand.

---

## Extraction Log

| Date | What was mined | Result |
|---|---|---|
| 2026-08-08 | Checkpoint 1: root chain (01's overview table) + Niels Jørgen Knudsen Hopp's generation (01c) — 34 individuals, 12 families | → `family-tree/tree.ged#I364`-`#I397`, `#F121`-`#F132`; notes in `projects/archive-digitization/context/hopp-slaegten-kapitel1-extraction.md` |

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-08 | Initial creation. Three files (01, 01c, 01f) triaged out of `incoming/` into permanent storage per human confirmation (cornerstone rule, `authoring-guidelines.md` §9.3). Flyover findings recorded per file. Phased reading plan set: 01+01c first, 01f deferred. None read yet. |
| 1.1 | 2026-08-08 | Checkpoint 1 of Phase 1 done. Recorded a real scope correction: 01c is comparable in size to the entire Boe-slægten manuscript, not one chapter — Phase 1 is now itself multi-checkpoint. |
