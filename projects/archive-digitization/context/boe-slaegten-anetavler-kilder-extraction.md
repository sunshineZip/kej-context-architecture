# Boe-slægten fra Mors og Fur — Anetavler & Kilder Extraction Notes

Version 1.0 | 2026-08-06 | Active

---

## Document Purpose

Working extraction notes for the final portion of "2024 Boe-slægen fra Mors og Fur.docx": the Anetavler (pedigree appendices, p.75-91) and Kilder (bibliography, p.92-96). One file for both, rather than a chapter-per-file split, since neither is a numbered chapter and both are shorter/more self-contained than Chapters 1-4. With this file, the entire manuscript has been read.

**Source citation:** Knud Erik Jakobsen (KEJ), Risum, "Boe-slægten, Mors/Fur, Kapitel 1-4," unpublished manuscript, maj 2026. Registered as a deep well: `library/reference-index.md#boe-slaegten-fra-mors-og-fur`.

**A structural discovery worth stating plainly:** the Anetavler's first three appendices — Søgaard-slægten, Lundgaard-slægten/Fur-slægter, and Degn-slægten Frammerslev/Fur — exist **only as hand-drawn pedigree charts (images)**, not as flowing prose. The plain-text extraction this whole project has worked from (`boe-slaegten-fra-mors-og-fur-2024-fulltext.txt`) contains zero content for these three appendices beyond their table-of-contents entries — the charts simply don't extract as text. This was discovered by checking images while reading Chapter 3, and confirmed by grepping the fulltext for "Søgaard"/"Lundgaard"/"Degn-slægten" and finding nothing outside the TOC. The "Boe-slægter" comparative section and Kilder, by contrast, are normal prose/text and extracted fine.

---

## Progress

- [x] Søgaard-slægten (p.76-77) — chart-only, read via images (image38, image39)
- [x] Lundgaard-slægten / Fur-slægter (p.78-82) — chart-only, read via images (image40, and briefly image41-44, scoped — see below)
- [x] Degn-slægten Frammerslev/Fur (p.83-85) — chart-only, read via images (image45, and briefly image46-47, scoped — see below)
- [x] Boe-slægter (p.86-91) — comparative prose on unconnected "Boe" families elsewhere in Denmark
- [x] Kilder (p.92-96) — bibliography, no new individuals

The entire manuscript (Chapters 1-4, Anetavler, Kilder) has now been read.

---

## Søgaard-slægten (p.76-77)

