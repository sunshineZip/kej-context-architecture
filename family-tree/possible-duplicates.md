# Possible Duplicates and Recurring Data-Quality Patterns

Version 1.6 | 2026-08-06 | Production

---

## Document Purpose

Two related running lists this repo tracks but keeps below `grandfather-review/queue.md`'s bar, per the two-tier duplicate workflow in `projects/archive-digitization/context/data-structure-proposal.md` §4.3: (1) same-name individuals in `family-tree/tree.ged` that might be the same person, with no strong evidence either way, and (2) recurring low-confidence data-quality anomalies (suspected extraction artifacts, not manuscript errors) that are individually not worth KEJ's time but are worth counting — a pattern that recurs enough times stops being "probably nothing."

---

## 1. Possible Duplicate Individuals

Same-name ambiguity where two `family-tree/tree.ged` records might be the same person. Per the never-merge-on-name-match rule, each stays a separate `@I@` record with a same-file `NOTE` pointing here; only a well-evidenced, specific candidate escalates to `grandfather-review/queue.md`.

| # | Individuals | Names | Basis for ambiguity | Status |
|---|---|---|---|---|
| — | None yet | N/A | N/A | No genuine same-person ambiguity found yet. The repeated names within one family in the Boe-slægten data so far (Maren, Johanne, Grethe each appearing twice in generation 03's children) are explicitly distinguished by the manuscript itself as name-reuse after an earlier child's infant death — not ambiguous, already modeled as separate individuals (`@I15@`/`@I16@`, `@I17@`/`@I18@`, `@I19@`/`@I20@`) in `family-tree/tree.ged`. The Hopp-chapter cross-references (KEJ's own chapter numbers vs. an external genealogist's page) are a different, better-evidenced case and sit in `grandfather-review/queue.md` items 1-3 instead. |

---

## 2. Recurring Data-Quality Anomaly Log

Values in the extracted text that don't reconcile with other stated facts, judged likely artifacts of this session's own text extraction from the source `.docx` rather than errors in KEJ's manuscript — see `projects/archive-digitization/context/boe-slaegten-chapter1-extraction.md`'s correction discipline. Tracked centrally so a pattern that keeps recurring is visible as a pattern, not scattered across separate Version History rows where nobody is counting.

**Sub-pattern A — "19xx" digit shown where context requires "18xx" (or an adjacent digit swap of the same shape):**

| # | Individual | Field | Manuscript shows | Expected (from context) | Source | Status |
|---|---|---|---|---|---|---|
| A1 | Mette Jensdatter (`@I10@`) | Birth year, Aneoversigt table | 1878 | 1787 (her own section states this precisely) | `boe-slaegten-fra-mors-og-fur`, Aneoversigt p.3 | Not queued — single self-correcting instance (precise date given elsewhere in same document) |
| A2 | Maren Christensdatter, gen 03 child "e." (`@I15@`) | Death year | 1919 | 1819 (died as an infant, age given as 1y2m2w6d) | `boe-slaegten-fra-mors-og-fur`, p.9-17 | Not queued — pattern instance 2 |
| A3 | Johanne Christensdatter, gen 03 child "g." (`@I17@`) | Birth year | 1921 | 1821 (sibling of a child born 1818, died before baptism was announced) | `boe-slaegten-fra-mors-og-fur`, p.9-17 | Not queued — pattern instance 3 |

**Sub-pattern B — a stated age doesn't reconcile with a separately-stated birth year (not a digit swap, but the same low-confidence/likely-artifact treatment):**

| # | Individual | Field | Manuscript shows | Expected (from birth year) | Source | Status |
|---|---|---|---|---|---|---|
| B1 | Anna Pedersdatter Boe (`@I3@`) | Age at 1801 folketælling | 14 | ~24 (b.1777) | `boe-slaegten-fra-mors-og-fur`, p.5-8 | Not queued |
| B2 | Laurs Pedersen Boe (`@I5@`) | Age at 1801 folketælling | 14 | ~17 (b.1784) | `boe-slaegten-fra-mors-og-fur`, p.5-8 | Not queued — same wrong value ("14") as B1, in the same 1801 table; reads as a table-layout extraction artifact rather than two independent period-record errors |
| B3 | Johanne Christensdatter Boe, gen 03 child "h." (`@I18@`) | Age at 1845 folketælling | 16 | ~22-23 (b.1822) | `boe-slaegten-fra-mors-og-fur`, p.9-17 | Not queued |

**Sub-pattern C — a person's name/patronymic appears in a different order across two mentions in the manuscript (new, generation "04"):**

| # | Individual | Field | Manuscript shows | Expected (from context) | Source | Status |
|---|---|---|---|---|---|---|
| C1 | Bodil Kirstine Iversdatter's father (`@I26@`'s `@F16@`) | Father's name | "Hendrik Iversen (morfar)" at a 1861 baptism | "Iver Hendriksen," per Bodil Kirstine's own 1850 marriage record | `boe-slaegten-fra-mors-og-fur`, p.18-20 | Not queued — first instance of this shape |

