# Reference Index

Version 1.26 | 2026-08-08 | Production

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
- **Media:** library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-media/ (images extracted from the source — own manifest, 48 embedded images found, all 48 checked, 47 filed — only image18, a confirmed exact duplicate, is not stored). **Split 2026-08-08:** 21 of the 47 confirmed to depict no living person stay in this public folder; the other 26 (confirmed/plausible living individuals, or not yet fully identified) moved to `restricted/media/` — a private companion repo, see `Architecture.md` §3 — with its own manifest, `restricted/media-manifest.md`.
- **Referenced by domains:** None yet — Phase 3 (domain buildout) has not started. **The entire manuscript has now been mined**, across five extraction notes files: `boe-slaegten-chapter1-extraction.md` through `...-chapter4-extraction.md`, plus `...-anetavler-kilder-extraction.md` for the pedigree appendices and bibliography.
- **Cornerstone status:** Yes — multi-chapter (4 chapters plus anetavler appendices, ~148,000 characters), mined in full across generations "02"-"05" of the direct Boe line, the complete Efterslægt, and three further pedigree appendices (Toft, Møller, Søgaard, Lundgaard, Degn families). Chapter 3's own cross-references (Vester Vandet/Møller line) already suggested relevance beyond a single future Boe domain, since confirmed further by the Anetavler.
- **Extraction log:**
  - 2026-08-06: Aneoversigt and generation "02" (Peder Christensen Boe) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`
  - 2026-08-06: Generation "03" (Christen Pedersen Boe, incl. 1832 skifte) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`
  - 2026-08-06: Generations "04"/"05" (Peder/Christen Christensen Boe) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`
  - 2026-08-06: First image batch (6 images, Aneoversigt/generations "02"-"05") → `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md`
  - 2026-08-06: Efterslægt branch g checkpoints 1-5, complete (children IV/VI/VII, I/V/IX/XI, II/X, III, VIII — 139 new individuals; branch g and Efterslægt now fully read) → `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`; images tracked in `boe-slaegten-fra-mors-og-fur-2024-media/manifest.md`
  - 2026-08-06: Kapitel 2 (Boe-slægten, Jørsby), fully read (61 new individuals) → `projects/archive-digitization/context/boe-slaegten-chapter2-extraction.md`
  - 2026-08-06: Kapitel 3 (Boe-slægten, Vester Vandet), fully read (33 new individuals) → `projects/archive-digitization/context/boe-slaegten-chapter3-extraction.md`
  - 2026-08-06: Kapitel 4 (Boe-slægten Thy), fully read — a cross-reference to Kapitel 3, no new individuals → `projects/archive-digitization/context/boe-slaegten-chapter4-extraction.md`
  - 2026-08-06: Anetavler and Kilder, fully read — the entire manuscript is now read (27 new individuals) → `projects/archive-digitization/context/boe-slaegten-anetavler-kilder-extraction.md`

---

## ejerslev-1970-religios-bevaegelse-i-jorsby

- **Title:** "En religiøs bevægelse i Jørsby" — M. P. Ejerslev. Historisk Årbog for Thy og Mors, 1970, s. 425-442.
- **Format:** .pdf (6 pages, scanned/typeset journal article, OCR-clean text)
- **Stored:** yes — Nikolaj (Hannes barnebarn) found and uploaded it directly (2026-08-06), sourced from arkivthy.dk's public archive of the yearbook.
- **Location:** library/deep-wells/ejerslev-1970-religios-bevaegelse-i-jorsby.pdf
- **Referenced by domains:** None yet — Phase 3 (domain buildout) has not started.
- **Cornerstone status:** Borderline, stored on explicit human confirmation regardless. It's a short, single-topic article, not something mined incrementally over months — the usual strongest cornerstone signal. But it is directly cited in `boe-slaegten-fra-mors-og-fur`'s own bibliography (as "Historisk Årbog for Thy og Mors 1968-70" on Peder Lassen Grud), which is itself cornerstone-status, and it's hosted only on a small regional local-archive site whose long-term URL stability isn't guaranteed the way a published book's would be. Both weigh toward keeping a permanent copy even without a slam-dunk case on any single §9.3 criterion.
- **Extraction log:**
  - 2026-08-06: Full article read — primary-source detail on "Kyssesekten"/Peder Lassen Grud (`family-tree/tree.ged#I7`), confirming his paternity of Sidsel Lauridsdatter Toft's son Mads Pedersen (`#I6`, narrows his birth to "maj 1773," now added as `tree.ged`'s best-supported BIRT date) and revealing that Sidsel (`#I2`) was present at a raided sect gathering hosted by a tenant farmer named "Peder Boe" — very likely Peder Christensen Boe himself (`#I1`), the direct-line ancestor. Added as NOTE citations on I1, I2, I6, I7. An unidentified "Jens Boe," also present at that gathering, is queued in `grandfather-review/queue.md` item 16 rather than modeled as an individual on this evidence alone. Cross-references `grandfather-review/queue.md` item 4 (Mads Pedersen's birth year) with the new corroborating source.

