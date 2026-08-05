---
type: domain
domain: website-infrastructure
---

# Website Infrastructure — Knowledge

Version 1.0 | 2026-08-05 | Draft

---

## Document Purpose

Reference knowledge for the future public genealogy website: where its repository lives, its tech stack and deployment process, and its maintenance procedures. Mostly a placeholder until that second repository exists — load the Index first, then only the sections relevant to the current task.

> **Routing check:** Load this file only when directed by ROUTING.md Step 4. If you have not completed all four Route steps, do that first.

> **Edit guide:** To append new knowledge to this file (e.g. once the website repo exists and its stack is known), raise a `[FLAG FOR KNOWLEDGE UPDATE]` in your current session turn and wait for human confirmation — no system project entry needed. To change this domain's scope, route to `projects/system/` instead.

---

## Index

1. [Executive Summary](#1-executive-summary) — current status, the one hard rule that already applies
2. [Publishing Curation Gate](#2-publishing-curation-gate) — why nothing from this repo goes to a public page unfiltered, and what the curation pass needs to check
3. [Website Repository](#3-website-repository) — where the site's code will live, once created (placeholder)
4. [Tech Stack and Deployment](#4-tech-stack-and-deployment) — placeholder, pending repo creation
5. [Maintenance Procedures](#5-maintenance-procedures) — placeholder, pending repo creation

---

## 1. Executive Summary

- The public website does not exist yet. Building it is explicitly out of scope for this repo (`kej-context-architecture`) — it will live in a separate repository, created later.
- This repo (the research knowledge base) is never the thing that gets published directly. Anything surfaced on the website is a curated subset — see §2.
- When the website repo is created, update §3–5 of this file with its real location, stack, and procedures via the normal `[FLAG FOR KNOWLEDGE UPDATE]` process.

---

## 2. Publishing Curation Gate

`knowledge/domains/[slægt]/knowledge.md` content is written for internal research use, not public consumption. Before anything from this repo is published on the website, a human-reviewed curation pass must check for:

| Check | Why |
|---|---|
| `[UNVERIFIED]` claims | Hypotheses, not confirmed facts — publishing them unlabeled misrepresents research confidence |
| `[CONTRADICTS: source]` entries | Tracked disagreements between sources — a public page needs a resolved statement or an explicit "disputed" framing, not a silent pick of one side |
| `[SENSITIVE]` material | Living-relative information (addresses, health, anything incidental) that surfaced during research but was never meant for public re-sharing |
| Behavioral/communication-style notes (`authoring-guidelines.md` §4) | Personal, not intended for public framing of any individual, living or deceased |

> **Note:** This check applies every time content moves from this repo to the website, not just once. Treat it as a standing gate, not a one-time migration step.

---

## 3. Website Repository

> Placeholder. Fill in once the website repository is created: name, URL, and a one-line description of what it hosts.

| Field | Value |
|---|---|
| Repository | TBC — not yet created |
| Owner | TBC |
| Status | Planned |

---

## 4. Tech Stack and Deployment

> Placeholder. Fill in once decided: static site generator or framework, hosting provider, build/deploy pipeline, domain/DNS.

---

## 5. Maintenance Procedures

> Placeholder. Fill in once the site exists: how content updates flow from this repo's curated output into the website repo, how often, and who does it.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-05 | Initial creation. Thin stub — only §1 (Executive Summary) and §2 (Publishing Curation Gate) have real content; §3–5 are placeholders pending the website repository's creation. |
