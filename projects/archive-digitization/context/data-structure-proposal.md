# Data Structure Proposal — Individuals and Families at Scale

Version 1.0 | 2026-08-05 | Draft

---

## Document Purpose

A sketch, not yet a decision, for how to structure individual/family data once material starts arriving in volume (thousands of names expected). Compares a flat CSV against GEDCOM, the genealogy industry's actual interchange standard, using real (still `[UNVERIFIED]`) Hopp-slægt data already in this repo as a concrete worked example. Project-layer content — freely revisable, not yet a structural commitment. Promoting this into an actual top-level folder and updating `Architecture.md` would be system-layer work requiring the same plan-first treatment as `grandfather-review/` got.

---

## 1. Why Not a Flat CSV

A CSV with `spouse_ids` / `children_ids` columns works until someone remarries. At that point you need to know *which* marriage a given child belongs to — a flat column has no clean way to express that without inventing a family-grouping concept, which is exactly what GEDCOM already provides. Given genealogical records are full of remarriage, half-siblings, and children from unclear parentage, this isn't an edge case — it is the normal shape of the data.

A CSV mockup of the same people, to make the problem concrete:

| id | name | sex | birth_year | death_year | birth_place | occupation | father_id | mother_id | spouse_ids | children_ids | free_text |
|---|---|---|---|---|---|---|---|---|---|---|---|
| I1 | Hans Hop | M | 1562 | 1624 | Metzingen, Württemberg | Landmand, humledyrker | | | | I2 | Emigrerede til Holland |
| I2 | Mads Hopp | M | 1590 | 1650 | Skagen | Købmand, rådmand | I1 | | | I3 | Indvandrede til Skagen o. 1625 |
| I4 | Knud Danielsen Hopp | M | ~1640 | 1723 | Ålborg | Herredsfoged, Salling Nørre Herred | I3 | | I5 | I6 | Ledte hekseprocessen 1686 |
| I6 | Knud Knudsen Hopp | M | 1687 | 1762 | | Sognedegn, Thise | I4 | I5 | I7 | | 6 børn i alt, kun 1 kendt her |

Already visibly strained: `spouse_ids`/`children_ids` are single values here only because this branch happens not to have a remarriage yet. The moment it does, the column either becomes a fragile semicolon-delimited list with no way to say which spouse a given child belongs to, or you start adding a `family_id` column — at which point you've reinvented GEDCOM's `FAM` record, just without the tooling and conventions that already exist around it.

---

## 2. The GEDCOM Alternative

Same people, as GEDCOM. Individuals (`INDI`) hold vital facts; family units (`FAM`) hold the relationships, linking a couple to their shared children via cross-reference IDs (`@I4@`, `@F4@`). This is deliberately a small, real slice — not the whole chain — to keep the mockup readable.