---

## forskellige-boe-slaegter

- **Title:** "Forskellige Boe-slægter" — Knud Erik Jakobsen (KEJ), unpublished compilation, august 2026
- **Format:** .docx (original, stored)
- **Stored:** yes — attached directly to KEJ's 2026-08-08 email reply, landed in `incoming/` and triaged the same day.
- **Location:** library/deep-wells/forskellige-boe-slaegter-2026.docx (see `library/deep-wells/forskellige-boe-slaegter-2026-manifest.md` for the full history and text extraction log)
- **Referenced by domains:** None yet — Phase 3 (domain buildout) has not started.
- **Cornerstone status:** Yes — personal, unpublished, not reacquirable except from KEJ; covers several distinct Boe lineages (per its own table of contents) substantial enough to likely need mining across more than one session, the same reasoning as `boe-slaegten-fra-mors-og-fur`.
- **Extraction log:**
  - 2026-08-08: Fully read (7 sections, 746 paragraphs) as reference prose, not modeled as `tree.ged` individuals — same pattern as the original manuscript's own "Boe-slægter" comparative appendix. Nykøbing Mors hypothesis conclusively ruled out (named children, probate citation). Himmerland/Thy hypothesis now has a named, dated, still-unconfirmed candidate connecting individual (Anders Pedersen Boe i Vorring, Nors sogn, probate 1759) — the one genuinely open lead. Sønderjylland/Slesvig, Fyn-slægten, and Nyord (a new, large section not in the original manuscript) all confirmed unconnected. Enriched `NOTE` added to `family-tree/tree.ged#I1`. Full notes: `projects/archive-digitization/context/forskellige-boe-slaegter-extraction.md`.

---

## kej-slaegtshistorie-og-lokalhistorie-2026-katalog

- **Title:** "2026 KEJ Slægtshistorie og lokalhistorie" — Knud Erik Jakobsen (KEJ), personal catalog, 2026
- **Format:** .docx (original, stored)
- **Stored:** yes — attached directly to KEJ's 2026-08-08 email reply, landed in `incoming/` and triaged the same day.
- **Location:** library/deep-wells/kej-slaegtshistorie-og-lokalhistorie-2026.docx
- **Referenced by domains:** None — not a genealogical source, see below.
- **Cornerstone status:** N/A — this isn't narrative content to mine for facts, it's KEJ's own dated index of every *slægt*/local-history item he's written (title, page count, version date). Registered here anyway (rather than as a `projects/archive-digitization/context/` note) because it's a raw external file, matching where every other raw file in this repo physically lives; stored because it's non-reacquirable and directly useful for diffing against future updates from KEJ, not because it clears the usual mined-incrementally bar.
- **Extraction log:**
  - 2026-08-08: Used in full to refresh `projects/archive-digitization/context/intake-manifest.md` — added two items missing from the manifest's original relayed-email source (Slægt I under Svend Åge Pedersens Slægter, Sæbygårds Mølle og Nørremølle under the mills), refreshed roughly two dozen version/date fields, and added a new §10 for three personal-memoir items with no existing category. Not itself expected to need further mining — its value was in the comparison, already done.

---

## hopp-slaegten

