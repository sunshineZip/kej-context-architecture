# Possible Duplicates and Recurring Data-Quality Patterns

Version 1.1 | 2026-08-06 | Production

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

**Reassessment trigger:** generation "04" added zero new instances of sub-pattern A or B (still three each) — the pattern didn't recur this section, which is itself informative. Sub-pattern C opens with one instance (C1) and needs at least a second occurrence of the same shape before treating it as more than an isolated slip. If a fourth instance of sub-pattern A or B, or a second of sub-pattern C, appears during generation "05" or later reading, stop treating it as a probable tooling artifact — flag it to `grandfather-review/queue.md` instead, since a pattern this consistent stops being explainable as one-off extraction noise.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation. Backfilled the recurring data-quality anomaly log (§2) with the six instances already found and reasoned about across `boe-slaegten-chapter1-extraction.md`'s Open Items and Version History rows during Chapter 1's read-through of generations "02"-"03" — previously scattered prose, not centrally counted. §1 (possible duplicate individuals) opened with no entries yet. Human confirmed building this file now rather than leaving the two-tier duplicate-tracking system half-built. |
| 1.1 | 2026-08-06 | Generation "04" added no new instances of sub-patterns A/B (still three each — noted explicitly, since a pattern that stops recurring is itself worth recording). Added sub-pattern C (name/patronymic order inversion), a new shape not seen in generations "02"/"03," with its first instance. |
