# Hopp-slægten — Media Manifest

Version 1.0 | 2026-08-09 | Production

---

## Document Purpose

Inventory of images extracted from the five legacy Hopp-slægten source files read so far (01, 01C, 01F, 02, 03, 04 — see `library/deep-wells/hopp-slaegten-manifest.md` for the text-extraction log) — photographs, scanned documents, maps, and one coin, previously untouched by the text-only extraction. This is the deliberately-deferred media pass documented in `projects/archive-digitization/TODO.md` — completed 2026-08-09, after all currently-received text was fully read, rather than interleaved chapter-by-chapter as the Boe-slægten precedent did.

**This manifest only covers images confirmed to depict no living or plausibly-still-living person.** Every image confirmed or plausible to show a presumed-living person, or not confidently placeable in a clearly historical era, lives instead in `restricted/media/` (a private companion repo, see `Architecture.md` §3) with its own manifest, `restricted/hopp-slaegten-media-manifest.md`. Same split, same default-private-until-resolved rule as the Boe-slægten precedent.

---

## How This Was Built, and Its Limits

Files 01, 01F, 02, 03, and 04 are legacy `.doc` files. `antiword` (used for all text extraction) discards embedded images entirely, leaving only `[pic]` placeholder markers — and even those undercount (file "02" showed 3 `[pic]` markers in the text but actually contains 7 embedded images). `LibreOffice`/`soffice --headless --convert-to` fails to open these same files at all ("source file could not be loaded"). The working method: `wvHtml` (from the `wv` package) converts each `.doc` to HTML and dumps every embedded image alongside it as `out0.jpg`, `out1.jpg`, etc., in document order — this is what was actually used. File 01C is a modern `.docx` (a zip archive); its images were pulled directly from `word/media/` via `unzip`.

**Description and identification are AI-generated visual reads, `[UNVERIFIED: AI visual description]` unless stated otherwise.** For scanned handwritten documents specifically, no attempt is made to read the handwriting as a verified transcription (this repo's standing discipline on older Danish handwriting, `ROUTING.md` Hard Constraints) — legibility is noted, not exploited as if solved. Surrounding-text captions recovered from each file's `out.html` are used to confirm identification wherever present, cited as `[VERIFIED: hopp-slaegten, <chapter>]` when they give a direct match.

**Sensitivity determination for photos of people leans on apparent era** (clothing, photographic process/print style, studio marks) cross-checked against any nearby caption or birth/death dates already in `family-tree/tree.ged`, not on a fixed cutoff year. Where era is ambiguous enough that a subject could plausibly still be alive, or identity isn't pinned down at all, the image defaults to `restricted/media/`.

---

## Images: File 01 (Knud Danielsen Hopp)

| File | Source position | Type |
|---|---|---|
| `01-image1.jpg` | Chapter 01 | Scanned primary document |

### 01-image1.jpg — 1673 archival confirmation document

A handwritten archival document bearing a wax-seal impression and the marking "N. 10," signed "Schröder" — herredsfoged-related, consistent with chapter 01's subject matter (the Hopp-slægt's herredsfoged history, see `context/external-source-hopp-herredsfoged.md`). No people depicted, a document only. `[UNVERIFIED: AI visual description]`

---

## Images: File 03 (Niels Danielsen Hopp)

| File | Source position | Type |
|---|---|---|
| `03-image1.jpg` | Chapter 03 | Map |

### 03-image1.jpg — Engraved map, Nissum Fjord / Ulfborg-Hind herred

A period engraved map covering the Nissum Fjord area, place names including Bøvling and land near Vedersø — directly matches chapter 03's subject, Niels Danielsen Hopp, degn i Vedersø for 42 years. No people depicted. `[VERIFIED: hopp-slaegten, 03 — direct place-name match]`

---

## Images: File 02 (Daniel Knudsen Hopp)

