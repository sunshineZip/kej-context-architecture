# Boe-slægten fra Mors og Fur — Media Manifest

Version 1.13 | 2026-08-08 | Production

---

## Document Purpose

Inventory of images extracted from `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024.docx` and stored in this folder — photographs, scanned documents, and maps embedded in KEJ's manuscript, previously untouched by the text-only extraction. Companion to `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-manifest.md`, which covers the manuscript's *text* extraction log.

**As of 2026-08-08, this manifest only covers images confirmed to depict no living person** — everyone shown either died decades ago, or the image is a document/map/chart with no people in it at all. Every image confirmed or plausible to show a presumed-living person, and every image not yet fully identified, lives instead in `restricted/media/` (a private companion repo, see `Architecture.md` §3) with its own manifest, `restricted/media-manifest.md`. That split is deliberate, not a gap: an unidentified image could turn out to show anyone, so it defaults to the restricted side until it's actually been resolved one way or the other.

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
| image5.jpeg | Boe A17_NEW.jpg | Generation "05" | Photo, gravestone |
| image6.jpeg | Navnebevis.jpg | Generation "05" | Scanned primary document |

**Moved to `restricted/media/` (unconfirmed identity, default-private):** `image3.jpeg`, `image4.jpeg` — see `restricted/media-manifest.md`.

### image1.jpeg — Map

A period map of northeastern Mors, showing Jørsby, Sdr. Dråby, Nørre Dråby, Ullerup, Skarremose, and the other parishes/estates named throughout Chapter 1's generations "02"-"03". No people depicted. `[UNVERIFIED: AI visual description]`

### image2.jpeg — 1832 skifte (Christen Pedersen Boe, generation "03")

Handwritten probate-record page, opening "Aar 1832 d. 13d. April..." — matches the skifte already summarized in `boe-slaegten-chapter1-extraction.md` §03 (Ullerup gods skifteprotokol, proceedings 13 April/15 December/22 December 1832). Confirmed as the right document by its opening line, not by a full transcription of the handwriting, which is not attempted here. **Note on KEJ's own filename:** he named this file "1732 Chresten Boe, skifte" — but the skifte is dated 1832, not 1732. Likely a typo in his own filename (not the document itself, which clearly reads "1832"), logged here rather than silently corrected. Same underlying document also appears later in the manuscript as a second insertion (`image18.jpeg`, filename "1732 Chresten Boe, skifte.jpg" — same apparent typo, consistent with it being the same source file re-inserted, not a second independent document). [VERIFIED: boe-slaegten-fra-mors-og-fur, p.9-17 — image content matches the already-extracted skifte summary] Individual: `@I4@` (Christen Pedersen Boe, generation "03").

### image5.jpeg — Chr. P. Boe's family gravestone

Color photograph of a granite memorial stone reading "CHR. P. BOES FAMILIEGRAVSTED / FRED" ("Chr. P. Boe's Family Gravesite / Peace"), with an engraved cross. Directly matches `boe-slaegten-chapter1-extraction.md` §05: "På Fur kirkegård findes endnu (1980) 'Chr. P. Boes Familiegravsted'" — the manuscript's own 1980 date for this note is consistent with the photo's evident era (color print, not a modern digital photo). [VERIFIED: boe-slaegten-fra-mors-og-fur, p.21-24 — direct visual match to a specific already-extracted claim] Individual: `@I27@` (Christen Pedersen Boe, generation "05").

### image6.jpeg — 1905 royal name-grant certificate (Navnebevis)