**Sub-pattern D — a person is named correctly, but the relationship label and/or branch-letter attached to them is wrong (new, Efterslægt branch b):**

| # | Individual | Field | Manuscript shows | Expected (from context) | Source | Status |
|---|---|---|---|---|---|---|
| D1 | Christen Pedersen Boe, generation "05" (`@I27@`) | Relationship label + branch-letter, as Esper Marinus Christensen Boe's fadder | "(morbror = g.)" — maternal uncle, branch-letter of Laurids | "morfaderen" (maternal grandfather), no branch-letter applicable — confirmed two lines later in the same passage, which calls the same person "morfaderen, Christen Pedersen" | `boe-slaegten-fra-mors-og-fur`, p.25-54 | **Queued — grandfather-review/queue.md #7** (see below) |
| D2 | Christian Christensen Boe, branch g child "VII." (`@I104@`) | Branch-letter, as niece Mona Schmidt Boe's fadder | "(VI.)" | "(VII.)" — his own section, and every other cross-reference to him, consistently use "VII." | `boe-slaegten-fra-mors-og-fur`, p.25-54 | **Queued — grandfather-review/queue.md #7** |
| D3 | Poul Kristensen Boe, branch g child "VI." (`@I103@`) | Branch-letter, same fadder list as D2 | "(V.)" | "(VI.)" — his own section, and every other cross-reference to him (at least 5 separate mentions elsewhere), consistently use "VI." | `boe-slaegten-fra-mors-og-fur`, p.25-54 | **Queued — grandfather-review/queue.md #7** |

**Note (2026-08-08):** KEJ's reply confirmed the full branch-g sibling list and roman numerals (I.-XI., see `family-tree/tree.ged#F14`) and separately supplied a list of page-level roman-numeral corrections in his own manuscript copy (s.33 XI=X., s.35 I=II., s.37 II=III., s.41 III=IV./IV=V., s.42 V=VI., s.43 VI=VII., s.44 VII=VIII., s.50 VIII=X., s.54 f=h/g=f) — these are cross-page reference slips in the source document itself, not the same specific fadder-list occurrences as D1-D3, which remain open (they're about the Mona Schmidt Boe baptism specifically, not addressed in this reply). Recorded here for completeness rather than folded into D1-D3.

**Sub-pattern E — a full date is given, but yields an implausible age or timeline (new, Efterslægt branch e):**

| # | Individual | Field | Manuscript shows | Expected (from context) | Source | Status |
|---|---|---|---|---|---|---|
| E1 | Marie Kirstine Goul Boe (`@I98@`) | Marriage date | "Gift febr. 1967" | Almost certainly 1977 — as given, she'd be not yet 9 years old (b.8.3.1957); 1977 gives a plausible ~19-20 | `boe-slaegten-fra-mors-og-fur`, p.25-54 | Not queued — first instance of this shape; a single-digit decade error, not the same mechanism as sub-pattern A's century-digit swap |
| E2 | Margit Bak (`@I151@`) | Death date | "Død 24.1.1916." | **Resolved 2026-08-08**, confirmed by KEJ: 24.1.2016 — single-digit transcription error (19 for 20), not a real chronological impossibility in the source itself | `boe-slaegten-fra-mors-og-fur`, p.25-54 | Resolved — see `family-tree/tree.ged#I151` |

**Sub-pattern F — a year value appears concatenated directly onto a hospital/place name with no separator, sometimes matching the stated birth year and sometimes not (new, branch g child "V."):**

