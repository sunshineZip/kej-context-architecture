# Reference Index

Version 1.8 | 2026-08-06 | Production

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
- **Format:** .docx (original, now stored — see Stored, below), plus a plain-text extraction kept alongside for convenience.
- **Stored:** yes — the original `.docx` binary, pushed directly into `incoming/` by the human via GitHub Desktop (2026-08-06) and triaged into this folder, bypassing the Google Drive connector's 10 MB cap that blocked the initial fetch attempt entirely.
- **Location:** library/deep-wells/boe-slaegten-fra-mors-og-fur-2024.docx (original — see `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-manifest.md` for the full history and text extraction log; a plain-text extraction also sits alongside it as `boe-slaegten-fra-mors-og-fur-2024-fulltext.txt` — not itself a registered `Location`, since `scripts/validate.ps1` only checks the first `Location` line per entry; this is a known, harmless pre-existing warning, not new to this edit)
- **Media:** library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-media/ (images extracted from the source — own manifest, 48 embedded images found, 16 processed so far)
- **Referenced by domains:** None yet — Phase 3 (domain buildout) has not started. Currently mined by `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`.
- **Cornerstone status:** Yes — multi-chapter (4 chapters plus anetavler appendices, ~148,000 characters), mined incrementally section by section, and Chapter 3's own cross-references (Vester Vandet/Møller line) already suggest relevance beyond a single future Boe domain.
- **Extraction log:**
  - 2026-08-06: Aneoversigt and generation "02" (Peder Christensen Boe) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`
  - 2026-08-06: Generation "03" (Christen Pedersen Boe, incl. 1832 skifte) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`
  - 2026-08-06: Generations "04"/"05" (Peder/Christen Christensen Boe) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`
  - 2026-08-06: First image batch (6 images, Aneoversigt/generations "02"-"05") → `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md`
  - 2026-08-06: Efterslægt branch g checkpoints 1-4 (children IV/VI/VII, I/V/IX/XI, II/X, III — 84 new individuals) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`; images tracked in `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md`

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-07-16 | Initial creation. Empty registry — no deep wells registered yet. |
| 1.1 | 2026-08-06 | Registered the first deep well: `boe-slaegten-fra-mors-og-fur`, KEJ's compiled Boe-slægten manuscript. Stored as a partial redundancy measure (full-text extraction only — the original .docx exceeds this session's Google Drive connector's 10 MB download cap), per human confirmation to proceed with storing what's retrievable now. |
| 1.2 | 2026-08-06 | Original `.docx` now stored — human pushed it into the new `incoming/` folder via GitHub Desktop, sidestepping the connector cap. `Location` updated to point to the original file; the earlier text-only extraction remains as a convenience copy. |
| 1.3 | 2026-08-06 | Extraction log backfilled with generations "04"/"05" (bookkeeping gap — both had been read, just not logged here). Added the new `-media/` subfolder: image extraction now proceeds alongside text extraction rather than being ignored, per human direction. |
| 1.4 | 2026-08-06 | Efterslægt read-through started (branches a/c/d/f/h/i, b); media count updated to 8 processed. Detail lives in the deep-well manifest, not duplicated here. |
| 1.5 | 2026-08-06 | Efterslægt branch e read; media count updated to 9 processed. Only branch g remains. |
| 1.6 | 2026-08-06 | Branch g checkpoints 1-2 read; media count updated to 12 processed. |
| 1.7 | 2026-08-06 | Branch g checkpoint 3 read (children II/X, 35 new individuals). No new images filed this checkpoint — media count unchanged at 12. |
| 1.8 | 2026-08-06 | Branch g checkpoint 4 read (child III, 23 new individuals); media count updated to 16 processed. Notable: the manuscript's own author, KEJ, appears in the text as a family member by a former marriage. |