Scanned certificate opening "Vi Christian den Niende, af Guds Naade Konge til Danmark..." — the royal bevilling granting the "Boe" surname, matching the narrative already extracted in `boe-slaegten-chapter1-extraction.md` §05. Unlike the older skifte handwriting, this document's cursive is legible enough that the six listed names and birthdates were spot-checked directly against `family-tree/tree.ged`: Maria/Marie Christensen (16.11.1874) with son Esper Marinus Christensen (23.5.1897, Grinderslev sogn); Boel/Bodil Kirstine Christensen (22.7.1880); Jens Christensen (1.11.1882); Mette Christensen (30.12.1884); Laurids Christensen (1.3.1887); Christen(s) Christensen (8.2.1889) — **all six names and dates match exactly**, a genuine independent fidelity check of the earlier text extraction, not merely a description. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.21-24 — cross-checked against the certificate image itself, not just the manuscript's prose account] Individuals: `@I27@` (father, as applicant), `@I30@`, `@I33@`, `@I34@`, `@I36@`, `@I37@`, `@I39@` (the six children named) — all confirmed not `[SENSITIVE]` as of 2026-08-08 (one, `@I36@`, was briefly miscaught by an overbroad text match despite having a recorded death date; corrected the same day, see `family-tree/tree.ged` Version History via `projects/system/session-log.md`).

---

## Images: Efterslægt Branches b and e — Moved to Restricted

`image8.jpeg`, `image9.jpeg` (branch b), `image7.jpeg`, `image10.jpeg`, `image11.jpeg` (branch e) — none confirmed, all moved to `restricted/media/` under the default-private-until-analysed rule. See `restricted/media-manifest.md`.

---

## Images: Efterslægt Branch g, Checkpoint 1 (Children I, V, IX, XI)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image14.jpg | (Word auto-alt-text, no KEJ filename) | Branch g child "I" (confirmed) | Photo of a photographed manuscript page — two period photos plus a caption |
| image16.jpeg | Boe B14_NEW.jpg | Branch g child "I" (confirmed) | Photo, house/garage with truck |

**Moved to `restricted/media/` (unconfirmed):** `image15.jpeg`, `image17.jpeg` — see `restricted/media-manifest.md`.

### image14.jpg — Confirmed: manuscript page 33, Frederik Lund at Brunshåb Teglværk

