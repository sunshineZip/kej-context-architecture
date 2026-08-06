# Reference Index

Version 1.1 | 2026-08-06 | Production

---

## Document Purpose

Cross-domain registry of deep wells — large reference works mined incrementally, whether or not the physical file is stored in this repo. Every entry here is a heading; the heading text is the slug used to cite this work from any domain's `knowledge.md`.

> **Edit guard:** Adding or removing a deep well entry is a knowledge-layer content addition — use the normal `[FLAG FOR KNOWLEDGE UPDATE]` process. Promoting an entry from registry-only to physically stored (adding a file to `library/deep-wells/`) additionally requires the cornerstone rule (`knowledge/domains/authoring-guidelines.md` §9.3) — surface it as a question and wait for explicit human confirmation before storing the file.

---

## Registered Deep Wells

Add one heading per work, following this template (see `knowledge/domains/authoring-guidelines.md` §9.2):

```
## <slug-in-kebab-case>

- **Title:**
- **Format:**
- **Stored:** yes / no — if no, note how to reacquire it (ISBN, URL)
- **Location:** library/deep-wells/<filename> (only if Stored: yes)
- **Referenced by domains:** <domain-name>
- **Cornerstone status:** Yes/No — one line why
- **Extraction log:**
  - YYYY-MM-DD: <what was mined> → appended to <domain>/knowledge.md, per [VERIFIED: <slug>]
```

---

## boe-slaegten-fra-mors-og-fur

- **Title:** "Boe-slægten, Mors/Fur," Kapitel 1-4 — Knud Erik Jakobsen (KEJ), unpublished compiled manuscript, maj 2026
- **Format:** Original: .docx. Stored copy: plain-text extraction (see Stored, below) — the original's formatting, embedded structure, and any images are not preserved in the stored copy.
- **Stored:** yes — but only a full plain-text extraction (`Location`, below), not the original `.docx` binary. This session's Google Drive connector caps `download_file_content` at 10 MB and the file is 46.1 MB. Reacquire the original from KEJ via the human, or via Google Drive file ID `1-3X1fR0bJ2qnMjkERx1LTPhn-jOCto29` (owner hogedalboe@gmail.com) through a connector without the 10 MB cap.
- **Location:** library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-fulltext.txt (text extraction only — see `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-manifest.md` for the full explanation and extraction log)
- **Referenced by domains:** None yet — Phase 3 (domain buildout) has not started. Currently mined by `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`.
- **Cornerstone status:** Yes — multi-chapter (4 chapters plus anetavler appendices, ~148,000 characters), mined incrementally section by section, and Chapter 3's own cross-references (Vester Vandet/Møller line) already suggest relevance beyond a single future Boe domain.
- **Extraction log:**
  - 2026-08-06: Aneoversigt and generation "02" (Peder Christensen Boe) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`
  - 2026-08-06: Generation "03" (Christen Pedersen Boe, incl. 1832 skifte) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-07-16 | Initial creation. Empty registry — no deep wells registered yet. |
| 1.1 | 2026-08-06 | Registered the first deep well: `boe-slaegten-fra-mors-og-fur`, KEJ's compiled Boe-slægten manuscript. Stored as a partial redundancy measure (full-text extraction only — the original .docx exceeds this session's Google Drive connector's 10 MB download cap), per human confirmation to proceed with storing what's retrievable now. |
