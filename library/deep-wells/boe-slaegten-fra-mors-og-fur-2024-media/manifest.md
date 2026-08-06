# Boe-slægten fra Mors og Fur — Media Manifest

Version 1.9 | 2026-08-06 | Production

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

## Images: Efterslægt Branch b (Marie Christensen Boe)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image8.jpeg | Boe A19_NEW.jpg | Branch b (unconfirmed) | Photo, wedding portrait |
| image9.jpeg | Boe A26_NEW.jpg | Unclassified | Photo, 2 people |

### image8.jpeg — Wedding portrait

Studio wedding portrait: bride in dark dress with a long veil, groom in formal double-breasted coat holding a top hat. Clothing style consistent with roughly 1900-1915. **Not confirmed**, but the date range fits Marie Christensen Boe and Niels Jensen's 9.8.1910 marriage (Tøndering) plausibly enough to record the guess — should not be treated as settled without KEJ's confirmation. `[UNVERIFIED: AI visual description, identity unconfirmed]`

### image9.jpeg — Unidentified older couple

Close studio portrait, older man and woman, clothing/hairstyle consistent with roughly 1930s-1950s. Checked against branch b (Esper Marinus Christensen Boe and Katrine, who would have been in that age range during this period) but nothing ties it specifically to them over any other Efterslægt couple of similar age — left unclassified rather than guessed. `[UNVERIFIED: AI visual description, identity unconfirmed]`

**Also checked and explicitly ruled out for branches a/c/d/f/h/i and b:** `image7.jpeg` ("Boe B2") — a c.1920s-1930s outdoor photo of a young couple. Not stored here since it doesn't belong to any section read so far; will be pulled again once whichever branch (likely b, e, or g) it belongs to is reached.

---

## Images: Efterslægt Branch e (Jens Christensen Boe)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image11.jpeg | Boe A36_NEW.jpg | Branch e (plausible) | Photo, family group |

### image11.jpeg — Family portrait

Studio family portrait: father, mother, and three young children (a toddler boy, a girl, and a baby), clothing/style consistent with roughly 1918-1922. **Not confirmed**, but the timing fits well: Jens Christensen Boe (`@I34@`) and Marie Kirstine Christensen (`@I35@`) married 1916, and had three children by 1920 (K.K.K. Boe b.1917, Anna b.1918, Thomas Manfred b.1920) before a fourth (Hans Christian, b.1923) — matching this photo's apparent three-children composition better than any other Efterslægt family at this stage. Worth confirming with KEJ rather than treating as settled. `[UNVERIFIED: AI visual description, identity unconfirmed]`

**Also checked and deferred:** `image10.jpeg` ("Boe A37") — a streetscape of brick townhouses, no people. Possibly tied to branch g instead — Laurids Boe's murer work is credited with a street in Durup informally called "Boegade" until the early 1970s — but branch g hasn't been read yet, so this is a guess for later, not stored here.

---

## Images: Efterslægt Branch g, Checkpoint 1 (Children I, V, IX, XI)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image14.jpg | (Word auto-alt-text, no KEJ filename) | Branch g child "I" (confirmed) | Photo of a photographed manuscript page — two period photos plus a caption |
| image16.jpeg | Boe B14_NEW.jpg | Branch g child "I" (confirmed) | Photo, house/garage with truck |
| image15.jpeg | Boe A42_NEW.jpg | Branch g, unconfirmed | Photo, couple at a dinner table |

### image14.jpg — Confirmed: manuscript page 33, Frederik Lund at Brunshåb Teglværk

