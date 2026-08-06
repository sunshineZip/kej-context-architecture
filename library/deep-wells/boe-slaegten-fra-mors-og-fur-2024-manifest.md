# Boe-slægten fra Mors og Fur — Deep Well Manifest

Version 1.0 | 2026-08-06 | Production

---

## Document Purpose

Detailed extraction log for the "Boe-slægten fra Mors og Fur" deep well (`library/reference-index.md#boe-slaegten-fra-mors-og-fur`). Keeps `reference-index.md` itself short, per `knowledge/domains/authoring-guidelines.md` §9.2.

---

## What Is Stored Here, and What Isn't

- **`boe-slaegten-fra-mors-og-fur-2024-fulltext.txt`** (153 KB, 147,860 characters) — a full plain-text extraction of the manuscript's content, pulled via the Google Drive connector's `read_file_content` tool on 2026-08-06. This is genuine redundancy for the document's actual text: the pedigree tables, generation narratives, transcribed kirkebog/skifte passages, and source citations are all present in this file.
- **The original `.docx` binary is NOT stored here.** The source file is 48,375,813 bytes (46.1 MB), well under GitHub's ~100 MB limit — so size was never the blocker for storing the *original*. The blocker is this session's Google Drive connector: its `download_file_content` tool caps at 10 MB and returned "File too large for download" for the actual binary. The file's Drive permissions show only the owner (`hogedalboe@gmail.com`) with no public/"anyone with link" grant, so an unauthenticated direct-download URL was not attempted (would fail, and isn't the right way to route around an access control). Retrieving the true original `.docx` — with its original formatting, embedded structure, and any images — needs either a Drive connector without the 10 MB cap, or the human uploading/attaching the file directly to a session that can receive it whole.
- **Original manuscript metadata** (from Drive, 2026-08-06): title "2024 Boe-slægen fra Mors og Fur.docx", owner hogedalboe@gmail.com, `mimeType` `application/vnd.openxmlformats-officedocument.wordprocessingml.document`, Drive file ID `1-3X1fR0bJ2qnMjkERx1LTPhn-jOCto29`.

> **Open item, not silently resolved:** this manifest exists specifically because the "original file, not just its text" redundancy goal is only partially met. See `projects/archive-digitization/TODO.md` for the outstanding action (re-attempt the original-binary fetch when a suitable path exists).

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
