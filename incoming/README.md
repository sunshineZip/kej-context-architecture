# Incoming

Version 1.0 | 2026-08-06 | Production

---

## Document Purpose

Landing zone for raw, unprocessed files (from KEJ or elsewhere) that haven't been triaged yet. Solves a real, recurring problem: pulling a large file from an external source (e.g. Google Drive) through an AI tool connector hits that connector's own size caps and this environment's network policy — pushing a file directly into this folder via a normal git commit sidesteps both, since it's just an ordinary file in the repo.

---

## How To Use This Folder

**Adding a file:** drop it in, using its original filename, no pre-sorting required. Either push it directly with git, or use GitHub's web "Add file → Upload files" on this repo. No size limit here beyond GitHub's own (~100 MB per file without Git LFS; ask if a future file is bigger than that).

**Triage (a subsequent working session, not the upload step):** for each file found here —
1. Check it against `projects/archive-digitization/context/intake-manifest.md` and update that item's status.
2. Decide its permanent home per the existing rules: `library/deep-wells/` if it clears the cornerstone bar (`knowledge/domains/authoring-guidelines.md` §9.2-9.3, human confirmation required for physical storage), `knowledge/domains/[name]/sources/` if it's a small evidentiary source and that domain exists, or stays registry-only (`library/reference-index.md`, `Stored: no`) if neither applies yet.
3. Move the file to that home and remove it from `incoming/` — this folder is a waiting room, not permanent storage. A file that has been triaged and given a real home should not still be sitting here.

**What does not belong here:** anything already triaged (goes to its real home per above), and transient handoff scratch material (`temp/` is for that — and is gitignored, unlike this folder).

---

## Currently Waiting

*Empty as of 2026-08-06 — nothing has been dropped here yet through this mechanism (the Boe-slægten manuscript arrived via Google Drive before this folder existed, and is already triaged into `library/deep-wells/`).*

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation, in response to the Google Drive connector's 10 MB download cap plus this environment's network policy blocking direct Drive access — both made pulling large files through an AI tool connector unsustainable. This folder lets the human push files directly into the repo instead, bypassing both. |