Traces the ancestry of **Bodil Kirstine Iversdatter** (`@I26@`, generation "04"'s wife) — previously a placeholder family (`@F16@`) since Chapter 1's own reading, cross-referenced but not detailed. The chart (`image38.png`) gives, in a direct patrilineal-then-marriage chain: Henrich Andersen Søgaard (gen "03," b. o.1659, d.1738, fæstegårdmand i Søgaard) → Iver Henrichsen (gen "04," b. o.1725, d.1788, gårdfæster, Åsted) → Henrich Iversen (gen "05," b. o.1771, d.1799, husmand, Nissum) → **Iver Henriksen** (b.1796, d.1849, daglejer/husmand, Thorum/Fur) married **Else Jensdatter** (b.1795, d.1850, Thorum, herself daughter of Jens Pedersen + Anne Nielsdatter, a separate line traced back one more generation) → **Bodil Kirstine Iversdatter** herself.

A second chart page (`image39.png`) extends the direct line two more generations back: Peder (bare first name, no other detail) → Anders Pedersen/Persen (b. o.1629, d.1699, fæstegårdmand i Søgaard) married Anne (eller Kirsten) — the source itself marks her first name uncertain ("Anne eller Kirsten") — → Henrich Andersen Søgaard, closing the loop with the first chart.

**A note on a previously-logged anomaly:** `family-tree/possible-duplicates.md`'s sub-pattern C1 flagged a name-order discrepancy — Bodil Kirstine's father named "Iver Hendriksen" at her 1850 marriage record vs. "Hendrik Iversen (morfar)" as a fadder at a later baptism. This chart confirms her actual father is Iver Henriksen (b.1796, matching the marriage record) and her actual grandfather is Henrich Iversen (b. o.1771, d.1799 — died 25 years before Bodil Kirstine was even born, so he cannot be the "morfar" fadder at a much later baptism). **This does not resolve C1** — whoever the "Hendrik Iversen (morfar)" fadder actually was, it isn't this chart's Henrich Iversen. Left open.

`family-tree/tree.ged`: `@I335@`-`@I347@` (13 new individuals), families `@F107@`-`@F112@` (new); `@F16@` refined from placeholder to full record.

---

## Lundgaard-slægten / Fur-slægter (p.78-82)

Traces the ancestry of **Margrethe Jensdatter**, mother of **Mette Jensen** (`@I28@`, generation "05"'s wife) — previously only cross-referenced to an unread "KAPITEL 9" (a different document entirely, not part of this manuscript's own four chapters). The chart (`image40.png`) gives: **Jens Thøgersen** (döbt 6.12.1778, d.14.7.1853, landmand, Madsbad, Fur) married **Mette Jensdatter** (döbt 22.9.1776, d.1.9.1856, Fur — yet another person of this common name, unrelated to `@I10@` or `@I329@`) → **Margrethe Jensdatter** (b.9.12.1812, Madsbad, Fur; d.24.2.1902, Debel, Fur) married **Jens Christian Thorsen** (b.28.2.1823, d.1905, Debel, Fur — the chart itself cross-references "DEGN-SLÆGTEN, FRAMMERSLEV" for his own ancestry, found and read separately, see below) → **Mette Jensen** (`@I28@`) herself.

**A large scope decision, stated plainly:** the same chart, and two further pages checked (`image41.png`, `image42.png`), continue several side-branches and ancestor generations well beyond this direct line — back to a "Gravers Thomasen," documented from 1590, and multiple parallel great-great-grandparent columns (labeled "KAP1A" through "KAP4B" on the chart itself, an ahnentafel-style layout). A third page (`image43.png`) extends yet another branch back to "Thomas Iversen," documented from 1614. This is genuinely deep, well-organized 17th-century material — but mining all of it accurately from dense handwritten multi-column charts, for ancestors 7-8 generations removed from KEJ himself, was judged to cost more time than it returns today, especially against the goal of finishing the whole manuscript in one session. **Only the direct line connecting to already-known individuals was modeled in `tree.ged`.** The deeper material remains available in the media folder for a dedicated future session, not silently dropped — this paragraph is that documentation.

`family-tree/tree.ged`: `@I348@`-`@I351@` (4 new individuals: Jens Thøgersen, Mette Jensdatter, Margrethe Jensdatter, Jens Christian Thorsen), families `@F113@`-`@F114@` (new); `@I28@` (Mette Jensen) given a real `FAMC` for the first time.

---

## Degn-slægten Frammerslev/Fur (p.83-85)

Traces **Jens Christian Thorsen's** own ancestry, cross-referenced from the Lundgaard-slægten chart above. This chart (`image45.png`) is unusually clean and directly closes the loop back to the main tree: **Anders Sørensen (Degn)** (b. o.1716, d.1781, Nestild — "Degn" here is his actual occupation, church clerk/sexton, not yet a fixed surname) married Karen Christensdatter (gift 1736, Oddense) → **Jens Andersen Degn** (b.1738, d.1809, Frammerslev — "Degn" now carried as an inherited surname) married Dorthe Thorsdatter → **Thor Jensen** (b.1800, Frammerslev; d.17.1.1825, Fur; gårdejer, Debel) married **Anne Christensdatter** (döbt 13.3.1796, Fur; d. after 1845 — herself daughter of Christen Nielsen "Skytte" and Kirsten Sørensdatter, traced one more generation to Søren Olesen, a "jordløs husmand og fisker" who died on the Limfjord in 1756, and Anne Jensdatter of Kobberup) → **Jens Christian Thorsen** himself, giving his precise birth date (28.2.1823, refining the "1823" already on record) — → Margrethe Jensdatter → Mette Jensen → the already-established tree.

Two further chart pages (`image46.png`, `image47.png`) extend both Søren Olesen's and Anne Jensdatter's own lines back further still (to a "Mikkel Nielsen," documented from o.1630, and a "Jens Nielsen Kobberup," documented from o.1629) — the same scope decision as the Lundgaard-slægten section above applies: not modeled in `tree.ged`, available in the media folder for later.

`family-tree/tree.ged`: `@I352@`-`@I361@` (10 new individuals), families `@F115@`-`@F119@` (new); `@I351@` (Jens Christian Thorsen) given a real `FAMC` and a precise birth date.

---

## Boe-slægter (p.86-91) — Comparative Research, Not Modeled in `tree.ged`

This section is qualitatively different from everything before it: normal prose (not chart-only), but explicitly about **other, unconnected families who also carry the "Boe" name** elsewhere in Denmark. KEJ's own text repeatedly states no provable link to the Mors/Fur Boe line this whole project has been building — this is comparative surname research, directly relevant to the still-open "Boe surname origin is unknown" question from Chapter 1 (generation "02," `@I1@`), but not itself part of the family tree. **No individuals from this section were added to `tree.ged`** — doing so would fabricate `FAMC`/`FAMS` links implying a confirmed relationship KEJ himself says can't be shown.

**Boe på Mors** (p.86): a Christen Boe/Christen Nielsen Boe family in Nykøbing itself (1690-1786), documented via a probate record. KEJ's own conclusion: "Et eventuelt slægtsforhold mellem Jens og Peder Christensen Boe og denne Christen Nielsen Boe kan p.t. ikke påvises. Ej heller til andre kendte Boe-slægter" ("A possible family relationship... cannot currently be shown. Nor to other known Boe families"). He does offer a naming theory: the "Boe" surname may simply derive from "manden i Boen" ("the man at the Bo[e]," a farm/homestead name) or from "bonde" (farmer) — a plain-language origin, not a shared ancestor.

**Boe på Ålborgegnen** (p.86-87): a merchant-class Boe family in Ålborg from the early 1700s (Jens Clausen Boe, klokker/sexton at Budolfi kirke; Hendrikke Boe, married to a byfoged/town bailiff) — social class and location both argue against any connection to the Mors farming family.

**Boe i Himmerland/Thy** (p.87): KEJ raises a *plausible but unconfirmed* connection here, via a shared noble estate (Sivert Brockenhuus, connected to both Ullerup on Mors and Sebberkloster near Sebbersund) that historically could have moved a tenant-farming family between regions. Framed as speculative ("kan således tænkes," "kunne gå over") — not concluded.

**Boe i Sønderjylland/Slesvig** (p.87-88): a distinct, fairly well-documented Boe lineage from Seem/Spandet parish, 1700s-1800s, with occupational ties to fishing and shipping — a pattern KEJ notes recurs for the "Boe" name generally ("Boe navnet er flere steder i Danmark knyttet til fiskeri og søfart"). No connection claimed to the Mors line.

**Fyn-slægten Boe** (p.89): the most thoroughly documented of the comparative families — traced in a published source ("Boernes Slægtsbog," 1960) back to Peder Hansen Bomand, o.1500-1556, Helnæs, Fyn. KEJ's own conclusion is explicit: "Det må derimod anses for usandsynligt, at der skulle være en forbindelse til den fynske Boe-slægt" ("It must, however, be considered unlikely that there is a connection to the Funen Boe family"). A commemorative stone at Helnæs, photographed in the manuscript (`image48.jpeg`), reads "FRA DENNE GAARD UDGIK DEN VESTFYENSKE BOE-SLÆGT" ("From this farm emerged the West Funen Boe family"). Four competing local traditions for the Funen family's own origin (Swedish brothers, Scottish brothers under King Hans, etc.) are recounted and weighed by KEJ, entertainingly, but this whole thread is explicitly about a family the Mors line is *not* shown to be connected to.

**Bomand / Boe** (p.90): broader background on "Bomand" as a name found across Denmark (Viborg, Sjælland) independent of the Fyn family, reinforcing KEJ's point that "Boe"/"Bomand" isn't unique enough as a name to imply a shared origin on its own.

**Boe i Nyord ved Stege på Møn** (p.91): a small Boe family of skippers and gårdmænd/pilots on the island of Møn, early 1800s, documented via direct kirkebog quotations — again, no connection claimed.

**Net effect on the open "Boe surname origin" question:** KEJ's own research strengthens, rather than resolves, the existing uncertainty. He has actively looked for a connection to the best-documented other "Boe" family (Fyn) and concluded against it, and finds no more than a plausible-but-unconfirmed geographic link for the Himmerland/Thy family. This is added as a supplementary note on `@I1@` (Peder Christensen Boe, generation "02") — not a new open item, since KEJ isn't asking a question here, he's reporting his own settled research conclusion.

[VERIFIED: boe-slaegten-fra-mors-og-fur, Boe-slægter p.86-91]

---

## Kilder (p.92-96) — Bibliography, No New Individuals

A straightforward source bibliography, organized by chapter and cross-referenced to the specific individuals/sections each source documents: kirkebøger (parish registers) for Jørsby, Sdr. Dråby, Sejerslev, Fur, Elsø, Nykøbing Mors, Tødsø, and several others; folketællinger (censuses) for the same parishes across many years; skifteprotokoller (probate records) for Ullerup gods and Nykøbing Mors; fæsteprotokoller (tenancy records); a few named secondary sources (a 1976 oral account from K.K.K. Boe, a 2015 newspaper obituary, an external "Slægtsbog for efterkommere efter Mogens Nielsen" already noted during Chapter 1's branch g reading).

This is valuable as a citation-precision resource — it's effectively an index of exactly which primary record backs which claim — but adds no new genealogical facts or individuals of its own. Worth returning to if this project ever needs to sharpen the coarse `[VERIFIED: boe-slaegten-fra-mors-og-fur, p.N-M]` section-range citations used throughout this extraction into true per-record citations; not pursued now, consistent with the citation-methodology note already on record in `boe-slaegten-chapter1-extraction.md`.

[VERIFIED: boe-slaegten-fra-mors-og-fur, Kilder p.92-96]

---

## Images

Nine images total for this final portion of the manuscript, five stored:

- **`image38.png`, `image39.png`** — Søgaard-slægten chart pages (both stored, both mined for `tree.ged`).
- **`image40.png`** — Lundgaard-slægten/Fur-slægter chart, direct-line page (stored, mined). `image41.png`-`image44.png` — further chart pages for the same appendix, confirmed relevant but not individually filed, per the scope decision above (their content is described in prose instead).
- **`image45.png`** — Degn-slægten Frammerslev/Fur chart, direct-line page (stored, mined). `image46.png`-`image47.png` — further chart pages, same scope decision.
- **`image48.jpeg`** — a photograph of the Helnæs commemorative stone, tied directly to the Fyn-slægten Boe comparative section (stored).

This accounts for all 48 real embedded images in the manuscript — every image has now been checked at least once.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation. Read the entire remaining manuscript: the Anetavler (Søgaard-slægten, Lundgaard-slægten/Fur-slægter, Degn-slægten Frammerslev/Fur — all three chart-only, not prose, a structural discovery worth noting) and Kilder. Modeled the direct connecting lines for all three genealogical appendices (27 new individuals, 13 new families total), resolving two long-standing placeholder families (`@F16@`, and giving `@I28@`/`@I351@` real parents for the first time). Deliberately scoped out several generations of deeper 17th-century ahnentafel material as a documented, not silent, decision. Read the "Boe-slægter" comparative section in full as prose (not modeled in `tree.ged` — explicitly unconnected families per KEJ's own conclusion) and the Kilder bibliography (no new individuals). **With this file, the entire "2024 Boe-slægen fra Mors og Fur.docx" manuscript has been read.** |
