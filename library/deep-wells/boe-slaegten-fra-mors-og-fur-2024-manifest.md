# Boe-slægten fra Mors og Fur — Deep Well Manifest

Version 1.1 | 2026-08-06 | Production

---

## Document Purpose

Detailed extraction log for the "Boe-slægten fra Mors og Fur" deep well (`library/reference-index.md#boe-slaegten-fra-mors-og-fur`). Keeps `reference-index.md` itself short, per `knowledge/domains/authoring-guidelines.md` §9.2.

---

## What Is Stored Here

- **`boe-slaegten-fra-mors-og-fur-2024.docx`** (48,375,813 bytes / 46.1 MB) — the original manuscript, received 2026-08-06 via the human pushing it directly into `incoming/` with GitHub Desktop (bypassing the Google Drive connector's 10 MB cap that blocked the initial fetch attempt — see Version History). Verified after triage: valid Office Open XML zip container (78 internal entries, `word/document.xml` present, `zipfile.testzip()` clean), byte-identical in size to the Drive original (48,375,813 bytes per the file's Drive metadata). This is now the authoritative, byte-for-bit copy.
- **`boe-slaegten-fra-mors-og-fur-2024-fulltext.txt`** (153 KB, 147,860 characters) — a full plain-text extraction of the manuscript's content, pulled via the Google Drive connector's `read_file_content` tool on 2026-08-06, kept alongside the original as a convenience copy for quick text search/grep without needing a `.docx`-capable tool. No longer load-bearing for redundancy now that the original itself is stored — that was its purpose while the original was still unreachable.
- **Original manuscript metadata** (from Drive, 2026-08-06): title "2024 Boe-slægen fra Mors og Fur.docx", owner hogedalboe@gmail.com, `mimeType` `application/vnd.openxmlformats-officedocument.wordprocessingml.document`, Drive file ID `1-3X1fR0bJ2qnMjkERx1LTPhn-jOCto29`.

---

## Extraction Log

| Date | What was mined | Result |
|---|---|---|
| 2026-08-06 | Aneoversigt (p.3) and generation "02", Peder Christensen Boe (p.5-8) | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §Aneoversigt, §02 |
| 2026-08-06 | Generation "03", Christen Pedersen Boe (p.9-17), including the 1832 skifte | → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md` §03 |

No content has been promoted into any `knowledge/domains/` file yet — Phase 3 (domain buildout) has not started, so nothing here is cited with `[VERIFIED: boe-slaegten-fra-mors-og-fur]` from a domain document yet. That citation slug is reserved for when it does.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation. Registered the full-text extraction as a partial redundancy measure; documented that the original `.docx` binary could not be retrieved this session due to the Google Drive connector's 10 MB download cap, distinct from a GitHub size limit (46.1 MB original is well under that). |
| 1.1 | 2026-08-06 | Original `.docx` now stored — the human downloaded it from Drive and pushed it into the new `incoming/` folder via GitHub Desktop (see `Architecture.md` §3 and `incoming/README.md`), sidestepping the connector cap entirely. Triaged out of `incoming/` into this folder after verifying zip/docx integrity. The redundancy goal from v1.0 is now fully met, not partial. |
