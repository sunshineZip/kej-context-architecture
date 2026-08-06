# Boe-slægten fra Mors og Fur — Media Manifest

Version 1.0 | 2026-08-06 | Production

---

## Document Purpose

Inventory of images extracted from `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024.docx` and stored in this folder — photographs, scanned documents, and maps embedded in KEJ's manuscript, previously untouched by the text-only extraction. Companion to `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-manifest.md`, which covers the manuscript's *text* extraction log. Built incrementally, in step with the text read-through from now on — see that manifest's Extraction Log and `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`'s Progress checklist for what's been read.

---

## How This Was Built, and Its Limits

The source `.docx` is a zip container; its 62 embedded media files (48 real images, 14 redundant `.wdp` duplicates already discarded) live at `word/media/`. Word also stores each image's *original local filename* (from when KEJ inserted it) as alt-text metadata — a genuinely useful hint, reproduced below as **KEJ's filename**, but it is *his* label, not a verified fact, and may itself contain errors (see image 2's own note).

**Document position is approximate.** A raw XML byte-offset ordering was tried first and rejected as a reliable signal — a single embedded image's own layout markup can be tens of thousands of XML characters, which drowns out the surrounding prose and makes offset-based section boundaries noisy. Position below is set by content judgement (matching an image against text already extracted) wherever possible, falling back to document order otherwise.

**Description and identification are AI-generated visual reads, `[UNVERIFIED: AI visual description]` unless stated otherwise** — a description is not a transcription. For scanned handwritten documents specifically, no attempt is made to read the handwriting as a verified transcription (this repo's standing discipline on older Danish handwriting, `ROUTING.md` Hard Constraints) — legibility is noted, not exploited as if solved.

---

## Images: Aneoversigt / Generations "02"–"05"

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image1.jpeg | Boe A3_NEW.jpg | Aneoversigt / general chapter context | Map |
| image2.jpeg | 1732 Chresten Boe, skifte_NEW.jpg | Generation "03" | Scanned primary document |
| image3.jpeg | Boe A15_NEW.jpg | Generation "04" or "05" (unconfirmed) | Photo, 2 people |
| image4.jpeg | Boe kap 9 02_NEW.jpg | Generation "05" (Mette Jensen's ancestry) | Photo, 1 person |
| image5.jpeg | Boe A17_NEW.jpg | Generation "05" | Photo, gravestone |
| image6.jpeg | Navnebevis.jpg | Generation "05" | Scanned primary document |

### image1.jpeg — Map

A period map of northeastern Mors, showing Jørsby, Sdr. Dråby, Nørre Dråby, Ullerup, Skarremose, and the other parishes/estates named throughout Chapter 1's generations "02"-"03". No people depicted. `[UNVERIFIED: AI visual description]`

### image2.jpeg — 1832 skifte (Christen Pedersen Boe, generation "03")

Handwritten probate-record page, opening "Aar 1832 d. 13d. April..." — matches the skifte already summarized in `boe-slaegten-chapter1-extraction.md` §03 (Ullerup gods skifteprotokol, proceedings 13 April/15 December/22 December 1832). Confirmed as the right document by its opening line, not by a full transcription of the handwriting, which is not attempted here. **Note on KEJ's own filename:** he named this file "1732 Chresten Boe, skifte" — but the skifte is dated 1832, not 1732. Likely a typo in his own filename (not the document itself, which clearly reads "1832"), logged here rather than silently corrected. Same underlying document also appears later in the manuscript as a second insertion (`image18.jpeg`, filename "1732 Chresten Boe, skifte.jpg" — same apparent typo, consistent with it being the same source file re-inserted, not a second independent document). [VERIFIED: boe-slaegten-fra-mors-og-fur, p.9-17 — image content matches the already-extracted skifte summary] Individual: `@I4@` (Christen Pedersen Boe, generation "03").

### image3.jpeg — Unidentified couple portrait

Studio portrait, one seated man (beard, dark formal coat) and one standing woman (bonnet, full skirt, Victorian-era dress) — clothing style consistent with roughly 1870s-1900s. **Not confirmed which individuals these are.** Photography of this kind only becomes plausible from generation "04" onward (generations "02"/"03" predate practical portrait photography in rural Denmark); its position in KEJ's own numbered sequence (immediately before image5, confirmed generation "05") makes generation "05" — Christen Pedersen Boe (`@I27@`) and Mette Jensen (`@I28@`) — the better-supported guess over generation "04," but this is a guess, not a finding. Worth asking KEJ directly rather than resolving here. `[UNVERIFIED: AI visual description, identity unconfirmed]`

### image4.jpeg — Unidentified man, likely Kapitel 9 (Mette Jensen's ancestry)

Studio portrait, one seated man, round glasses, bowler-style hat, heavy dark coat — damaged/degraded print. KEJ's own filename ("Boe kap 9 02") ties it to Kapitel 9, cross-referenced from generation "05"'s own marriage entry ("Mette Jensen... datter af Jens Christian Thorsen og hustru Margrethe Jensdatter... Se KAPITEL 9") but Kapitel 9 itself has not been read yet — so while this image plausibly depicts someone from Mette Jensen's own family line (perhaps her father Jens Christian Thorsen), that identification is not confirmed and shouldn't be treated as settled until Kapitel 9 is actually read. `[UNVERIFIED: AI visual description, identity pending Kapitel 9]`

### image5.jpeg — Chr. P. Boe's family gravestone

Color photograph of a granite memorial stone reading "CHR. P. BOES FAMILIEGRAVSTED / FRED" ("Chr. P. Boe's Family Gravesite / Peace"), with an engraved cross. Directly matches `boe-slaegten-chapter1-extraction.md` §05: "På Fur kirkegård findes endnu (1980) 'Chr. P. Boes Familiegravsted'" — the manuscript's own 1980 date for this note is consistent with the photo's evident era (color print, not a modern digital photo). [VERIFIED: boe-slaegten-fra-mors-og-fur, p.21-24 — direct visual match to a specific already-extracted claim] Individual: `@I27@` (Christen Pedersen Boe, generation "05").

### image6.jpeg — 1905 royal name-grant certificate (Navnebevis)

Scanned certificate opening "Vi Christian den Niende, af Guds Naade Konge til Danmark..." — the royal bevilling granting the "Boe" surname, matching the narrative already extracted in `boe-slaegten-chapter1-extraction.md` §05. Unlike the older skifte handwriting, this document's cursive is legible enough that the six listed names and birthdates were spot-checked directly against `family-tree/tree.ged`: Maria/Marie Christensen (16.11.1874) with son Esper Marinus Christensen (23.5.1897, Grinderslev sogn); Boel/Bodil Kirstine Christensen (22.7.1880); Jens Christensen (1.11.1882); Mette Christensen (30.12.1884); Laurids Christensen (1.3.1887); Christen(s) Christensen (8.2.1889) — **all six names and dates match exactly**, a genuine independent fidelity check of the earlier text extraction, not merely a description. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.21-24 — cross-checked against the certificate image itself, not just the manuscript's prose account] Individuals: `@I27@` (father, as applicant), `@I30@`, `@I33@`, `@I34@`, `@I36@`, `@I37@`, `@I39@` (the six children named).

---

## Sensitivity

None of the six images above require a `[SENSITIVE]` flag — every identified or plausibly-identified individual (generation "03" through "05") died well over 70 years ago. This will not hold once media from the Efterslægt section (living or recently-living descendants) is processed — expect `[SENSITIVE]` to become the norm, not the exception, once that begins.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation. First batch: the 6 images tied to Aneoversigt and generations "02"-"05" (the sections already read). Two images cross-checked directly against already-extracted text as genuine fidelity spot-checks (image5, image6); one filename-level discrepancy noted in KEJ's own naming (image2, "1732" vs the document's actual 1832 date); two images left with unconfirmed identities rather than guessed (image3, image4). |
