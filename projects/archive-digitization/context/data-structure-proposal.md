# Data Structure Proposal — Individuals and Families at Scale

Version 1.3 | 2026-08-25 | Draft

---

## Document Purpose

A sketch, not yet a decision, for how to structure individual/family data once material starts arriving in volume (thousands of names expected). Compares a flat CSV against GEDCOM, the genealogy industry's actual interchange standard, using real (still `[UNVERIFIED]`) Hopp-slægt data already in this repo as a concrete worked example. Project-layer content — freely revisable, not yet a structural commitment. Promoting this into an actual top-level folder and updating `Architecture.md` would be system-layer work requiring the same plan-first treatment as `grandfather-review/` got.

---

## Index

1. [Why Not a Flat CSV](#1-why-not-a-flat-csv) — the remarriage/half-sibling problem a flat column can't express
2. [The GEDCOM Alternative](#2-the-gedcom-alternative) — worked mockup using real Hopp-chain data
3. [Where This Would Live](#3-where-this-would-live) — proposed single cross-*slægt* `family-tree/tree.ged`
4. [IDs, Duplicates, and Unknown Relations](#4-ids-duplicates-and-unknown-relations) — ID stability, never-merge-on-name-match, the two-tier duplicate workflow
5. [Kirkebog Record Types → GEDCOM Tags](#5-kirkebog-record-types--gedcom-tags) — mapping each Danish parish record type to the specific GEDCOM structure it converts to, so extraction now doesn't need redoing later
6. [Version History](#version-history)

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
1 NOTE Ledte hekseprocessen mod "Tise Trolde" i 1686. Foreslået match med KEJs kapitel "01". [UNVERIFIED — grandfather-review/queue.md #1]

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
1 NOTE Foreslået match med KEJs kapitel "01F". [UNVERIFIED — grandfather-review/queue.md #1]

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

## 4. IDs, Duplicates, and Unknown Relations

Three practical problems that will show up as soon as real volume arrives, worked through here rather than left to be improvised mid-extraction.

### 4.1 ID stability

A GEDCOM `@I4@`-style cross-reference ID is functionally a primary key, but the spec doesn't guarantee it stays stable — most tools freely renumber IDs on re-export or merge, since the ID is only meant to be unique *within one file*. That's a real risk here specifically: domain `knowledge.md` files will cite individuals by ID (`family-tree/tree.ged#I4`), and a silent renumbering would quietly break every citation.

**Rule:** treat ID assignment as append-only, the same discipline already used for session-log turn numbers and Version History rows. Once `@I137@` exists, it is `@I137@` forever — never reused, never reassigned, even if that individual later turns out to be a duplicate (§4.3).

### 4.2 Unknown relations

Already the easy case: GEDCOM represents "not yet known" by omitting the tag entirely, not by a null placeholder. No `FAMC` line means no parents identified yet; no `FAMS` line means no known spouse. This is a non-issue — the format's default state already matches this repo's own principle of not asserting what isn't confirmed.

### 4.3 Duplicates — same name, unclear if same person

Given how repetitive Danish patronymic naming is (a lot of "Niels Nielsen"s are coming), this will be a routine occurrence, not an edge case. Standard genealogical practice, adopted here: **never merge on name match alone — when uncertain, create a separate record.** Under-merging (two records that turn out to be one person) is a cheap, reversible mistake to fix once more evidence surfaces. Over-merging (one record that was actually two people) silently corrupts the tree in ways that are hard to even notice, let alone undo.

Two tiers, so the volume of "might be the same person" cases doesn't overwhelm `grandfather-review/queue.md`:

| Tier | Where it lives | When to use |
|---|---|---|
| Routine ambiguity — same name, no strong evidence either way | A same-file `NOTE` on each record (`[UNVERIFIED: possible duplicate of @I47@]`), tracked in a new `family-tree/possible-duplicates.md` running list | Most name collisions — not worth KEJ's time individually |
| Well-evidenced candidate — a specific, answerable question | `[FLAG FOR GRANDFATHER REVIEW]`, appended to `grandfather-review/queue.md` (in Danish, per its own convention) | Only once there's concrete supporting evidence, matching the queue's existing "Grundlag" (basis) discipline — not a vague hunch |

**Resolving a confirmed duplicate:** never delete or renumber either ID (§4.1). Mark the retired one as merged into the survivor — `1 NOTE Merged into @I200@, confirmed by KEJ YYYY-MM-DD` — archive-in-place, the same pattern this repo already uses for retiring a domain. Anything that ever cited the retired ID still resolves to an explanation, not a dead reference.

**Transcription vs. inference reminder** (see `TODO.md`): creating a new individual record from something KEJ's own document states directly is not an inference and doesn't need queueing. Flagging two records as a *possible* duplicate, or proposing a merge, *is* an inference and follows the tiers above.

---

## 5. Kirkebog Record Types → GEDCOM Tags

The citation templates in `authoring-guidelines.md` §9.5 answer "where did this fact come from." They don't answer "which structured field does this fact go in" — that's a separate question, and getting it right now means extraction doesn't need redoing once volume arrives. Verified against Rigsarkivet/DIS-Danmark documentation rather than assumed (see `projects/system/session-log.md` for sources).

Danish kirkebøger record six event types, in this order within the book: fødsel/dåb (birth/baptism), konfirmation, vielse (marriage), tilgang (arrival), afgang (departure), begravelse/død (burial/death).

| Kirkebog record | Typical fields recorded | GEDCOM structure |
|---|---|---|
| Dåb (baptism) | Barnets navn, fødselsdato (sometimes), dåbsdato, faderens navn, moderens navn, faddere (≥2 godparents) | `CHR` (christening) with `DATE`/`PLAC`. Use `BIRT` too only if a birth date distinct from the baptism date is actually given — many entries only have dåbsdato, and recording that as `BIRT` misstates the source. Parents via `FAMC`. Godparents: separate `INDI` records linked via `ASSO` with a `ROLE` (e.g. "Fadder"), or a `NOTE` naming them if `ASSO` feels like overkill for a first pass |
| Konfirmation | Barnets navn, alder (~14-16), bopæl at time of confirmation | `CONF` with `DATE`/`PLAC`. Useful for corroborating an approximate birth year and a residence at a specific date — note it as such, not as a primary birth source |
| Vielse (marriage) | Brudgom + brud navn/alder/bopæl, forældre eller værge (esp. for a young bride), forlovere (≥2 witnesses, with addresses), evt. kongebrev (royal dispensation) | `MARR` on a `FAM` record linking the couple. Witnesses: same pattern as godparents — separate `INDI` + `ASSO`/`ROLE`, or `NOTE`. A royal dispensation is worth its own `NOTE` — it usually signals something noteworthy (close kinship, under-age, prior marriage) |
| Tilgang / Afgang (arrival/departure) | Navn, dato, hvorfra/hvortil, reference to an attest (certificate) | Not `EMIG`/`IMMI` — those are for crossing national borders, and a parish-to-parish move within Denmark isn't that. Use `RESI` (residence) events per parish with date ranges, or a generic `EVEN` with `TYPE Tilgang`/`TYPE Afgang` if the specific transfer detail matters |
| Begravelse / Død (burial/death) | Navn, alder, dødsdato and/or begravelsesdato (often only one is given), sometimes dødsårsag (cause), stand/erhverv | `BURI` and/or `DEAT`, whichever date the record actually gives — don't infer one from the other without saying so. `OCCU` for stand/erhverv if stated |

**A real messiness pattern to expect, not be surprised by:** baptism records for children born outside marriage historically garble the mother's identity — the ordering of parent information differs from a normal entry, and sometimes another person's name (not the actual mother) appears where the mother's name would go. Treat any such entry's parentage as `[UNVERIFIED]` until corroborated, not as a plain fact — this is exactly the kind of source-specific caveat GPS's "reliable and skillfully correlated" element (`authoring-guidelines.md` §9.5) exists to catch.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-05 | Initial creation. GEDCOM vs. CSV comparison using real Hopp-slægt data from `external-source-hopp-herredsfoged.md`, plus a proposed (not yet built) top-level `family-tree/` location. |
| 1.1 | 2026-08-05 | Added §4 (IDs, duplicates, unknown relations): append-only ID assignment, the never-merge-on-name-match rule, the two-tier duplicate workflow (routine ambiguity vs. well-evidenced grandfather-review candidate), and the merge-without-deleting convention. Added an Index (file now exceeds four sections). Updated references to KEJ per the human's naming preference. |
| 1.2 | 2026-08-05 | Added §5, mapping each Danish kirkebog record type (dåb, konfirmation, vielse, tilgang/afgang, begravelse/død) to its actual GEDCOM structure (CHR/CONF/MARR/RESI-or-EVEN/BURI-DEAT), verified against Rigsarkivet and DIS-Danmark documentation rather than assumed. Answers the question of whether we're capturing enough structured detail for a later conversion, not just citation provenance. Flagged the historical illegitimate-birth parentage-garbling pattern as an expected messiness case. |
| 1.3 | 2026-08-25 | Structural fix: added the missing "6. Version History" Index entry, surfaced by a new Index-integrity check adopted from an upstream template sync. No content change. |
