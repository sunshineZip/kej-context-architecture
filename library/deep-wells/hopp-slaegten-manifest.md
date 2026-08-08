# Hopp-slægten — Deep Well Manifest

Version 1.6 | 2026-08-08 | Production

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
- **Phase 1 is now complete (2026-08-08):** Checkpoint 5 modeled Knud Nielsen Hopp's remaining children IV.-X., closing the gap left after Checkpoint 4. 01's overview table and all of 01C's content are read at the "our line" policy's depth. Only Phase 2 remains.
- **Phase 2 — 01f: complete (2026-08-08).** The full 91 pages (Knud Knudsen Hopp, d.1762) read cover to cover, "our line" cap applied from the start (unlike 01C). All 6 children's branches read: "a." (Mogens's counterfeiting scandal), "b.," "c.," "d." (the largest, 11 children, including a Viborg dyer-family saga), "e.," and "f." — see `projects/archive-digitization/context/hopp-slaegten-01f-extraction.md`. **Every currently-received Hopp-slægten file (01, 01C, 01F) is now fully read.**
- **Not scoped yet:** whether/how to model the overview table's forward references to chapters not yet received (02, 03, 04...) — working assumption is the same one used for Boe-slægten's own cross-chapter references: model what's confirmed, leave a `NOTE` pointer for what isn't yet in hand.
- **Scale, now measured (2026-08-08):** Checkpoint 2 read exactly one of Niels Jørgen Knudsen Hopp's 6 children's descendant lines to full depth — 230 individuals on its own, ~34% of 01C's total paragraph count. That prompted a real question from the human (why would KEJ document a clearly-unconnected branch this deeply?) and a policy change: **"our line" depth** — full depth stays reserved for the direct-line chapters (the chain toward KEJ himself, which the chapter numbering 01→02→...→07 traces via child "a" each generation, landing on his own surname). `01C`/`01F` are side branches off that chain ("01-c", "01-f"), so from Checkpoint 3 onward they're capped: children and grandchildren of the file's own subject get modeled individually, deeper generations are only modeled if short/simple, otherwise summarized in a `NOTE`. Checkpoint 2 itself stays as full-depth (not trimmed back) per the human's call.

---

## Extraction Log

| Date | What was mined | Result |
|---|---|---|
| 2026-08-08 | Checkpoint 1: root chain (01's overview table) + Niels Jørgen Knudsen Hopp's generation (01c) — 34 individuals, 12 families | → `family-tree/tree.ged#I364`-`#I397`, `#F121`-`#F132`; notes in `projects/archive-digitization/context/hopp-slaegten-kapitel1-extraction.md` |
| 2026-08-08 | Checkpoint 2: Dorthe Nielsdatter Hopp's child "I." (Anne Cathrine Nicolaisdatter Hjardemaal), full depth — 230 individuals, 75 families, 60 living (redacted, full records in `restricted/tree-sensitive.ged`) | → `family-tree/tree.ged#I398`-`#I627`, `#F133`-`#F207`; notes in `hopp-slaegten-kapitel1-extraction.md` |
| 2026-08-08 | "Our line" depth policy adopted (side branches capped, direct-line chapters stay full depth — see `hopp-slaegten-kapitel1-extraction.md`). Checkpoint 3: Dorthe's remaining children II.-V., capped — 25 individuals. Checkpoint 4: Berthe's children + Knud Nielsen Hopp's children I.-III. of 10 (IV.-X. not yet read) — 10 individuals | → `family-tree/tree.ged#I628`-`#I662`, `#F208`-`#F217` |
| 2026-08-08 | Checkpoint 5: Knud Nielsen Hopp's remaining children IV.-X. (7 children — 4 infant deaths, plus testament heirs VI., IX., X. with their own spouses), capped — 11 individuals, 4 families. **Phase 1 (01 + 01C) now fully read.** | → `family-tree/tree.ged#I663`-`#I673`, `#F218`-`#F221` |
| 2026-08-08 | Phase 2 (01F) started. Checkpoint 1: Knud Knudsen Hopp + wife + 6-child overview, replacing the Phase 1 stopgap stub. Checkpoint 2: branch "a." Mogens Knudsen Hopp — full counterfeiting-scandal story + 8 children, capped beyond. Checkpoint 3: branches "b." and "c.," both short, closed in full — 26 individuals, 11 families total. Branches "d." and "e." remain. | → `family-tree/tree.ged#I384`-`#I385` (updated), `#I674`-`#I699`, `#F127`, `#F222`-`#F232`; notes in `projects/archive-digitization/context/hopp-slaegten-01f-extraction.md` |
| 2026-08-08 | Checkpoint 4: branches "d." (Daniel Knudsen Hopp, 11 children — a Viborg dyer-family saga and a well-documented drunk-but-competent schoolteacher) and "e." (Hans Christian Knudsen Hopp, 2 children, one disputed and not modeled) — 16 individuals, 4 families. Confirmed via the Kilder list that nothing narrative remains unread. **01F fully read — Phase 2 complete.** | → `family-tree/tree.ged#I700`-`#I715`, `#F233`-`#F236` |

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-08 | Initial creation. Three files (01, 01c, 01f) triaged out of `incoming/` into permanent storage per human confirmation (cornerstone rule, `authoring-guidelines.md` §9.3). Flyover findings recorded per file. Phased reading plan set: 01+01c first, 01f deferred. None read yet. |
| 1.1 | 2026-08-08 | Checkpoint 1 of Phase 1 done. Recorded a real scope correction: 01c is comparable in size to the entire Boe-slægten manuscript, not one chapter — Phase 1 is now itself multi-checkpoint. |
| 1.2 | 2026-08-08 | Checkpoint 2 done: one full child-line (230 individuals) confirms 01c likely holds 800-1500+ individuals total at the human's chosen full-depth setting — several times the entire Boe-slægten manuscript's size. |
| 1.3 | 2026-08-08 | Adopted "our line" depth policy — full depth reserved for the actual direct-line chapters (toward KEJ), side branches within files like 01c capped from here on. Checkpoints 3-4 applied it (35 more individuals). Checkpoint 2 left as full-depth, not retroactively trimmed. |
| 1.4 | 2026-08-08 | Checkpoint 5 closes the honest gap from 1.2/1.3: Knud Nielsen Hopp's children IV.-X. now modeled (11 individuals, 4 families). **Phase 1 complete** — only Phase 2 (01f) remains open. |
| 1.5 | 2026-08-08 | Phase 2 (01f) started. Knud Knudsen Hopp's own biography, wife, and 3 of 6 children's branches ("a.," "b.," "c.") now read at full primary-source detail, replacing the earlier stopgap stub. Branches "d." and "e." remain — see `projects/archive-digitization/context/hopp-slaegten-01f-extraction.md`. |
| 1.6 | 2026-08-08 | Branches "d." and "e." read, completing 01F. **Phase 2 complete — every currently-received Hopp-slægten file (01, 01C, 01F) is now fully read** at the "our line" depth standard. |