```
0 HEAD
1 SOUR kej-context-architecture
1 CHAR UTF-8
1 GEDC
2 VERS 5.5.1

0 @I1@ INDI
1 NAME Hans /Hop/
1 SEX M
1 BIRT
2 DATE 1562
2 PLAC Metzingen, Schwarzwald, Württemberg, Tyskland
1 DEAT
2 DATE 1624
1 OCCU Landmand, humledyrker
1 FAMS @F1@
1 NOTE Emigrerede senere til Holland. [UNVERIFIED: akj-cbj.dk/Hopp.htm — grandfather-review/queue.md #2]

0 @I2@ INDI
1 NAME Mads /Hopp/
1 SEX M
1 BIRT
2 DATE 1590
1 DEAT
2 DATE 1650
2 PLAC Skagen, Danmark
1 OCCU Købmand, senere rådmand i Skagen
1 FAMC @F1@
1 FAMS @F2@
1 NOTE Indvandrede til Skagen o. 1625. Broderen Jean Hopp blev stamfader til adelsslægten Hoppe. [UNVERIFIED: akj-cbj.dk/Hopp.htm]

0 @I3@ INDI
1 NAME Daniel Madsen /Hopp/
1 SEX M
1 BIRT
2 DATE ABT 1620
1 FAMC @F2@
1 FAMS @F3@
1 NOTE Fødselsår usikkert — en kilde angiver 1633, hvilket ikke stemmer med at være far til Knud Danielsen Hopp (f. 1640). [CONTRADICTS: akj-cbj.dk/Hopp.htm — grandfather-review/queue.md #2]

0 @I4@ INDI
1 NAME Knud Danielsen /Hopp/
1 SEX M
1 BIRT
2 DATE ABT 1640
2 PLAC Ålborg, Danmark
1 DEAT
2 DATE 1723
1 OCCU Herredsfoged og herredsskriver, Salling Nørre Herred (fra 1673)
1 FAMC @F3@
1 FAMS @F4@
1 NOTE Ledte hekseprocessen mod "Tise Trolde" i 1686. Foreslået match med bedstefars kapitel "01". [UNVERIFIED — grandfather-review/queue.md #1]

0 @I5@ INDI
1 NAME Birte /Pedersdatter/
1 SEX F
1 FAMS @F4@
1 NOTE Boede i Stouby, Grinderslev sogn. [UNVERIFIED: akj-cbj.dk/Hopp.htm]

0 @I6@ INDI
1 NAME Knud Knudsen /Hopp/
1 SEX M
1 BIRT
2 DATE 1687
1 DEAT
2 DATE 1762
1 OCCU Sognedegn i Thise (1726-1762)
1 FAMC @F4@
1 FAMS @F5@
1 NOTE Foreslået match med bedstefars kapitel "01F". [UNVERIFIED — grandfather-review/queue.md #1]

0 @I7@ INDI
1 NAME Else /Pedersdatter/
1 SEX F
1 DEAT
2 DATE 1769
1 FAMS @F5@

0 @F1@ FAM
1 HUSB @I1@
1 CHIL @I2@
1 NOTE Mor ukendt.

0 @F2@ FAM
1 HUSB @I2@
1 CHIL @I3@
1 NOTE Mor ukendt.

0 @F3@ FAM
1 HUSB @I3@
1 CHIL @I4@
1 NOTE Mor ukendt.

0 @F4@ FAM
1 HUSB @I4@
1 WIFE @I5@
1 CHIL @I6@
1 NOTE Kilden nævner 6 børn i alt — kun 1 medtaget i denne skitse.

0 @F5@ FAM
1 HUSB @I6@
1 WIFE @I7@
1 NOTE 6 børn i alt ifølge kilden, ikke alle navngivet endnu.

0 TRLR
```

Notice `Daniel Madsen /Hopp/` (`@I3@`) has both a `FAMC` (the family he's a child in, `@F2@`) and a `FAMS` (the family he's a spouse/parent in, `@F3@`) — that two-link pattern is what lets a person be a child in one record and a parent in another without any column-based awkwardness, and it's also exactly how a future remarriage would be handled: a second `FAMS` line pointing at a second `FAM` record, with that marriage's children scoped to it and it alone.

Also worth noting: this repo's own `[VERIFIED]`/`[UNVERIFIED]`/`[CONTRADICTS]` signals slot directly into GEDCOM's free-text `NOTE` tag — no new confidence system needed, same as the existing convention.

---

## 3. Where This Would Live

Genealogical relationships are inherently cross-*slægt* — marriages connect Boe to Hopp to Dølby to whatever else surfaces, by design, not exception. A GEDCOM file scoped to one domain's folder would fight that constantly (a person marrying across lines would need to "exist" in two places). Proposed: a single top-level file, e.g. `family-tree/tree.ged`, sibling to `knowledge/`, `library/`, and `grandfather-review/` — one unified structural graph, cited from wherever it's relevant.

Domain `knowledge.md` files would keep the narrative and evidentiary sources exactly as now, and cite into the tree for the canonical vital-record entry (e.g., "see `family-tree/tree.ged#I4`"), the same citation pattern already used for `library/reference-index.md` entries.

**Not yet built** — this is deliberately just the sketch. Creating the actual folder and updating `Architecture.md`'s file structure diagram is a real structural decision (new top-level concern, a second structured-data format alongside markdown) and should get the same plan-first / confirmation treatment `grandfather-review/` got, not be added quietly.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-05 | Initial creation. GEDCOM vs. CSV comparison using real Hopp-slægt data from `external-source-hopp-herredsfoged.md`, plus a proposed (not yet built) top-level `family-tree/` location. |
