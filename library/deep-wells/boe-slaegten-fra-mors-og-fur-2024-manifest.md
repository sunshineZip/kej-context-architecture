# Boe-slægten fra Mors og Fur — Deep Well Manifest

Version 1.14 | 2026-08-06 | Production

---

## Document Purpose

Detailed extraction log for the "Boe-slægten fra Mors og Fur" deep well (`library/reference-index.md#boe-slaegten-fra-mors-og-fur`). Keeps `reference-index.md` itself short, per `knowledge/domains/authoring-guidelines.md` §9.2.

---

## What Is Stored Here

- **`boe-slaegten-fra-mors-og-fur-2024.docx`** (48,375,813 bytes / 46.1 MB) — the original manuscript, received 2026-08-06 via the human pushing it directly into `incoming/` with GitHub Desktop (bypassing the Google Drive connector's 10 MB cap that blocked the initial fetch attempt — see Version History). Verified after triage: valid Office Open XML zip container (78 internal entries, `word/document.xml` present, `zipfile.testzip()` clean), byte-identical in size to the Drive original (48,375,813 bytes per the file's Drive metadata). This is now the authoritative, byte-for-bit copy.
- **`boe-slaegten-fra-mors-og-fur-2024-fulltext.txt`** (153 KB, 147,860 characters) — a full plain-text extraction of the manuscript's content, pulled via the Google Drive connector's `read_file_content` tool on 2026-08-06, kept alongside the original as a convenience copy for quick text search/grep without needing a `.docx`-capable tool. No longer load-bearing for redundancy now that the original itself is stored — that was its purpose while the original was still unreachable.
- **Original manuscript metadata** (from Drive, 2026-08-06): title "2024 Boe-slægen fra Mors og Fur.docx", owner hogedalboe@gmail.com, `mimeType` `application/vnd.openxmlformats-officedocument.wordprocessingml.document`, Drive file ID `1-3X1fR0bJ2qnMjkERx1LTPhn-jOCto29`.
- **`boe-slaegten-fra-mors-og-fur-2024-media/`** — a subfolder holding images extracted from the `.docx` (48 real images embedded in it, all 48 now checked, 45 physically stored). See that folder's own `manifest.md` for the per-image inventory — kept separate from this manifest because the schema is different (visual description, legibility/confidence, people depicted) and would otherwise dwarf the text extraction log below. The 3 not stored: `image18` (a confirmed exact duplicate of `image2`), and `image26`/`image27`, which turned out to belong to a different manuscript entirely (KEJ's separate Hopp-slægten project) and were moved to `library/deep-wells/hopp-slaegten-preview-images/` instead.

---

## Extraction Log