Unlike the other images, this one is a photograph *of a printed manuscript page* (page number "33" visible), not a clean scan — likely taken with a phone camera during compilation. It shows two source photos plus a partially-visible caption reading "...v. Frederik Lund, Brunshåb Teglv[ærk]" — this is a **direct, legible match** to a caption transcribed from the surrounding text ("Tv. Frederik Lund, Brunshåb Teglværk"). Main photo: two brickworks laborers with a handcart of bricks — Frederik Lund (`@I108@`, Else Margrethe Boe's husband) on the left per the caption. A second, partial photo in the top-left corner (cropped, cut off) appears to be a wedding portrait — plausibly Else Margrethe and Frederik's own 1933 wedding, though the crop makes this less certain than the main photo's match. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.25-54 — caption text directly legible and matches the extracted transcription] Individual: `@I108@` (confirmed for the main photo), `@I107@` possibly (the cropped wedding photo, less certain). Neither individual is `[SENSITIVE]`.

### image16.jpeg — Confirmed: Else Margrethe and Frederik Lund's house

A house with an attached garage, a truck visible through the open garage door. **Direct match** to the caption "Hus og garage med lastbil" ("House and garage with truck") found in the same passage as `image14.jpg`'s captions — Frederik Lund worked as a vognmand (haulier) after his brickworks years, explaining the truck. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.25-54 — caption match] Individuals: `@I107@`, `@I108@` (their property, though neither appears in the photo itself). Neither is `[SENSITIVE]`.

---

## Images: Efterslægt Branch g, Checkpoint 3 (Children II, X) — No Public Images

Both images checked during this checkpoint (`image19.png`, `image20.jpeg`) were unmatched and are held in `restricted/media/` under the default-private-until-analysed rule.

---

## Images: Efterslægt Branch g, Checkpoint 4 (Child III — Meta Kristine Kristensen Boe)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image24.jpeg | Boe A65_NEW.jpg | Branch g child "III" (confirmed) | Photo, two children in a garden |

**Moved to `restricted/media/`:** `image21.jpeg`, `image22.jpeg`, `image23.jpeg`, `image25.jpeg`, `image26.jpeg`, `image27.png`, `image28.jpeg`, `image29.jpeg`, `image30.jpeg` — confirmed or plausible living individuals, or unconfirmed identity. See `restricted/media-manifest.md`.

### image24.jpeg — Confirmed: Hanne and Carlo in the garden at Brunshåb

A girl and a younger boy holding hands, standing in a garden in front of a brick wall — clothing and print style consistent with the mid-1950s. **Direct match** to the manuscript's own caption, "Hanne og Carlo i haven i Brunshåb" ("Hanne and Carlo in the garden in Brunshåb"), and the apparent ages (girl roughly 10-11, boy roughly 7-8) fit Hanne (b.1944) and Carlo (b.1947) well for a c.1954-55 photo, taken at the Brunshåb property where Meta and Peter Severin Nielsen lived. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.25-54 — caption match] Individuals: `@I167@` (Hanne, d.2005), `@I185@` (Carlo, d.1962). Both confirmed deceased — stays public.

---

## Chapter 2 (Boe-slægten, Jørsby) — No Images

Checked `image35.jpeg` and `image36.png` while reading Chapter 2, expecting a Jørsby-area map or Toft-family document — instead both turned out to depict "Vester Vandet" and "Vestermølle" ("West Mill"), tying them to **Chapter 3** (Boe-slægten, Vester Vandet, the Møller/miller family) rather than Chapter 2. Deferred to Chapter 3's own checkpoint rather than filed here. No images were found specific to Chapter 2's Toft-family content.

---

## Images: Chapter 3 (Boe-slægten, Vester Vandet)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image35.jpeg | (Word auto-alt-text, no KEJ filename) | Chapter 3 (confirmed) | Period map, Klitmøller/Vester Vandet |
| image36.png | (Word auto-alt-text, no KEJ filename) | Chapter 3 (confirmed) | Hand-drawn cadastral map, Vestermølle |
| image37.png | (Word auto-alt-text, no KEJ filename) | Cross-chapter (confirmed, spans Kap.1-4 + Søgaard-slægten) | KEJ's own handwritten master pedigree chart |

No people depicted in any of the three — maps and a hand-drawn chart. Stay public.

### image35.jpeg — Klitmøller / Vester Vandet map

A period engraved map of the coastal area around Klitmøller, Øster Vandet, Vester Vandet, and Nors Sø — directly matching Chapter 3's own title and setting. No people depicted. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.66-73 — direct place-name match]

### image36.png — Vestermølle cadastral map

A hand-drawn, colored matrikelkort (cadastral survey map) showing numbered land parcels around "Vestermølle" ("West Mill"), with surrounding owner names annotated in period handwriting. Matches this chapter's central subject — the Møller (miller) family — directly by place name. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.66-73 — direct place-name match]

### image37.png — KEJ's own master pedigree chart (significant cross-chapter find)

A single hand-drawn wall-chart, "BOE-SLÆGTEN MORS/FUR," laying out four columns (Kap.1-4) plus a fifth section for "Søgaard-slægten," each subdivided by generation. This is not a page from the compiled manuscript's own narrative — it reads as KEJ's own primary working document, the summary the prose chapters were most likely written from. **Used as a direct fidelity check and tie-breaker**: it independently confirms "19.10.1810 JØRSBY" for Christen Pedersen Boe and Mette Jensdatter's wedding, the same date given in Chapter 3's prose and one year later than Chapter 1's own prose — see `grandfather-review/queue.md` item 9 and `family-tree/tree.ged`'s `@F5@`. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.66-73 — direct date match against Chapter 3's own text, used to help resolve a Chapter 1/Chapter 3 contradiction]

---

## Images: Anetavler (Søgaard-slægten, Lundgaard-slægten/Fur-slægter, Degn-slægten Frammerslev/Fur, Boe-slægter)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image38.png | (Word auto-alt-text, no KEJ filename) | Søgaard-slægten (confirmed) | Hand-drawn pedigree chart |
| image39.png | (Word auto-alt-text, no KEJ filename) | Søgaard-slægten (confirmed) | Hand-drawn pedigree chart |
| image40.png | (Word auto-alt-text, no KEJ filename) | Lundgaard-slægten/Fur-slægter (confirmed) | Hand-drawn pedigree chart |
| image45.png | (Word auto-alt-text, no KEJ filename) | Degn-slægten Frammerslev/Fur (confirmed) | Hand-drawn pedigree chart |
| image48.jpeg | (Word auto-alt-text, no KEJ filename) | Boe-slægter / Fyn-slægten Boe (confirmed) | Photo, commemorative stone |

No people depicted in any of these — hand-drawn ancestor charts and a monument. Stay public. A significant discovery, documented in full in `projects/archive-digitization/context/boe-slaegten-anetavler-kilder-extraction.md`: the Søgaard-slægten, Lundgaard-slægten/Fur-slægter, and Degn-slægten Frammerslev/Fur appendices exist **only** as these hand-drawn pedigree charts — the plain-text extraction has no prose content for them at all. `image38`/`image39` gave Bodil Kirstine Iversdatter's (`@I26@`) previously-placeholder ancestry; `image40` and `image45` together gave Mette Jensen's (`@I28@`) previously cross-referenced-but-unread ancestry, closing a loop that had been open since Chapter 1.

### image38.png / image39.png — Søgaard-slægten i Åsted

Two pages of the same hand-drawn ahnentafel-style chart, directly confirmed by name/date match against `@I26@`'s existing record and mined for four generations of her direct ancestry. [VERIFIED: boe-slaegten-fra-mors-og-fur, Anetavler p.76-77 — direct name/date match]

### image40.png — Lundgaard-slægten Fur (direct-line page)

A multi-column hand-drawn chart; only the direct line to Margrethe Jensdatter (`@I350@`) and Jens Christian Thorsen (`@I351@`) was mined — the chart's other columns (labeled KAP1A-KAP4B) extend several more 17th-century generations back and are not individually filed here, per the scope decision documented in the extraction notes. Three further pages of the same chart (`image41`-`image44`, see below) confirmed this is a large, well-organized ahnentafel going back to a "Gravers Thomasen," documented from 1590.

### image45.png — Degn-slægten Frammerslev/Fur (direct-line page)

The cleanest of the deep pedigree charts — directly closes the loop from Jens Christian Thorsen back through four more generations to "Anders Sørensen (Degn)," and forward again to Mette Jensen and Christen Pedersen Boe, already in the tree. Two further pages (`image46`, `image47`, see below) extend two side-branches back to the 1620s-1630s, same scope decision.

### image48.jpeg — Helnæs commemorative stone (Fyn-slægten Boe)

A photograph of a granite stone reading "FRA DENNE GAARD UDGIK DEN VESTFYENSKE BOE-SLÆGT" ("From this farm emerged the West Funen Boe family"), tied to the manuscript's own "Fyn-slægten Boe" comparative section — an explicitly *unconnected* Boe family (per KEJ's own conclusion) that this project does not model in `tree.ged`. Stored as illustrative context for that discussion. [VERIFIED: boe-slaegten-fra-mors-og-fur, Boe-slægter p.89 — direct content match to the section's own subject]

---

## Images: Efterslægt Branch g, Checkpoint 5 (Child VIII — Karen Kristensen Boe / the Boll family) — Moved to Restricted

`image31.jpeg` (five of six depicted children are presumed living) plus three unmatched images (`image32.jpeg`, `image33.jpeg`, `image34.png`) — all in `restricted/media/`. See `restricted/media-manifest.md`.

---

## Anetavler Deep-Chart Pages — Extracted and Stored, Not Individually Mined

**Added 2026-08-06.** Six further pages of the Lundgaard-slægten/Fur-slægter and Degn-slægten Frammerslev/Fur pedigree charts, confirmed relevant to those appendices but deliberately not transcribed into `family-tree/tree.ged` — see the scope decision in `projects/archive-digitization/context/boe-slaegten-anetavler-kilder-extraction.md`. No people depicted — hand-drawn ancestor charts only. Stay public.

| File | Appendix | Content |
|---|---|---|
| `image41.png` | Lundgaard-slægten Fur | "KAPITEL 1A" — extends one ancestor column back to "Gravers Thomasen," documented from 1590. |
| `image42.png` | Lundgaard-slægten Fur | "KAPITEL 1B" — the paired ancestor column, back to "Thøger Iversen" and "Johanne Mortensdatter." |
| `image43.png` | Lundgaard-slægten Fur | "KAPITEL 2" — a third ancestor column, back to "Thomas Iversen," documented from 1614. |
| `image44.png` | Lundgaard-slægten Fur | "KAPITEL 3"/"KAPITEL 4" — further columns for the same appendix; KAP4 largely blank in this excerpt. |
| `image46.png` | Degn-slægten Frammerslev/Fur | "KAPITEL 4A" — extends Søren Olesen's own ancestry back to "Mikkel Nielsen," documented from o.1630. |
| `image47.png` | Degn-slægten Frammerslev/Fur | "KAPITEL 4B" — extends Anne Jensdatter (Kobberup)'s own ancestry back to "Jens Nielsen Kobberup," documented from o.1629. |

---

## Sensitivity

As of 2026-08-08, this manifest only lists images confirmed to depict no presumed-living person — 21 of the 47 stored images. The other 26 (any confirmed or plausible living individual, plus everything not yet fully identified) live in `restricted/media/`, a private companion repo — see `Architecture.md` §3 and `restricted/media-manifest.md`. This replaces the earlier approach of flagging individual images `[SENSITIVE]` in place; that convention is retired for media specifically now that there's an actual access boundary to move the content behind instead. `family-tree/tree.ged` still uses `[SENSITIVE]` for individual records, per `ROUTING.md`.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation. First batch: the 6 images tied to Aneoversigt and generations "02"-"05" (the sections already read). Two images cross-checked directly against already-extracted text as genuine fidelity spot-checks (image5, image6); one filename-level discrepancy noted in KEJ's own naming (image2, "1732" vs the document's actual 1832 date); two images left with unconfirmed identities rather than guessed (image3, image4). |
| 1.1 | 2026-08-06 | Added images for Efterslægt branch b: a plausible-but-unconfirmed wedding-portrait match (image8) and one left fully unclassified (image9). Noted image7 was checked and ruled out for all branches read so far, deferred rather than stored prematurely. |
| 1.2 | 2026-08-06 | Added image for Efterslægt branch e: a family portrait (image11) plausibly matching Jens Christensen Boe's young family c.1920, based on composition and timing. Noted image10 (a streetscape) as a candidate deferred to branch g, once read. |
| 1.3 | 2026-08-06 | Branch g checkpoint 3 (children II/X): two more images checked (image19, image20 — a family accordion-player scene and a solo portrait of the same young man), neither matched anyone in this checkpoint; both left unfiled. No new images stored this checkpoint. |
| 1.4 | 2026-08-06 | Branch g checkpoint 4 (child III, Meta Kristine Kristensen Boe): two confirmed matches via direct caption text (image24, image25) and two plausible-but-unconfirmed additions (image22, image23). Three more images checked and left unfiled (image21, image29, image30). |
| 1.5 | 2026-08-06 | Branch g checkpoint 5 (child VIII, Karen Kristensen Boe / the Boll family — the final checkpoint of branch g and Efterslægt): one confirmed match via direct caption text (image31, a six-children group portrait c.1962). Three more images checked and left unfiled (image32, image33, image34). |
| 1.6 | 2026-08-06 | Chapter 2 (Boe-slægten, Jørsby) read — no images specific to it found; two checked (image35, image36) turned out to belong to Chapter 3 (Vester Vandet) instead, based on content (both depict that location by name), and are deferred there. |
| 1.7 | 2026-08-06 | Chapter 3 (Boe-slægten, Vester Vandet) read — image35 and image36 confirmed and filed here (Klitmøller/Vester Vandet map, Vestermølle cadastral map). Found image37, KEJ's own handwritten master pedigree chart spanning all four chapters — used to help resolve a wedding-date contradiction found in Chapter 3's own text (see `grandfather-review/queue.md` item 9). |
| 1.8 | 2026-08-06 | Anetavler read in full. Discovered the Søgaard-slægten, Lundgaard-slægten/Fur-slægter, and Degn-slægten Frammerslev/Fur appendices exist only as hand-drawn pedigree charts, not prose text. Filed image38/39 (Søgaard-slægten), image40 (Lundgaard-slægten direct line), image45 (Degn-slægten direct line), and image48 (Helnæs stone, Fyn-slægten Boe). All 48 real embedded images have now been checked at least once. |
| 1.9 | 2026-08-06 | Human raised the risk that unfiled images, described only in text, would never be revisited without a fresh `.docx` extraction. Extracted and stored all 14 remaining "checked but unmatched" images and the 6 further Anetavler deep-chart pages, closing that gap — 45 of 48 images now physically stored (the 3 not stored are a confirmed exact duplicate, image18, and two images that belong to a different manuscript entirely, image26/image27, moved to `library/deep-wells/hopp-slaegten-preview-images/` instead). |
| 1.10 | 2026-08-06 | **Correction:** image26/image27 do NOT belong to Hopp-slægten — the human identified both directly: image26 shows Hanne Boe and Knud Erik Jakobsen (the manuscript's own author) together; image27 is a family group photo, August 1995, with Bruno Dølby, Gitte Boe, Tommy Krogh, Lotta Ann, Cecilie Boe, Nikolaj Boe, and Astrid Kirk (not yet linked in `tree.ged`). Both moved back into this deep well's own media folder; the Hopp-slægten preview folder created for them has been removed. 47 of 48 images now physically stored — only the confirmed duplicate, image18, remains unstored. |
| 1.11 | 2026-08-06 | Revised `image21.jpeg`'s entry after direct visual inspection (prompted by the human questioning the original age-gap reasoning): moved out of the "unmatched" batch table into its own write-up. Original guess (Hanne + Carlo) ruled out on both age gap and visual era (photo reads as early-1930s). New hypothesis, human-prompted: one of Meta's older brothers (Hans Kristian or Karl Alfred Christensen Boe) holding baby sister Edith Kristensen Boe (b. Aug 1930), based on birth-year fit. Still unconfirmed — queued in `grandfather-review/queue.md` item 11 for KEJ. |
| 1.12 | 2026-08-06 | Revised `image29.jpeg` and `image30.jpeg`'s entries, moved out of the "unmatched" batch table into their own write-ups. Corrected an overconfident dating claim on both (the "1960s"/"1940s" style labels were unverified guesses, not documented facts — the human rightly pushed back on the image29 one). Recorded two family-suggested name candidates: "Laurids" for image29 (checked against all Laurids/Laurits individuals in `tree.ged`, no good fit found) and "Gyda" for image30 (a genuine name match, Anna Gyda Boll, but no marriage date exists anywhere in the source to verify against). Both queued in `grandfather-review/queue.md` items 14-15. |
| 1.13 | 2026-08-08 | **Major split:** 26 of 47 images (any confirmed/plausible living individual, plus everything not yet fully identified) moved to `restricted/media/` — a private companion repo — per the human's rule that even one living person present, or any unanalysed image, defaults to restricted. Full analysis preserved in the new `restricted/media-manifest.md`, not lost. This manifest now only lists the 21 images confirmed safe to be fully public. Retired per-image `[SENSITIVE]` flagging in favor of the actual access boundary. |
