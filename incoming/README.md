# Incoming — Moved

Version 2.0 | 2026-08-09 | Production

---

This folder moved to `restricted/incoming/` on 2026-08-09. Untriaged raw files — from KEJ or anywhere else — go there now, not here. See `Architecture.md` §3 ("Untriaged file intake") and `restricted/README.md` § Structure for the full reasoning: raw material needs an independent sensitivity check before anything is public, and that check can't happen before the file has even landed if it lands somewhere world-readable to anyone with main-repo access.

**Do not add files here.** If you're looking for the drop-off/triage procedure, it's at `restricted/incoming/README.md`.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-06 | Initial creation, in response to the Google Drive connector's 10 MB download cap plus this environment's network policy blocking direct Drive access — both made pulling large files through an AI tool connector unsustainable. This folder lets the human push files directly into the repo instead, bypassing both. |
| 1.1 | 2026-08-06 | First real use recorded: the Boe-slægten original `.docx` (46.1 MB), pushed via GitHub Desktop after GitHub's website upload UI turned out to have its own separate 25 MB cap — worth knowing that git/GitHub Desktop doesn't share that limit, only the website's drag-and-drop uploader does. Triaged out the same day. |
| 1.2 | 2026-08-08 | Clarified that removing a triaged file is part of finishing triage itself, not a deferred cleanup step, and that doing so immediately is not risky — git history keeps everything regardless. Cross-referenced the new `ROUTING.md` Standing Rule and `scripts/validate.ps1` non-empty-directory warning. |
| 2.0 | 2026-08-09 | **Folder moved to `restricted/incoming/`.** Prompted by two incidents in one working session: a personal home address surfaced incidentally in KEJ's own correspondence, and this session's own media-extraction work confirmed KEJ doesn't reliably recognize when an embedded photograph involves a living person — meaning the exposure risk was never really about the *document* type, it was about landing anywhere world-readable before this repo had assessed it. This file now just points to the new location; the working README lives at `restricted/incoming/README.md`. |