| Date | What was mined | Result |
|---|---|---|
| 2026-08-06 | Aneoversigt (p.3) and generation "02", Peder Christensen Boe (p.5-8) | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Aneoversigt, §02 |
| 2026-08-06 | Generation "03", Christen Pedersen Boe (p.9-17), including the 1832 skifte | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §03 |
| 2026-08-06 | Generation "04", Peder Christensen Boe (p.18-20) | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §04 |
| 2026-08-06 | Generation "05", Christen Pedersen Boe (p.21-24) | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §05 |
| 2026-08-06 | Images tied to Aneoversigt/generations "02"-"05" (6 images: 1 map, 2 scanned documents, 3 photos) | → `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` |
| 2026-08-06 | Efterslægt branches a/c/d/f/h/i (six short, closed lines) and b (Marie Christensen Boe, incl. Esper Marinus's own line — 17 new individuals) | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Efterslægt |
| 2026-08-06 | Images for Efterslægt branch b (2 images, one plausible wedding-portrait match, one unclassified) | → `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` |
| 2026-08-06 | Efterslægt branch e (Jens Christensen Boe, incl. "K.K.K. Boe"'s own line — 40 new individuals) | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Efterslægt |
| 2026-08-06 | Image for Efterslægt branch e (1 plausible family-portrait match) | → `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` |
| 2026-08-06 | Efterslægt branch g, part 1 of 5 (children "IV."/"VI."/"VII." — 5 new individuals) | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Efterslægt |
| 2026-08-06 | Efterslægt branch g, part 2 of 5 (children "I."/"V."/"IX."/"XI." — 21 new individuals) + 2 confirmed image matches | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Efterslægt; `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` |
| 2026-08-06 | Efterslægt branch g, part 3 of 5 (children "II."/"X." — 35 new individuals, largest checkpoint yet) + 2 images checked, neither matched | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Efterslægt; `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` |
| 2026-08-06 | Efterslægt branch g, part 4 of 5 (child "III." — 23 new individuals across 5 generations, incl. the manuscript's own author KEJ as a family member by marriage) + 2 confirmed images, 2 plausible | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Efterslægt; `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` |
| 2026-08-06 | Efterslægt branch g, part 5 of 5 (child "VIII." — 55 new individuals across 4 generations, the largest single checkpoint). **Branch g, Efterslægt, and Chapter 1's family-tree read-through complete.** + 1 confirmed image | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Efterslægt; `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` |
| 2026-08-06 | **Kapitel 2 (Boe-slægten, Jørsby), fully read** (p.55-65) — Niels Toft's family and Laurids Nielsen Toft's family, filling in Sidsel Lauridsdatter Toft's (`@I2@`) own ancestry and three previously-undocumented siblings' descendant lines. 61 new individuals, 15 new families. New extraction notes file (chapter-specific, not appended to the Chapter 1 file) | → `projects/archive-digitization/context/boe-slaegten-chapter2-extraction.md` |
| 2026-08-06 | **Kapitel 3 (Boe-slægten, Vester Vandet), fully read** (p.66-73) — the Møller (miller) family, filling in Mette Jensdatter's (`@I10@`) own ancestry (previously a placeholder family, `@F15@`). 33 new individuals, 6 new families. Found a previously undocumented fact (a son born out of wedlock before Mette's marriage) and, via a checked image, KEJ's own master pedigree chart — used to help resolve a wedding-date contradiction (`grandfather-review/queue.md` item 9) | → `projects/archive-digitization/context/boe-slaegten-chapter3-extraction.md` |
| 2026-08-06 | **Kapitel 4 (Boe-slægten Thy), fully read** (p.74) — confirmed to be a one-page cross-reference back to Kapitel 3, no new individuals. All four numbered chapters now complete | → `projects/archive-digitization/context/boe-slaegten-chapter4-extraction.md` |
| 2026-08-06 | **Anetavler and Kilder, fully read** (p.75-96) — the FULL MANUSCRIPT IS NOW READ. Søgaard-slægten, Lundgaard-slægten/Fur-slægter, and Degn-slægten Frammerslev/Fur (chart-only appendices, discovered to have no prose content) filled in Bodil Kirstine Iversdatter's and Mette Jensen's own ancestries, closing two long-open placeholder families. Boe-slægter (comparative research on unconnected "Boe" families) read as reference prose, not modeled in `tree.ged`. Kilder is a bibliography, no new individuals. 27 new individuals, 13 new families | → `projects/archive-digitization/context/boe-slaegten-anetavler-kilder-extraction.md` |

No content has been promoted into any `knowledge/domains/` file yet — Phase 3 (domain buildout) has not started, so nothing here is cited with `[VERIFIED: boe-slaegten-fra-mors-og-fur]` from a domain document yet. That citation slug is reserved for when it does. From this point on, text and image extraction proceed together per section rather than as separate passes — see `projects/archive-digitization/TODO.md`.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation. Registered the full-text extraction as a partial redundancy measure; documented that the original `.docx` binary could not be retrieved this session due to the Google Drive connector's 10 MB download cap, distinct from a GitHub size limit (46.1 MB original is well under that). |
| 1.1 | 2026-08-06 | Original `.docx` now stored — the human downloaded it from Drive and pushed it into the new `incoming/` folder via GitHub Desktop (see `Architecture.md` §3 and `incoming/README.md`), sidestepping the connector cap entirely. Triaged out of `incoming/` into this folder after verifying zip/docx integrity. The redundancy goal from v1.0 is now fully met, not partial. |
| 1.2 | 2026-08-06 | Extraction Log backfilled with generations "04"/"05" (previously only "02"/"03" were listed, despite both having been read — a bookkeeping gap, not a re-read). Added `boe-slaegten-fra-mors-og-fur-2024-media/`, the first extraction of images from the manuscript — 48 embedded images found, ignored entirely until now; first batch (6 images tied to sections already read) processed with its own manifest. |
| 1.3 | 2026-08-06 | Logged the start of Efterslægt (generation 05's descendants, branches a-i): branches a/c/d/f/h/i and b done, plus 2 more images. |
| 1.4 | 2026-08-06 | Logged Efterslægt branch e (40 new individuals, largest single addition yet) plus 1 more image. Only branch g remains in Efterslægt. |
| 1.5 | 2026-08-06 | Branch g scoped into 5 checkpoints by size; part 1 of 5 (three smallest children) logged. |
| 1.6 | 2026-08-06 | Logged branch g part 2 of 5 (21 new individuals, 2 confirmed images). Two new grandfather-review items raised from this checkpoint. |
| 1.7 | 2026-08-06 | Logged branch g part 3 of 5 (35 new individuals, the largest checkpoint yet; 2 images checked, none matched). One new grandfather-review item raised. |
| 1.8 | 2026-08-06 | Logged branch g part 4 of 5 (23 new individuals; 2 confirmed images, 2 plausible). Notable: revealed the manuscript's author is himself a family member by a former marriage. |
| 1.9 | 2026-08-06 | Logged branch g part 5 of 5 (55 new individuals, largest checkpoint yet; 1 confirmed image). Branch g, Efterslægt, and Chapter 1's family-tree read-through are now complete: 240 individuals, 85 families in `family-tree/tree.ged`. |
| 1.10 | 2026-08-06 | Logged Kapitel 2, fully read (61 new individuals, 15 new families — 301 individuals, 100 families total in `family-tree/tree.ged`). Extraction notes now split across chapter-specific files; Kapitel 2's own file is `projects/archive-digitization/context/boe-slaegten-chapter2-extraction.md`. |
| 1.11 | 2026-08-06 | Logged Kapitel 3, fully read (33 new individuals, 6 new families — 334 individuals, 106 families total). Found KEJ's own handwritten master pedigree chart while checking images; used it to help resolve a wedding-date contradiction. |
| 1.12 | 2026-08-06 | Logged Kapitel 4, fully read — a one-page cross-reference to Kapitel 3, no new individuals. All four numbered chapters of the manuscript are now complete; only the Anetavler and Kilder remain. |
| 1.13 | 2026-08-06 | Logged the Anetavler and Kilder, fully read. **The entire manuscript is now read.** 27 new individuals, 13 new families — 361 individuals, 117 families total in `family-tree/tree.ged`. |
| 1.14 | 2026-08-06 | Extracted and stored the 20 images previously only described-but-unfiled, closing a real risk the human flagged: a description in a manifest doesn't guarantee anyone revisits the actual image. 45 of 48 images now physically stored; the remaining 3 are a confirmed duplicate and two images moved to a new Hopp-slægten preview location instead (not part of this manuscript). |
