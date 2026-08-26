# Domain Index

Version 1.5 | 2026-08-25 | Production

---

## Document Purpose

Registry of all knowledge domains in this context architecture. Add one entry per domain. The routing table in ROUTING.md Step 2 should have a corresponding row for each domain listed here.

> **Edit guard:** Adding or removing domains is system-layer work. Route to `projects/system/` and record the change in `session-log.md` before editing.

---

## Registered Domains

> Update `Last Updated` whenever a domain's `description.md` or `knowledge.md` changes materially. Update `References` whenever a `> **See also:**` cross-reference (authoring-guidelines.md §5) is added or removed — and check whether the referenced domain's row should list this one back. A reference that only points one way is a common source of silent drift as the domain family grows. Update `Status` when a domain is retired or reactivated — see § Retiring a Domain below; `scripts/validate.ps1` checks it stays consistent with the domain's own files.

| Domain | Folder | Status | Covers | Last Updated | References |
|---|---|---|---|---|---|
| Website Infrastructure | `knowledge/domains/website-infrastructure/` | Active | Reference domain for the future public genealogy website — repo location, tech stack, deployment, maintenance. Stub pending the second repo's creation. | 2026-08-25 | None |
| Boe-slægten | `knowledge/domains/boe-slaegten/` | Active | The Mors/Fur family line descending from Peder Christensen Boe (b. c.1731) — the family Hanne Boe (KEJ's late ex-wife) belonged to, and the source of Nikolaj's own surname. | 2026-08-09 | Hopp-slægten (Bruno Dølby marrying into this family, 2000) |
| Hopp-slægten | `knowledge/domains/hopp-slaegten/` | Active | KEJ's own line, descending from Knud Danielsen Hopp (b. c.1640) — the confirmed root of this project's direct-line research, with an unconfirmed gap between generation 06 and KEJ himself. | 2026-08-09 | Boe-slægten (same Bruno Dølby link) |

*Svend Åge Pedersen's seven slægter, Dølby-slægten, Inges Slægt, and other named lines from KEJ's original manifest (`projects/archive-digitization/context/intake-manifest.md` §4-6) will be added here once their source material actually arrives — not guessed upfront.*

---

## Cross-Domain Query Recipes

Named combinations of domains for recurring tasks that don't map to a single domain — e.g. a task that always needs two specific domains loaded together, in a specific order. Add an entry the second time a combination recurs; a one-off combination doesn't need one. Without this, the knowledge of which domains answer a cross-cutting question exists only as in-session judgement, and has to be re-derived every time.

| Task | Domains to load | Notes |
|---|---|---|
| *(e.g. "trace a request end-to-end")* | *(e.g. Domain A §2 + Domain B §1)* | *(load order, overlap, or anything non-obvious about the combination)* |

> **Expected for this fork:** intermarriage and shared-descendant queries across two or more *slægt* domains will likely become a recurring recipe once multiple *slægt* domains exist. Add the entry the second time such a query actually recurs, per the rule above — not before.

---

## Adding a Domain

1. Create `knowledge/domains/[domain-name]/description.md` — scope, constraints, when to load.
2. Create `knowledge/domains/[domain-name]/knowledge.md` — reference material with Index and Executive Summary.
3. Add a row to this index, with today's date under `Last Updated` and any cross-referenced domains under `References`.
4. Add a routing row in ROUTING.md Step 2.
5. Follow `knowledge/domains/authoring-guidelines.md` for content standards.
6. If this domain cross-references another (authoring-guidelines.md §5), check whether the referenced domain's row should reference this one back.

---

## Retiring a Domain

Use when a domain has become permanently irrelevant — not simply quiet or slow-moving. Confirm with the human first; retiring is a structural, human-gated decision, same as adding a domain.

1. Set the Status field in both `description.md` and `knowledge.md` headers (`MarkdownConventions.md` §1) to `Retired`, bump each file's version, and add the retirement blockquote with today's date and a one-line reason.
2. Update this domain's row above: `Status` → `Retired`.
3. Do not remove the domain's folder or files, and do not remove `> See also:` cross-references from other domains that still point to it — a retired domain remains a valid historical reference.
4. Record the retirement in `projects/system/session-log.md` as a structural change (`ROUTING.md` Hard Constraints).
5. No `ROUTING.md` edit is needed — Step 4 already skips domains marked `Retired` in this index by default.

Reactivating a retired domain reverses steps 1–2 and is logged the same way.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-06-29 | Initial creation. Placeholder example domain registered. |
| 1.1 | 2026-07-15 | Added `Last Updated` and `References` columns to the registry and a Cross-Domain Query Recipes section — addresses discovery staleness, asymmetric cross-references, and cross-cutting queries with no fixed home. |
| 1.2 | 2026-07-25 | Added a `Status` column (Active/Retired) to the registry and a "Retiring a Domain" procedure — archive-in-place, not delete, per `MarkdownConventions.md` §1. `scripts/validate.ps1` now checks this column stays consistent with each domain's own header Status. |
| 1.3 | 2026-08-05 | Forked from `proto-context-architecture` (upstream commit `86d4eddb6211b623a0e5a9ea047528076533ea8a`). Removed the placeholder Example Domain row; registered `website-infrastructure` as the first real domain (a thin reference stub); noted that *slægt* domains are deliberately not created yet — see the inventory-first setup sequence in `README.md` and `ROUTING.md`. Added an expected future Cross-Domain Query Recipe note for intermarriage/shared-descendant queries across *slægt* domains. |
| 1.4 | 2026-08-09 | Phase 3: registered the first two real *slægt* domains, `boe-slaegten` and `hopp-slaegten`, promoted from fully-read manuscript chapters previously living only as working extraction notes. Both reference each other (Bruno Dølby marrying into the Boe line in 2000, from Hopp-slægten). |
| 1.5 | 2026-08-25 | `website-infrastructure`'s Last Updated column corrected to 2026-08-25, matching its own header — a structural (Index-entry-only) fix made to `knowledge.md` as a byproduct of the upstream sync, surfaced by `validate.ps1`'s new Last-Updated staleness check. |