Unlike the other images, this one is a photograph *of a printed manuscript page* (page number "33" visible), not a clean scan — likely taken with a phone camera during compilation. It shows two source photos plus a partially-visible caption reading "...v. Frederik Lund, Brunshåb Teglv[ærk]" — this is a **direct, legible match** to a caption transcribed from the surrounding text ("Tv. Frederik Lund, Brunshåb Teglværk"). Main photo: two brickworks laborers with a handcart of bricks — Frederik Lund (`@I108@`, Else Margrethe Boe's husband) on the left per the caption. A second, partial photo in the top-left corner (cropped, cut off) appears to be a wedding portrait — plausibly Else Margrethe and Frederik's own 1933 wedding, though the crop makes this less certain than the main photo's match. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.25-54 — caption text directly legible and matches the extracted transcription] Individual: `@I108@` (confirmed for the main photo), `@I107@` possibly (the cropped wedding photo, less certain).

### image16.jpeg — Confirmed: Else Margrethe and Frederik Lund's house

A house with an attached garage, a truck visible through the open garage door. **Direct match** to the caption "Hus og garage med lastbil" ("House and garage with truck") found in the same passage as `image14.jpg`'s captions — Frederik Lund worked as a vognmand (haulier) after his brickworks years, explaining the truck. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.25-54 — caption match] Individuals: `@I107@`, `@I108@` (their property, though neither appears in the photo itself).

### image15.jpeg — Unconfirmed: couple at a dinner table

A 1960s-1970s-style photo of a middle-aged/older couple in conversation at a dinner table. No caption match found. Plausible but unconfirmed candidates from this checkpoint include Krista (`@I117@`) and Martin (`@I118@`), whose marriage (1954) and era would fit, but nothing distinguishes them from several other Efterslægt couples of similar age. Left unconfirmed rather than guessed. `[UNVERIFIED: AI visual description, identity unconfirmed]`

**Also checked and deferred:** `image17.jpeg` ("Boe A50") — a young man's formal portrait, 1920s-1930s style. No caption or contextual match found in this checkpoint; left unfiled.

---

## Images: Efterslægt Branch g, Checkpoint 3 (Children II, X)

No images stored from this checkpoint — both checked candidates were left unfiled.

**Checked and deferred:** `image19.png` — a family living-room scene, an accordion player performing for what reads as an informal domestic audience, bearing a "PRØVE" (proof/sample) watermark from the scanning service. `image20.jpeg` — apparently the same young man, alone with his accordion, same watermark. Neither carries a caption or other content match to children "II." (Ernst Kristian Jørgen Kristensen Boe) or "X." (Ane Margrethe "Anna" Christensen Boe) or their own children as read in this checkpoint — no musician occupation or hobby is mentioned for anyone in either line. Left unfiled rather than guessed; may belong to branch g's remaining children ("III.," "VIII.") or elsewhere.

---

## Images: Efterslægt Branch g, Checkpoint 4 (Child III — Meta Kristine Kristensen Boe)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image24.jpeg | Boe A65_NEW.jpg | Branch g child "III" (confirmed) | Photo, two children in a garden |
| image25.jpeg | Boe B38_NEW.jpg | Branch g child "III" (confirmed) | Photo, four generations |
| image22.jpeg | Boe B29B_NEW.jpg | Branch g child "III" (plausible) | Photo, young woman portrait |
| image23.jpeg | Boe B23_NEW.jpg | Branch g child "III" (plausible) | Photo, wedding portrait |

### image24.jpeg — Confirmed: Hanne and Carlo in the garden at Brunshåb

A girl and a younger boy holding hands, standing in a garden in front of a brick wall — clothing and print style consistent with the mid-1950s. **Direct match** to the manuscript's own caption, "Hanne og Carlo i haven i Brunshåb" ("Hanne and Carlo in the garden in Brunshåb"), and the apparent ages (girl roughly 10-11, boy roughly 7-8) fit Hanne (b.1944) and Carlo (b.1947) well for a c.1954-55 photo, taken at the Brunshåb property where Meta and Peter Severin Nielsen lived. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.25-54 — caption match] Individuals: `@I167@` (Hanne), `@I185@` (Carlo).

### image25.jpeg — Confirmed: Four generations, Ottine/Meta/Hanne/Lotta

A color photograph (faded to a magenta tone typical of 1960s-70s prints) of three women of clearly different generations — elderly, middle-aged, and young adult — the youngest holding a newborn. **Direct match** to the caption "4 generationer: Ottine, Meta og Hanne med Lotta" ("4 generations: Ottine, Meta, and Hanne with Lotta"). Ottine Boline Marie Pedersen (`@I38@`, b.1887) would have been ~79; Meta (`@I163@`, b.1918) ~48; Hanne (`@I167@`, b.1944) ~22, consistent with holding her newborn daughter Lotta Ann (`@I169@`, b.1966). [VERIFIED: boe-slaegten-fra-mors-og-fur, p.25-54 — caption match] Individuals: `@I38@`, `@I163@`, `@I167@`, `@I169@`.

### image22.jpeg — Plausible: young Meta Kristine Kristensen Boe

A close studio portrait of a young woman, 1930s hairstyle and collar. **Not confirmed**, but the era fits Meta's own young adulthood (she trained as a damefrisør, a profession with an obvious reason to keep a well-groomed portrait of herself) better than any other individual read in this checkpoint. `[UNVERIFIED: AI visual description, identity unconfirmed]`

### image23.jpeg — Plausible: Meta and Peter Severin Nielsen's wedding

A formal couple portrait: an older, balding groom in a dark suit with a boutonnière, and a younger bride in a dark dress (not white) holding a bouquet — a style consistent with a more modest 1940s wartime/postwar wedding, and with the bride not being a first-time teenage bride. Peter Severin Nielsen was a 48-year-old widower when he married the 28-year-old Meta in 1946; the apparent age gap and era fit this description well. **Not confirmed.** `[UNVERIFIED: AI visual description, identity unconfirmed]`

**Also checked and left unfiled:** `image21.jpeg` — a studio portrait of a boy (roughly 9-10) with a baby girl (roughly 1) — the apparent age gap (~8-9 years) doesn't fit Hanne and Carlo's actual 3-year gap well, so left unmatched rather than forced. `image29.jpeg` — a 1960s wedding portrait; the groom's apparent age (mid-30s to 40s, based on hairline) doesn't fit a 21-year-old Knud Erik Jakobsen in 1966, so not treated as Hanne and KEJ's own wedding photo despite the tempting date range. `image30.jpeg` — a traditional white-veil wedding portrait of a young couple, 1940s style; no contextual link found to anyone in this checkpoint.

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

A significant discovery, documented in full in `projects/archive-digitization/context/boe-slaegten-anetavler-kilder-extraction.md`: the Søgaard-slægten, Lundgaard-slægten/Fur-slægter, and Degn-slægten Frammerslev/Fur appendices exist **only** as these hand-drawn pedigree charts — the plain-text extraction has no prose content for them at all. `image38`/`image39` gave Bodil Kirstine Iversdatter's (`@I26@`) previously-placeholder ancestry; `image40` and `image45` together gave Mette Jensen's (`@I28@`) previously cross-referenced-but-unread ancestry, closing a loop that had been open since Chapter 1.

### image38.png / image39.png — Søgaard-slægten i Åsted

Two pages of the same hand-drawn ahnentafel-style chart, directly confirmed by name/date match against `@I26@`'s existing record and mined for four generations of her direct ancestry. [VERIFIED: boe-slaegten-fra-mors-og-fur, Anetavler p.76-77 — direct name/date match]

### image40.png — Lundgaard-slægten Fur (direct-line page)

A multi-column hand-drawn chart; only the direct line to Margrethe Jensdatter (`@I350@`) and Jens Christian Thorsen (`@I351@`) was mined — the chart's other columns (labeled KAP1A-KAP4B) extend several more 17th-century generations back and are not individually filed here, per the scope decision documented in the extraction notes. Three further pages of the same chart (`image41`-`image44`, viewed but not stored) confirmed this is a large, well-organized ahnentafel going back to a "Gravers Thomasen," documented from 1590.

### image45.png — Degn-slægten Frammerslev/Fur (direct-line page)

The cleanest of the deep pedigree charts — directly closes the loop from Jens Christian Thorsen back through four more generations to "Anders Sørensen (Degn)," and forward again to Mette Jensen and Christen Pedersen Boe, already in the tree. Two further pages (`image46`, `image47`, viewed but not stored) extend two side-branches back to the 1620s-1630s, same scope decision.

### image48.jpeg — Helnæs commemorative stone (Fyn-slægten Boe)

A photograph of a granite stone reading "FRA DENNE GAARD UDGIK DEN VESTFYENSKE BOE-SLÆGT" ("From this farm emerged the West Funen Boe family"), tied to the manuscript's own "Fyn-slægten Boe" comparative section — an explicitly *unconnected* Boe family (per KEJ's own conclusion) that this project does not model in `tree.ged`. Stored as illustrative context for that discussion. [VERIFIED: boe-slaegten-fra-mors-og-fur, Boe-slægter p.89 — direct content match to the section's own subject]

**Not stored, confirmed relevant but out of scope:** `image41.png`-`image44.png` and `image46.png`-`image47.png` — further pages of the Lundgaard-slægten and Degn-slægten charts, extending several more generations of 17th-century ancestors not modeled in `tree.ged` (see scope decision above). All 48 real embedded images in the manuscript have now been checked at least once.

---

## Images: Efterslægt Branch g, Checkpoint 5 (Child VIII — Karen Kristensen Boe / the Boll family)

| File | KEJ's filename | Position | Type |
|---|---|---|---|
| image31.jpeg | Boe A100_NEW.jpg | Branch g child "VIII" (confirmed) | Photo, six children group portrait |

### image31.jpeg — Confirmed: the six eldest Boll children, c.1962

A studio portrait of six children, ranging from a toddler of roughly 2-3 to a teenager of roughly 14, wearing formal 1960s clothing (bow ties, suspenders, a pearl necklace). **Direct match** to the manuscript's own caption, "o. 1962 Siddende fra venstre: Birgit, Henrik, Jan og Tage. Stående fra venstre: Gyda og Karsten" ("c.1962, seated left to right: Birgit, Henrik, Jan, and Tage. Standing left to right: Gyda and Karsten"). The six named children — Svend Tage (b.1948), Birgit (b.1949), Anna Gyda (b.1952), Karsten (b.1955), Anders Henrik (b.1957), Jan Laurids (b.1959) — span exactly the age range visible in the photo; the seventh and youngest sibling, John Harald, wasn't born until 1965 and is absent, consistent with the c.1962 date. [VERIFIED: boe-slaegten-fra-mors-og-fur, p.25-54 — caption match] Individuals: `@I188@`, `@I197@`, `@I208@`, `@I224@`, `@I227@`, `@I232@`.

**Checked when this checkpoint was read; now stored below rather than left unfiled** — see "Unmatched / Unclassified Images," further down: `image32.jpeg` — a 1950s studio portrait of a young woman with glasses, no specific textual tie found to this checkpoint. `image33.jpeg` — a boy of about 5-6 holding an infant on a couch; plausibly two Boll siblings, but no confident pairing could be made among several possible sibling combinations. `image34.png` — a formal dinner-party group photo, no caption or contextual match found.

---

## Unmatched / Unclassified Images — Extracted and Stored for Future Analysis

**Added 2026-08-06, after the manuscript's own read-through was complete.** Every image checked during this project was described in this manifest at the time, but the ones that never matched a specific person or section had — until now — only that text description; the image data itself stayed inside the original `.docx`, reachable only by re-extracting it. That's a real gap against this project's own stated future use for these images (a visual presentation of the research, and eventually more advanced analysis of the photos themselves) — a photo nobody can see isn't useful for either. All fourteen images previously left unfiled are now extracted and stored here instead, so they're directly accessible without redoing the extraction. None of these are matched to a specific individual; none carry `[VERIFIED]` identification claims. Cross-referenced by their original checkpoint sections above.

| File | First checked during | Description |
|---|---|---|
| `image7.jpeg` | Efterslægt branches a/c/d/f/h/i and b | c.1920s-30s outdoor photo of a young couple. No match found in any branch read so far. |
| `image10.jpeg` | Efterslægt branch e | A streetscape of brick townhouses, no people. Guessed at tying to branch g's "Boegade" but never confirmed once branch g was actually read. |
| `image12.jpeg` | Branch g checkpoint 1 | Indoor domestic scene. No match among children IV/VI/VII. |
| `image13.jpeg` | Branch g checkpoint 1 | Period wedding portrait, 1920s style. No match among children IV/VI/VII. |
| `image17.jpeg` | Branch g checkpoint 2 | Young man's formal portrait, 1920s-30s style. No caption or contextual match found. |
| `image19.png` | Branch g checkpoint 3 | Family living-room scene, accordion player, "PRØVE" watermark. No match among children II/X. |
| `image20.jpeg` | Branch g checkpoint 3 | The same young man, solo, with his accordion. Same watermark, same non-match. |
| `image21.jpeg` | Branch g checkpoint 4 | Boy of ~9-10 with a baby girl of ~1. Age gap doesn't fit Hanne/Carlo's actual 3-year gap. |
| `image28.jpeg` | Branch g checkpoint 4 | Young man, round glasses, 1930s-40s style. No specific tie found. |
| `image29.jpeg` | Branch g checkpoint 4 | 1960s wedding portrait. Groom's apparent age doesn't fit a 21-year-old KEJ in 1966. |
| `image30.jpeg` | Branch g checkpoint 4 | Traditional white-veil wedding portrait, 1940s style. No contextual link found. |
| `image32.jpeg` | Branch g checkpoint 5 | 1950s studio portrait, young woman with glasses. No specific tie found. |
| `image33.jpeg` | Branch g checkpoint 5 | Boy of ~5-6 holding an infant on a couch. Plausibly two Boll siblings, no confident pairing made. |
| `image34.png` | Branch g checkpoint 5 | Formal dinner-party group photo. No caption or contextual match found. |

---

## Anetavler Deep-Chart Pages — Extracted and Stored, Not Individually Mined

**Added 2026-08-06.** Six further pages of the Lundgaard-slægten/Fur-slægter and Degn-slægten Frammerslev/Fur pedigree charts, confirmed relevant to those appendices but deliberately not transcribed into `family-tree/tree.ged` — see the scope decision in `projects/archive-digitization/context/boe-slaegten-anetavler-kilder-extraction.md`. Extracting them now makes "available for future deeper mining" actually true, rather than only true if someone remembers to re-open the `.docx`.

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

The six images tied to Aneoversigt/generations "02"-"05" need no `[SENSITIVE]` flag — everyone in them died well over 70 years ago. That changes starting with Efterslægt: `image8`/`image9` above don't currently need the flag either (no confirmed identity, and if image8's guess is right, a 1910 marriage is not recent), but per the branch-b text extraction, several individuals in this branch (Poul and Henning Christensen Boe and their families) have no death dates and are treated as potentially living — any future image confirmed to depict them would need `[SENSITIVE]`. `image24`/`image25` (branch g checkpoint 4) depict Hanne (d.2005) and, in image25, Meta and Ottine (both long deceased) plus baby Lotta — Lotta Ann (Jakobsen) Boe is presumed living, but as an infant in the photo is not identifiable as an adult from it, so no flag needed on the image itself; her own `tree.ged` record carries `[SENSITIVE]`.

**On the "Unmatched / Unclassified" batch (added 2026-08-06):** none of these fourteen images carry a `[SENSITIVE]` flag today because none carry a confirmed identity — that's a statement about certainty, not about safety. Several were checked precisely because their style/era placed them in the same checkpoints as branch g's undated, presumed-living descendants (`image17`, `image19`-`image21`, `image28`-`image30`, `image32`-`image34` all come from checkpoints 2-5, where `[SENSITIVE]` is the default in the text). If any of these is later matched to a specific person — whether by a human, or by any future automated method — that match should get the same `[SENSITIVE]` treatment as every other living-descendant fact in this repo before being used or shared further.

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
