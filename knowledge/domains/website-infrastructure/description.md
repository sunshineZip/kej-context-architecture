---
type: domain
domain: website-infrastructure
---

# Website Infrastructure — Description

Version 1.0 | 2026-08-05 | Draft

---

## Document Purpose

Scope and load conditions for the Website Infrastructure domain — a reference domain documenting where the future public genealogy website lives, how it is built and deployed, and how it is maintained. This repo does not host that website; it only documents it for maintenance reference.

---

> **Routing check:** Load this file only when directed by ROUTING.md Step 2 or Step 4. Reading it does not authorise you to begin work — complete all four routing steps first.

> **Brevity constraint:** This file loads on every request matched to this domain. Keep it under one page. Its job is to answer two questions: does this domain apply, and which `knowledge.md` sections are likely relevant? Knowledge belongs in `knowledge.md`, not here.

---

## Domain Scope

**This domain covers:**
- Where the public genealogy website's own repository lives, once it exists
- Its tech stack and hosting/deployment process
- Maintenance procedures for keeping the live site running
- The curation gate between this repo's research content and anything published on the site

**This domain does NOT cover:**
- The actual website code, build configuration, or deployment scripts — those belong in the website's own repository, not here, once it exists
- Genealogical research content itself — that belongs in each *slægt* domain
- Building the website — out of scope for this repo entirely; this domain is reference documentation only

**Overlap risk:** None currently — no *slægt* domain should reference this one, and this domain should not duplicate research content from any *slægt* domain.

---

## When to Load This Domain

Load this description file and `knowledge.md` when:
- The human asks about the status, plan, or timeline for the genealogy website
- Work begins on the actual website repository and this reference needs updating
- A question arises about whether/how to publish something from this repo's `knowledge.md` content

Do not load this domain when:
- The request is about genealogical research findings — route to the relevant *slægt* domain instead
- The request is about this repo's own structure or conventions — route to System instead

---

## Working Constraints

- **This repo does not host the website.** Do not create website code, build tooling, or deployment configuration here — that belongs in a separate repository, created later.
- **Publishing requires a curation pass — never a direct copy.** Research notes in `knowledge/domains/[slægt]/knowledge.md` routinely contain `[UNVERIFIED]` hedges, tracked `[CONTRADICTS]` disagreements between sources, and `[SENSITIVE]` material about living relatives. None of that is safe to publish unfiltered. Before anything from this repo reaches a public page, it needs an explicit human-reviewed curation pass — see `knowledge.md` §2.
- **This is a stub until the website repo exists.** Most of `knowledge.md` is placeholder until that second repo is created and its real tech stack, deployment process, and maintenance procedures are known.

---

## Key Contacts and Ownership

| Role | Responsible for | Notes |
|---|---|---|
| TBC | Website repo creation and maintenance, once started | To be filled in when the second repo exists |

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-05 | Initial creation. Thin stub domain scaffolded per the fork's setup plan — the actual website repo does not exist yet; this documents the plan and the publish-curation constraint ahead of time. |