- **Title:** "Hopp-slægten," Kapitel 1 (items 01, 01C, 01F so far, more expected) — Knud Erik Jakobsen (KEJ), unpublished, per-chapter files
- **Format:** mixed — legacy `.doc` and modern `.docx`, per file (see manifest)
- **Stored:** yes — attached to KEJ's 2026-08-08 email (relayed via the human), landed in `incoming/`, triaged same day.
- **Location:** library/deep-wells/hopp-slaegten/ (growing folder, one file per chapter — see `library/deep-wells/hopp-slaegten-manifest.md` for the full history, per-file flyover findings, and extraction log)
- **Referenced by domains:** None yet — not read.
- **Cornerstone status:** Yes — personal, unpublished, not reacquirable except from KEJ; distributed as many separate per-chapter files (16+ expected per `intake-manifest.md` §3) that will accumulate here over an extended period, the strongest form of the "mined incrementally over months" criterion.
- **Extraction log:**
  - 2026-08-08: Checkpoint 1 — root chain (01's overview table, 6 generations) and Niels Jørgen Knudsen Hopp's own generation (01C: himself, wife, 6 children) → `family-tree/tree.ged#I364`-`#I397`. See `hopp-slaegten-manifest.md`'s Phased Reading Plan — 01C turned out comparable in size to the entire Boe-slægten manuscript, so this is one checkpoint of an ongoing multi-checkpoint read, not the whole file. 01F (91 pages) still deferred to its own session.
  - 2026-08-08: Checkpoint 2 — Dorthe Nielsdatter Hopp's child "I." (Anne Cathrine Nicolaisdatter Hjardemaal), full depth per the human's choice → `family-tree/tree.ged#I398`-`#I627`, 230 individuals, 75 families, 60 living. Confirms 01C alone likely holds 800-1500+ individuals at this depth setting.
  - 2026-08-08: "Our line" depth policy adopted (side branches capped, direct-line chapters stay full depth). Checkpoints 3-4 — Dorthe's remaining children II.-V. (25 individuals) and Berthe's children + Knud Nielsen Hopp's children I.-III. of 10 (10 individuals; IV.-X. not yet read) → `family-tree/tree.ged#I628`-`#I662`, `#F208`-`#F217`. See `hopp-slaegten-manifest.md` and `projects/archive-digitization/context/hopp-slaegten-kapitel1-extraction.md`.
  - 2026-08-08: Checkpoint 5 — Knud Nielsen Hopp's remaining children IV.-X., capped (11 individuals, 4 families) → `family-tree/tree.ged#I663`-`#I673`, `#F218`-`#F221`. **Phase 1 (01 + 01C) now fully read** — only Phase 2 (01F, deferred) remains open.
  - 2026-08-08: Phase 2 (01F) started — Knud Knudsen Hopp himself, his wife, and 3 of 6 children's branches ("a." Mogens's counterfeiting scandal, "b.," "c.") read, replacing the earlier stopgap stub (26 individuals, 11 families). Branches "d." (11 children) and "e." (2 children) remain. See `projects/archive-digitization/context/hopp-slaegten-01f-extraction.md`.
  - 2026-08-08: Branches "d." (Daniel Knudsen Hopp — a Viborg dyer-family saga plus a colorfully-documented drunk-but-competent schoolteacher) and "e." read, closing 01F (16 individuals, 4 families). **Phase 2 complete — every currently-received Hopp-slægten file (01, 01C, 01F) is now fully read.**

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
| 1.9 | 2026-08-06 | Branch g checkpoint 5 read (child VIII, 55 new individuals) — branch g and Efterslægt now fully read; media count updated to 17 processed. |
| 1.10 | 2026-08-06 | Chapter 1 complete. Chapter 2 (Boe-slægten, Jørsby) read in full — 61 new individuals, filling in generation "02" wife Sidsel Lauridsdatter Toft's own ancestry. New chapter-specific extraction file. No new images. |
| 1.11 | 2026-08-06 | Chapter 3 (Boe-slægten, Vester Vandet) read in full — 33 new individuals, filling in generation "03" wife Mette Jensdatter's own ancestry; media count updated to 20 processed, including KEJ's own handwritten master pedigree chart. |
| 1.12 | 2026-08-06 | Chapter 4 (Boe-slægten Thy) read in full — confirmed a one-page cross-reference to Chapter 3, no new individuals. All four numbered chapters now complete. |
| 1.13 | 2026-08-06 | Anetavler and Kilder read in full — **the entire manuscript is now read**. 27 new individuals; media status updated to all 48 images checked, 25 filed. |
| 1.14 | 2026-08-06 | Extracted and stored the 20 remaining relevant images (14 previously unmatched, 6 further Anetavler chart pages) so they're no longer only reachable by re-opening the `.docx` — media status updated to 45 of 48 filed. Two images that turned out to belong to a different manuscript entirely (Hopp-slægten) moved to a new, deliberately unregistered preview location instead of a formal deep well, since that source hasn't been received yet. |
| 1.15 | 2026-08-06 | Correction: the two images moved out in 1.14 were misidentified — the human confirmed both are actually Boe-slægten family photos (Hanne Boe/Knud Erik Jakobsen; a 1995 family group), not Hopp-slægten. Moved back; media status now 47 of 48 filed, only the confirmed duplicate (image18) unstored. |
| 1.16 | 2026-08-06 | Registered and stored a second deep well: `ejerslev-1970-religios-bevaegelse-i-jorsby`, a 1970 journal article on "Kyssesekten" that the Boe-slægten manuscript's own bibliography already cited but this project never had in hand. The human found and uploaded it directly, then confirmed storage per the cornerstone rule despite it being a borderline case (small, single-topic, technically re-fetchable). Used to answer a direct question about the Boe bloodline's connection to the sect. |
| 1.17 | 2026-08-08 | Boe-slægten deep well's Media field updated: 26 of 47 stored images (any confirmed/plausible living individual, plus everything not yet fully identified) moved to `restricted/media/`, a private companion repo, per the human's rule that even one living person present — or an unanalysed image at all — defaults to restricted. 21 confirmed-safe images remain in the public folder. |
| 1.18 | 2026-08-08 | Registered and stored two new deep wells, both attached to KEJ's 2026-08-08 email reply: `forskellige-boe-slaegter` (several separate, likely-unconnected Boe lineages elsewhere in Denmark — cornerstone, same reasoning as `boe-slaegten-fra-mors-og-fur`; not yet read) and `kej-slaegtshistorie-og-lokalhistorie-2026-katalog` (KEJ's own dated catalog of everything he's written — not mined for facts, already used in full to refresh `intake-manifest.md`; registered here rather than as a project note because it's a raw external file, matching where every other raw file lives). Human confirmed physical storage for both per the cornerstone rule before either was written here. |
| 1.19 | 2026-08-08 | Registered and stored `hopp-slaegten`, the first Hopp material actually in hand (items 01, 01C, 01F) — structured as a growing folder (`library/deep-wells/hopp-slaegten/`) rather than a single file, since KEJ distributes this line as many separate per-chapter files instead of one combined manuscript. Human confirmed storage per the cornerstone rule; not yet read — see `hopp-slaegten-manifest.md`'s Phased Reading Plan. |
| 1.20 | 2026-08-08 | `hopp-slaegten`'s extraction log updated: Checkpoint 1 done (root chain + Niels Jørgen Knudsen Hopp's generation, 34 individuals). 01C turned out comparable in size to the entire Boe-slægten manuscript — reading it is now a multi-checkpoint effort, not a single pass. |
| 1.21 | 2026-08-08 | Checkpoint 2 done: one full child-line, 230 individuals (60 living). Real data point now supports an estimate of 800-1500+ individuals for 01C alone at the human's chosen full-depth setting. |
| 1.22 | 2026-08-08 | `hopp-slaegten` extraction log updated with the "our line" depth policy and Checkpoints 3-4 (35 more individuals), closing a gap left after the policy was adopted mid-session. |
| 1.23 | 2026-08-08 | `forskellige-boe-slaegter` fully read — extraction log updated. Nykøbing Mors hypothesis conclusively ruled out; Himmerland/Thy hypothesis now has a named, still-unconfirmed candidate link; Sønderjylland/Slesvig, Fyn, and Nyord all confirmed unconnected. See `projects/archive-digitization/context/forskellige-boe-slaegter-extraction.md`. |
| 1.24 | 2026-08-08 | `hopp-slaegten` Checkpoint 5: Knud Nielsen Hopp's remaining children IV.-X. modeled (11 individuals, 4 families), closing the gap left after Checkpoint 4. **Phase 1 (01 + 01C) now fully read.** |
| 1.25 | 2026-08-08 | `hopp-slaegten` Phase 2 (01F) started — Knud Knudsen Hopp's own biography plus 3 of 6 children's branches read (26 individuals, 11 families), replacing the earlier stopgap stub. Branches "d." and "e." remain. |
| 1.26 | 2026-08-08 | `hopp-slaegten` Phase 2 complete — branches "d." and "e." read (16 individuals, 4 families). **Every currently-received Hopp-slægten file (01, 01C, 01F) is now fully read** at the "our line" depth standard. |