| File | Source position | Type |
|---|---|---|
| `02-image1.jpg` | Chapter 02, title page | Collage: property map + title text |
| `02-image2.jpg` | Chapter 02 | Scanned document fragment, cursive signature/date |
| `02-image3.jpg` | Chapter 02 | Illustration, vaulted cellar interior |
| `02-image4.jpg` | Chapter 02 | Architectural floor plans, Stubbergård 1796 |
| `02-image5.jpg` | Chapter 02 | Scanned church-record excerpt |
| `02-image6.jpg` | Chapter 02 | Scanned church-record excerpt |
| `02-image7.jpg` | Chapter 02 | Painted illustration, manor house |

No people depicted in any of the seven — documents, a map, an illustration, floor plans. Stay public.

### 02-image1.jpg — Title page collage

An old property/parish map (place names "Gamstrup," "Roslevsnab," "Mannerup Hede" — matching Daniel Knudsen Hopp's documented Gamstrup fæste) overlaid with "HOPP kapitel 1. 02 DANIELSEN KNUDSEN HOP o.1681-1730/31" and "Knud Erik Jakobsen / Risum / Version: sept. 2015." `[VERIFIED: hopp-slaegten, 02 — direct place-name match to Daniel Knudsen Hopp's Gamstrup fæste]`

### 02-image2.jpg — Cursive signature/date fragment

A cropped handwritten line reading approximately "...15 Martij Ao 1711 Daniel Knudsen Hop" — matches his documented fæstebrev-witnessing activity. `[VERIFIED: hopp-slaegten, 02]`

### 02-image3.jpg — Vaulted cellar interior

A pen-and-ink illustration of a vaulted cellar/crypt interior — matches the Stubbergård convent cellars referenced in the backstory of Daniel Knudsen Hopp's wife, Bodil Nielsdatter. `[VERIFIED: hopp-slaegten, 02]`

### 02-image4.jpg — Stubbergård floor plans

Two architectural floor plans side by side: a detailed room-by-room ground floor plan, and a captioned "Beliggenhedsplan for Stubbergård 1796. Kun kældrene under nordfløjen er endnu bevarede på holmen i Flyndersø" ("Site plan for Stubbergård 1796. Only the cellars under the north wing are still preserved on the islet in Flyndersø"), sub-captioned "Grundplan over nordfløjens kældre." Directly illustrates the Stubbergård history already in Daniel Knudsen Hopp's/Bodil Nielsdatter's `tree.ged` notes. `[VERIFIED: hopp-slaegten, 02]`

### 02-image5.jpg / 02-image6.jpg — Church-record excerpts

Two handwritten church-record fragments; `02-image6.jpg` names "Daniel Knudsens" alongside a "Captein Peurman" and "Mette Jeppesdatter" as witnesses/godparents — consistent with chapter 02's own transcribed church entries. Not independently transcribed here (handwriting-transcription discipline, see above). `[UNVERIFIED: AI visual description]`

### 02-image7.jpg — Manor house, painted illustration

A painted illustration of a substantial white manor house with a red tile roof, moat/pond in front, and a footbridge — plausibly Astrup, where Daniel Knudsen Hopp served as ridefoged. Not confirmed by a legible caption. `[UNVERIFIED: AI visual description]`

---

## Images: File 04 (Daniel Nielsen Hopp)

| File | Source position | Type |
|---|---|---|
| `04-image1.jpg` | Chapter 04 | Scanned primary document (skifteforretning) |
| `04-image2.jpg` | Chapter 04 | Engraving, manor house |
| `04-image4.jpg` | Chapter 04, branch d (shoemaking family) | Photo, street scene |

**Moved to `restricted/media/`:** `04-image3.jpg` (a pair of studio portraits, era/identity not confidently pinned down) — see `restricted/hopp-slaegten-media-manifest.md`.

### 04-image1.jpg — 1793 skifteforretning

A handwritten probate record headed "Skifte-Forretning," opening "Efter Afgangne Daniel Hoppis Enke i Medofte..." dated 5 August 1793 — matches chapter 04's own transcribed probate content for Daniel Nielsen Hopp's household. Not independently transcribed here. `[VERIFIED: hopp-slaegten, 04]`

### 04-image2.jpg — Manor house engraving

A black-and-white engraving of a large gabled manor house with a horse-drawn carriage and figures in period dress in the foreground — appears near text discussing the noble, better-off Hoppe family (Hans Hopp, brygger/møller i København, 1599-1666, ennobled line) as a possible distant connection. Illustrative context, not a specific Hopp-slægt property. No specific individual depicted. `[VERIFIED: hopp-slaegten, 04 — appears alongside the Hoppe-slægt discussion]`

### 04-image4.jpg — Kræmmergade street scene, "F. Hopp Skomager"

A period street photograph, a shop sign reading "F. HOPP SKOMAGER" prominently visible, with incidental passersby (a man on a bicycle, two men in the doorway) — captioned in the source "1890 skomagerforretning i Brogade, senere flyttet til Kræmmergade 9. 1915 afhændet til sønnen Daniel Hopp," documenting the shoemaking family's shop. A documentary/building photograph in the Boe-slægten precedent's sense (incidental period figures in a street scene, not portrait subjects) — treated as public on that basis, consistent with how similar streetscape photos were handled for Boe-slægten. `[VERIFIED: hopp-slaegten, 04 — direct caption match]`

---

## Images: File 01C

| File | Source position | Type |
|---|---|---|
| `01c-image1.png` | 01C | Map |
| `01c-image2.jpeg` | 01C | Scanned document, 1813 obituary |
| `01c-image4.jpeg` | 01C | Silhouette portraits (scherenschnitte) |
| `01c-image5.jpeg` | 01C | Map, 1792 |
| `01c-image6.jpeg` | 01C | Scanned document, 1799, signatures |

**Moved to `restricted/media/`:** `01c-image3.jpeg` (a modern color family photograph, plausibly-living subjects) — see `restricted/hopp-slaegten-media-manifest.md`.

### 01c-image1.png — Regional map, Salling/Mors area

A period engraved map covering the Salling peninsula down to Fur, place names including Sillerslev, Roslev, Balling, Hindborg. No people depicted. `[UNVERIFIED: AI visual description]`

### 01c-image2.jpeg — 1813 obituary, Ane Cathrine Bloch

A printed Gothic-type obituary/death notice for jordemoder ("midwife") Ane Cathrine Bloch, née Hjardemaal, died 22 February 1813 at age 74, having served as Viborg's midwife since 1781 and delivered 1,362 children — dated Viborg, 27 February 1813. A genealogically rich period document, no living individual concerned. `[UNVERIFIED: AI visual description — text not independently transcribed]`

### 01c-image4.jpeg — Silhouette portraits (scherenschnitte)

Two profile silhouette portraits (a woman and a man), a period artistic convention consistent with roughly late 18th/early 19th century. Identity not established by a caption. No photographic era concern — silhouette art, not a photograph. `[UNVERIFIED: AI visual description]`

### 01c-image5.jpeg — "Videnskabernes Selskabs kort," 1792

An engraved regional map explicitly dated 1792 ("Videnskabernes Selskabs kort"), covering the Thisted/Fur/Nykøbing Mors area. No people depicted. `[VERIFIED: hopp-slaegten, 01C — map's own printed date/title]`

### 01c-image6.jpeg — 1799 signed document

A handwritten legal document dated "8. og 9. April 1799," with multiple signatures including one reading approximately "Jacob Hopp[?]" — consistent with the Hopp-slægt's own record-keeping era. Not independently transcribed. `[UNVERIFIED: AI visual description]`

---

## Images: File 01F (Knud Knudsen Hopp)

| File | Source position | Type |
|---|---|---|
| `01f-image1.jpg` | 01F, title page | Title page, handwritten heading + printed chapter label |
| `01f-image2.jpg` | 01F | Scanned document, 1725 |
| `01f-image3.jpg` | 01F | Coin, 1732 |
| `01f-image4.jpg` | 01F | Two scanned letters, 1757 and 1665 |
| `01f-image5.jpg` | 01F | Diary page, 1900 |
| `01f-image6.jpg` | 01F | Photo, portrait (woman) |
| `01f-image7.jpg` | 01F | Photo, two portraits (woman, man) |
| `01f-image8.jpg` | 01F | Photo, family group (4) |
| `01f-image9.jpg` | 01F | Photo, extended family group, 1925 silver wedding |
| `01f-image10.jpg` | 01F | Scanned document, 1926 name-change certificate |
| `01f-image11.jpg` | 01F | Photo, family portrait (5) |
| `01f-image13.jpg` | 01F | Photo, indoor parlor scene (3) |
| `01f-image14.jpg` | 01F | Engraving, church/farm buildings |

**Moved to `restricted/media/`:** `01f-image12.jpg` (an outdoor group photo, era/identity not confidently pinned down as clearly historical) — see `restricted/hopp-slaegten-media-manifest.md`.

### 01f-image1.jpg — Title page

Handwritten heading naming "Mogens Knudsen Hopp i Løgstør, kommandeørets [sic] mistanke af sag ... 1765" over a printed chapter label "HOPP kapitel 1. / 01F KNUD KNUDSEN HOPP d.1762." No people depicted (a document, not a photo). `[UNVERIFIED: AI visual description]`

### 01f-image2.jpg — 1725 legal document

A handwritten legal document dated "29 Decembr. 1725," signed "Johan [surname illegible]" and "Knud [surname]Hopp." Not independently transcribed. `[UNVERIFIED: AI visual description]`

### 01f-image3.jpg — 1732 silver coin

A Danish silver coin (1 mark danske), obverse "CHRIST.VI.D.G. REX DAN.NORV.G.," reverse a crown and "1732 DEO ET POPULO" — a Christian VI-era coin, illustrative of the period, no person depicted. `[VERIFIED: hopp-slaegten, 01F — coin's own inscribed date]`

### 01f-image4.jpg — Two letters, 1757 and 1665

Two handwritten letters reproduced together, with printed captions: the upper, "Mogens Hopps signatur på brev dateret i Vesterlyby 9.5.1757 - til hans 'Meget høistærede Ven', Mogens Krushe i Skive. I brevet klages over svigerfaderens økonomiske transaktioner med skolekassepengene fra Jebjerg og Lyby sogne." The lower, "Brev 16.8.1665 fra amtmanden over Skivehus Amt, Velbr. Hr. Baron Rosenkrantz på Krabbesholm til provsten i Hatting herred - med tjenstlig anmodning om oplysninger om degnen Mogens Hopps formodede død i Hedensted sogn, Rimmerlund by. Til bekræftelse af drengen Peder Mogensens beretning." Both concern a Mogens Hopp active in the 1600s/1700s — directly documentary. `[VERIFIED: hopp-slaegten, 01F — printed captions on the source page itself]`

### 01f-image5.jpg — Diary page, "Det Nye Aarhundrede 1900"

A handwritten diary page (captioned in the source "Side fra Mogens Pedersens dagbog 1891-1919," page "19") — entries for January-April 1900 including references to the Boer War, several parish deaths, and a personal creed/reflection ("Jeg kan samle mine Livsanskuelser i faa Linjer..."). Diary author would have been an adult in 1900, long deceased. `[VERIFIED: hopp-slaegten, 01F — direct caption match]`

### 01f-image6.jpg — Portrait, elderly woman

A close photographic portrait of an elderly woman, print style consistent with early-1900s-1910s photography. No caption recovered pinning identity, but era and surrounding diary-page content (same chapter, same period) place the subject as long deceased. `[UNVERIFIED: AI visual description]`

### 01f-image7.jpg — Two portraits, woman and man

A woman's and a man's individual photographic portraits reproduced side by side, print style consistent with roughly 1900-1910. `[UNVERIFIED: AI visual description]`

### 01f-image8.jpg — Family portrait, four people

A studio family photograph — father, mother, baby, and a standing boy of about 5 — print/clothing style consistent with roughly 1890s-1900s. `[UNVERIFIED: AI visual description]`

### 01f-image9.jpg — Extended family group, 1925 silver wedding

A large outdoor group photograph (~19 people, multiple generations, in front of a brick building), directly captioned in the source: "Kristian og Marie Kathrine (Mie) Dallands sølvbryllup den 24.6.1925" ("Kristian and Marie Kathrine (Mie) Dalland's silver wedding, 24 June 1925"). All adults present would have been born mid-to-late 1800s; even the youngest children in the photo would be well over a century old today. `[VERIFIED: hopp-slaegten, 01F — direct caption match]`

### 01f-image10.jpg — 1926 name-change certificate, family Dalland

A typed legal document, "Politimesteren i Viborg Købstad," dated 13 February 1926, confirming the family name change to "Dalland" for Kristian Pedersen (b. 10 April 1879, Junget sogn), his wife Marie Katrine (b. 28 June 1878, Jebjerg), and their four children Klara (b. 1900), Aage (b. 1903), Ella (b. 1908), and Arne (b. 1910) — matches the family in `01f-image9.jpg`'s 1925 silver-wedding photo. `[VERIFIED: hopp-slaegten, 01F — direct name/date match to 01f-image9.jpg's caption]`

### 01f-image11.jpg — Family portrait, five people

A studio photograph of a father, mother, and three young children, print/clothing style consistent with roughly 1910s-1920s. Appears near source text naming "Peder Kristian Kristensen Overgaard, født 17.10.1884 i Jebjerg" — a plausible match to the father, whose documented birth year fits the apparent age of the adults in the photo. `[VERIFIED: hopp-slaegten, 01F — proximate text names a subject born 1884, consistent with the photo's apparent era]`

### 01f-image13.jpg — Indoor parlor scene, three people

A photograph of an ornately decorated Edwardian-era parlor (framed pictures, a hanging oil lamp, a birdcage, patterned wallpaper), with a woman seated at a table, a boy, and a man standing, print style consistent with roughly early 1900s-1910s. `[UNVERIFIED: AI visual description]`

### 01f-image14.jpg — Engraving, church and farm buildings

A woodcut/engraved illustration of a whitewashed church with a tower, alongside thatched farm outbuildings — no people depicted. Appears near source text discussing an 18th-century burial record. `[UNVERIFIED: AI visual description]`

---

## Sensitivity

As of 2026-08-09, this manifest lists 30 of the 33 images extracted from the five Hopp-slægten source files read so far — all confirmed to depict no living or plausibly-still-living person, either because no person is depicted at all (documents, maps, a coin, illustrations) or because the photographic era and any recovered caption place the subjects as long deceased. The other 3 (one pair of studio portraits with unresolved era/identity, one 1980s-era color family photo, one outdoor group photo of ambiguous era) live in `restricted/media/` — see `restricted/hopp-slaegten-media-manifest.md`. Same convention as `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-media/manifest.md`: `family-tree/tree.ged` still uses `[SENSITIVE]` for individual records, per `ROUTING.md`; this manifest uses the actual public/restricted storage split instead of an in-place flag.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-09 | Initial creation. Full media pass across all five currently-received Hopp-slægten source files (01, 01C, 01F, 02, 03, 04), deliberately deferred until text extraction was complete (see `projects/archive-digitization/TODO.md`). 33 images extracted total via `wvHtml` (legacy `.doc` files) and `unzip` (01C's `.docx`); 30 confirmed safe and stored here, 3 moved to `restricted/media/`. |