| # | Individual | Field | Manuscript shows | Expected (from context) | Source | Status |
|---|---|---|---|---|---|---|
| F1 | Mona Schmidt Boe (`@I115@`) | Birthplace field | "Viborg sygehus 1955" (trailing year doesn't match her own stated birth year, 1950) | Unclear — possibly a stray digit sequence from elsewhere in the original layout | `boe-slaegten-fra-mors-og-fur`, p.25-54 | Not queued — first instance |
| F2 | Thorkil Schmidt Boe (`@I116@`) | Birthplace field | "Viborg sygehus1958" (trailing year matches his own stated birth year, 1958) | Same concatenation shape as F1, but here happens to agree with the birth year already given | `boe-slaegten-fra-mors-og-fur`, p.25-54 | Not queued — second instance found in the same reading pass as F1 (same sibling group); genuinely a new mechanism from sub-patterns A-E (concatenation, not digit-swap or mislabeling), and one of the two instances doesn't even conflict with anything — kept at "not queued" despite technically meeting the usual two-instance bar, since there's nothing yet for KEJ to actually adjudicate (F2 isn't wrong) |

**Sub-pattern G — a fadder is correctly named and correctly numbered, but attached to the wrong surname/family (new, branch g child "VIII."):**

| # | Individual | Field | Manuscript shows | Expected (from context) | Source | Status |
|---|---|---|---|---|---|---|
| G1 | Jan Laurids Boll's fadder list, referring to Poul Kristensen Boe (`@I103@`) | Surname | "gartner Poul **Boll** i Durup (morbror = VI.)" | "Poul **Boe**" — the same gartner-uncle is correctly named "Poul Boe" in three siblings' own fadder lists in this same checkpoint (Svend Tage's, Karsten's, Anders Henrik's), all using the same correct roman numeral "VI." | `boe-slaegten-fra-mors-og-fur`, p.25-54 | Not queued — first instance. Distinct from sub-pattern D: the roman numeral itself is correct here, only the surname is wrong — likely the new family's own surname ("Boll") bleeding into a mention of the Boe uncle, an easy slip when both surnames appear constantly in the same passage. |

**Reassessment trigger:** generation "04" and Efterslægt branches a/c/d/f/h/i added no new instances of sub-pattern A or B (still three each) — the pattern didn't recur, itself informative. Sub-pattern C stands at one instance (C1) — not yet queued. **Sub-pattern D reached three instances (D1-D3) in branch g's first checkpoint and is queued to `grandfather-review/queue.md` as item 7.** **Sub-pattern E reached two instances (E1-E2) in branch g's second checkpoint and is queued as item 8** — E2 in particular is an outright impossibility (a death date predating the person's own birth by 35 years), not just implausible. Sub-pattern F stays at two instances (F1-F2), still not queued — see F2's own note on why. Sub-pattern G is new this checkpoint, at one instance (G1), not queued. Meanwhile branch g's later checkpoints (3 and 4) turned up eleven more *correctly*-labeled fadder references across the same kind of list that produced sub-pattern D — worth noting as a counterweight, since it means D's three instances are a real but apparently localized slip, not the dominant pattern in these lists. If a fourth instance of A/B, a second of C or G, or a further instance of F that actually conflicts with a stated fact, appears during further reading, escalate it the same way.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation. Backfilled the recurring data-quality anomaly log (§2) with the six instances already found and reasoned about across `boe-slaegten-chapter1-extraction.md`'s Open Items and Version History rows during Chapter 1's read-through of generations "02"-"03" — previously scattered prose, not centrally counted. §1 (possible duplicate individuals) opened with no entries yet. Human confirmed building this file now rather than leaving the two-tier duplicate-tracking system half-built. |
| 1.1 | 2026-08-06 | Generation "04" added no new instances of sub-patterns A/B (still three each — noted explicitly, since a pattern that stops recurring is itself worth recording). Added sub-pattern C (name/patronymic order inversion), a new shape not seen in generations "02"/"03," with its first instance. |
| 1.2 | 2026-08-06 | Efterslægt branches a/c/d/f/h/i and b read; no new A/B/C instances. Added sub-pattern D (correct name, wrong relationship-label/branch-letter) with its first instance, found in branch b — deliberately kept separate from sub-pattern C rather than folded in, since the underlying error shape is different (label wrong vs. name reordered). |
| 1.3 | 2026-08-06 | Efterslægt branch e read; no new A/B/C/D instances. Added sub-pattern E (a full date yielding an implausible age/timeline) with its first instance — a marriage date that would make the bride 8 years old as given, almost certainly a single-digit decade error. |
| 1.4 | 2026-08-06 | Branch g checkpoint 1 (children I/V/IX/XI): sub-pattern D reached 3 instances (D2, D3 found in a single fadder list) and escalated to `grandfather-review/queue.md` item 7, per this file's own reassessment trigger — the first sub-pattern to actually cross that line. Added sub-pattern F (year concatenated onto a place name), 2 instances found together, kept unqueued since one instance isn't actually wrong. |
| 1.5 | 2026-08-06 | Branch g checkpoint 2 (children II/X): sub-pattern E reached 2 instances (E2 — a death date predating the person's own birth by 35 years) and escalated to `grandfather-review/queue.md` item 8. |
| 1.6 | 2026-08-06 | Branch g checkpoints 3-4 (children II/X, III) added no new instances of A-F, but did add eleven more *correctly*-labeled fadder references — noted in the reassessment trigger as a counterweight to sub-pattern D. Branch g's final checkpoint (child VIII) added sub-pattern G (fadder correctly named and numbered, but attached to the wrong surname), first instance, not queued. |
