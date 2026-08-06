# Boe-slægten fra Mors og Fur — Deep Well Manifest

Version 1.8 | 2026-08-06 | Production

---

## Document Purpose

Detailed extraction log for the "Boe-slægten fra Mors og Fur" deep well (`library/reference-index.md#boe-slaegten-fra-mors-og-fur`). Keeps `reference-index.md` itself short, per `knowledge/domains/authoring-guidelines.md` §9.2.

---

## What Is Stored Here

- **`boe-slaegten-fra-mors-og-fur-2024.docx`** (48,375,813 bytes / 46.1 MB) — the original manuscript, received 2026-08-06 via the human pushing it directly into `incoming/` with GitHub Desktop (bypassing the Google Drive connector's 10 MB cap that blocked the initial fetch attempt — see Version History). Verified after triage: valid Office Open XML zip container (78 internal entries, `word/document.xml` present, `zipfile.testzip()` clean), byte-identical in size to the Drive original (48,375,813 bytes per the file's Drive metadata). This is now the authoritative, byte-for-bit copy.
- **`boe-slaegten-fra-mors-og-fur-2024-fulltext.txt`** (153 KB, 147,860 characters) — a full plain-text extraction of the manuscript's content, pulled via the Google Drive connector's `read_file_content` tool on 2026-08-06, kept alongside the original as a convenience copy for quick text search/grep without needing a `.docx`-capable tool. No longer load-bearing for redundancy now that the original itself is stored — that was its purpose while the original was still unreachable.
- **Original manuscript metadata** (from Drive, 2026-08-06): title "2024 Boe-slægen fra Mors og Fur.docx", owner hogedalboe@gmail.com, `mimeType` `application/vnd.openxmlformats-officedocument.wordprocessingml.document`, Drive file ID `1-3X1fR0bJ2qnMjkERx1LTPhn-jOCto29`.
- **`boe-slaegten-fra-mors-og-fur-2024-media/`** — a subfolder holding images extracted from the `.docx` (48 real images embedded in it; text-only extraction had ignored these entirely until now). See that folder's own `manifest.md` for the per-image inventory — kept separate from this manifest because the schema is different (visual description, legibility/confidence, people depicted) and would otherwise dwarf the text extraction log below.

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
