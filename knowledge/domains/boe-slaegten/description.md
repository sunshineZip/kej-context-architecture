---
type: domain
domain: boe-slaegten
---

# Boe-slægten — Description

Version 1.0 | 2026-08-09 | Production

---

## Document Purpose

Scope and load conditions for the Boe-slægten domain — the family line from Mors and Fur carrying the surname Boe, descending from Peder Christensen Boe (b. c.1731, first known bearer of the name). This is the line KEJ's late ex-wife, Hanne Boe, belonged to — and, through her and KEJ's daughters, the line Nikolaj's own "Boe" surname comes from.

---

> **Routing check:** Load this file only when directed by ROUTING.md Step 2 or Step 4. Reading it does not authorise you to begin work — complete all four routing steps first.

> **Brevity constraint:** This file loads on every request matched to this domain. Keep it under one page. Its job is to answer two questions: does this domain apply, and which `knowledge.md` sections are likely relevant? Knowledge belongs in `knowledge.md`, not here.

---

## Domain Scope

**This domain covers:**
- Peder Christensen Boe (b. c.1731) and his confirmed descendants, down through Hanne Boe and her own descendants.
- The manuscript this domain is built from: "Boe-slægten fra Mors og Fur" (KEJ, maj 2026), all four chapters plus the Anetavler/Kilder appendices — fully read.
- The ancestor lines behind two in-marrying spouses (the Toft family, the Møller family), traced in the manuscript's Chapters 2-4.
- Comparative research into *other*, explicitly unconnected families also carrying the "Boe" surname elsewhere in Denmark (Nykøbing Mors, Ålborg, Himmerland/Thy, Sønderjylland, Fyn, Møn) — kept here as reference for the open surname-origin question, not modeled as part of the family tree.

**This domain does NOT cover:**
- The Hopp-slægten line — KEJ's own paternal-side research, a separate domain (`knowledge/domains/hopp-slaegten/`). The two lines meet only through marriage, at Bruno Dølby (m. Lotta Ann Boe, 2000) — see `knowledge.md` §5.
- Anything in `restricted/` — sensitive facts about presumed-living individuals, and the fuller account of Hanne Boe's paternity, are redacted here per the standing `[SENSITIVE]`/`Living` convention and KEJ's own explicit instruction. This domain never restates what's in `restricted/tree-sensitive.ged`; it points to it.

**Overlap risk:** Bruno Dølby (Hopp-slægten) marrying into this family in 2000 is the one genuine cross-domain point — a query about that specific couple or their children should load both domains. No other overlap currently exists.

---

## When to Load This Domain

Load this description file and `knowledge.md` when:
- The request concerns the Boe-slægten specifically — an individual, a branch, a date, an open question about the family.
- The request asks about the "Boe" surname's origin or its relationship to other Danish families carrying the name.
- The request touches Hanne Boe, her descendants, or (carefully — see Working Constraints) the family's connection to KEJ.

Do not load this domain when:
- The request is about the Hopp-slægten specifically — route there instead.
- The request needs only a single fact easily found directly in `family-tree/tree.ged` — loading this domain isn't necessary just to look up one ID.

---

## Working Constraints

- **`family-tree/tree.ged` is the authoritative structured record; this domain is synthesis, not a duplicate.** For a specific individual's full vitals, read `tree.ged` directly (IDs `@I1@`-`@I363@` for this line, roughly). This domain explains the shape of the family, notable history, and open questions — it does not restate every record.
- **Most of the last three generations are `[SENSITIVE]`/redacted.** `tree.ged` already handles this via `Living /Boe/` placeholders with a pointer to `restricted/tree-sensitive.ged`. This domain follows the same discipline — never name or date a presumed-living individual beyond what `tree.ged` itself already discloses.
- **KEJ is the final authority on genealogical conclusions**, per the standing `grandfather-review/` Hard Constraint (`ROUTING.md`). Several data-quality anomalies in the source manuscript are tracked, not silently resolved — see `knowledge.md` §8 and `grandfather-review/queue.md`.
- **GPS/Evidence Explained citation standard applies** (`authoring-guidelines.md` §9.5) — every claim in `knowledge.md` carries a `[VERIFIED: boe-slaegten-fra-mors-og-fur, p.N]`-style citation back to the source manuscript, or `[UNVERIFIED]` where the source itself is uncertain.

---

## Key Contacts and Ownership

| Role | Responsible for | Notes |
|---|---|---|
| Knud Erik Jakobsen (KEJ) | Original research and the source manuscript; final authority on genealogical conclusions | See `grandfather-review/queue.md` for open questions awaiting his review |

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-09 | Initial creation — Phase 3 domain promotion, migrating the fully-read "Boe-slægten fra Mors og Fur" manuscript (all four chapters, Anetavler, Kilder) from working extraction notes (`projects/archive-digitization/context/boe-slaegten-*-extraction.md`) into a real domain. |
