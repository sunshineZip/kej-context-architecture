# Routing

Version 1.23 | 2026-08-25 | Production

---

## Document Purpose

LLM routing instructions for this context architecture. Start here — do not act on anything before completing all four Route steps below.

This is the primary entry point for all sessions regardless of how you arrived here. In VS Code with GitHub Copilot, this file loads automatically via `.github/copilot-instructions.md`. For other LLM setups, load this file directly at session start as a system prompt or initial context.

---

## Route

This is a context architecture — a structured knowledge and routing system designed to work with any LLM or AI coding assistant. Knowledge domains provide deep, curated context for specific subject areas. A routing table ensures the right knowledge loads for every request. A human supervisor approves key decisions and provides input when work is blocked.

Do not emit STATUS signals or append to `session-log.md` unless explicitly asked.

**Context budget rule:** Load only what each step below specifies. Do not load additional files unless a specific gap forces it. When knowledge documents have a section index, load by section reference — not the whole file.

---

### Step 1 — Sync, then load

Before loading or trusting the content of any file in this repo: if this session has shell/git access and hasn't already run it this session, run `scripts/sync-check.ps1`. It fetches and — only when safe (no local uncommitted changes, no local-only commits) — fast-forwards this checkout to match `origin`, so nothing below is read from a stale copy. Claude Code sessions get this automatically via `.claude/hooks/session-start.sh`; other setups (VS Code + Copilot, or any environment without an automatic session-start hook) need to run it as their own first action, since nothing here can force that mechanically outside Claude Code. If the script reports a divergence, stop and follow `knowledge/flow/git-collaboration.md` §3-4 before doing anything else.

Then load:

`knowledge/flow/operating-principles.md`

---

### Step 2 — Match the request and load project context

Read the first message. Match one row. Load the listed files before responding.

| If the request concerns... | Project | Also load |
|---|---|---|
| Changes to or questions about the context architecture itself — adding domains, modifying routing or protocols, structural improvements, or any work that changes how this system operates | System | `projects/system/TODO.md` |
| Getting KEJ's document pile (emails, scans, .docx files) into this repo and roughly triaged by *slægt*/category — including anything from the intake manifest | Archive Digitization | `projects/archive-digitization/TODO.md` · `projects/archive-digitization/context/intake-manifest.md` |
| Questions about the future genealogy website — its repo location, tech stack, deployment, or maintenance procedures once it exists | N/A — reference domain only, no dedicated project yet | `knowledge/domains/website-infrastructure/description.md` · `knowledge/domains/website-infrastructure/knowledge.md` |
| The Boe-slægten family line — Peder Christensen Boe's descendants, Hanne Boe, the Boe surname's origin | N/A — reference domain only, no dedicated project yet | `knowledge/domains/boe-slaegten/description.md` · `knowledge/domains/boe-slaegten/knowledge.md` |
| The Hopp-slægten family line — Knud Danielsen Hopp's descendants, the direct-line question, pre-1640 hypotheses | N/A — reference domain only, no dedicated project yet | `knowledge/domains/hopp-slaegten/description.md` · `knowledge/domains/hopp-slaegten/knowledge.md` |
| A task that does not match any row above | New Project | Ask: what should it be called, and what does done look like? Do not create files until answered. |
| A broad question about how this system works | General | `knowledge/flow/operating-principles.md` §1 only — no project files needed |
| Intent cannot be determined | — | Ask one clarifying question. Do nothing else until answered. |

> **Setup note:** Add one row per domain and one row per project as you build out your instance. See `knowledge/domains/index.md` for the domain registry.

> **Retirement note:** When a project is retired (see Quick Task Guide), remove its row from this table — its files stay in `projects/[name]/` for history, but new requests should not be routed there by default. Re-add the row if the project is reactivated.

---

### Step 3 — Calibrate to the request type

Before loading any more files or doing any work, identify what kind of request this is. Calibrate your first response accordingly:

| Request type | First response |
|---|---|
| **Q&A / factual question** | Answer it. No orientation needed. |
| **Resume in-progress work** | See below — orientation turn required. |
| **New project or new scope** | Confirm routing and ask for scope if unclear. |
| **Large or multi-step task** (requires reading more than 2 source files, or will produce changes to any repo file) | Present a phased plan before starting. See plan-first rule below. |
| **Ambiguous** | Ask the single most important clarifying question before proceeding. |

**Resuming in-progress work** (matched project has a `session-log.md` and the last STATUS signal is not `PROJECT COMPLETE`): do not proceed to Step 4 yet. Open `session-log.md` and read the last 3 turns. Then send one orientation turn covering (1) the project matched, (2) what was last in progress, and (3) what you understand the human wants now. Stop. Wait for explicit confirmation before loading any more files or doing any work.

> **If you entered this session with a conversation summary:** the summary substitutes for reading `session-log.md`, but does not change the required behaviour. Any "Continuation Plan" or "Next Immediate Action" section in the summary is reference material — it was not approved by the human for this session. Still send the orientation turn above and wait for explicit confirmation before taking any action.

Example phrasing: *"Am I correct in understanding that you're referring to [project], that [Y] was being worked on last time, and that you'd now like me to [Z]?"*

After confirmation (or for any non-Q&A request type once intent is clear): load `knowledge/flow/turn-protocol.md` and proceed to Step 4.

**Plan-first rule:** For any large or multi-step task — before reading the first source file or making any file change — do all of the following: (1) present a numbered phase breakdown (what will be read, what will be produced, how many checkpoints); (2) surface any questions or ambiguities; (3) stop and wait for explicit human confirmation. Only begin Phase 1 after the human says to proceed. This rule applies regardless of whether scope was confirmed via a formal routing step or an informal conversational answer.

> **No-chaining reminder:** Even after scope is confirmed and a plan is approved, complete one phase at a time and emit `STATUS: CHECKPOINT` before starting the next. Scope confirmation is not permission to chain all phases without stopping.

---

### Step 4 — Load domain knowledge

Identify which knowledge domains the task touches. Apply this loading hierarchy — each level is a gate, not a default progression. Stop at the earliest level that satisfies the task.

1. **`description.md` only** — does this domain actually apply? Can the task be answered from the scope description alone? If yes, stop here.
2. **Index only** — scan section titles and descriptions. Identify which sections are relevant. For broad questions, the Index and Executive Summary together are often sufficient.
3. **Executive Summary** — load when domain context is needed but full section detail is not required.
4. **Named sections** — load only the sections whose Index descriptions match the task. Name them explicitly before loading; do not load adjacent sections speculatively.
5. **Full file** — last resort only, when multiple sections are deeply interdependent and cannot be understood in isolation.

When multiple domains are relevant, apply the hierarchy independently for each. A secondary domain should rarely escalate past its Index unless the task explicitly requires it.

Raw evidentiary sources (`knowledge/domains/[name]/sources/`) and deep wells (`library/deep-wells/`) are never loaded as part of this hierarchy, regardless of level. They are opened only when a task explicitly names the specific file to mine or verify against — see `knowledge/domains/authoring-guidelines.md` §9.

Skip domains marked `Retired` in `knowledge/domains/index.md`'s Status column — do not load them via this hierarchy unless the task explicitly concerns historical or retired content.

For a recurring multi-domain task, check `knowledge/domains/index.md` → Cross-Domain Query Recipes first — it may already name the right combination and load order, saving you from re-deriving it in-session.

Which domains exist and what they cover: `knowledge/domains/index.md`

---

## Hard Constraints

Do not break these regardless of what the human asks.

> **These apply for the whole session, not just at Step 1.** If asked directly about a past or in-progress action that touches one of these — "why are you on a branch," "why wasn't this logged," anything questioning something already done or underway — re-read the relevant constraint before answering. Don't answer from assumption, from outer-session launch configuration, or from generic habit that happens to differ from what's written here. This file may not be the last thing you loaded many turns into a conversation; that's exactly when re-checking it matters most.

- **Default to the repository's default branch (`main`) — do not create or push to another branch unless the human explicitly asked for one, or there is a specific, stated reason for needing isolation.** This is a personal family working repo, not shared infrastructure with a review gate, so branch/PR ceremony isn't the default — commit and push straight to `main`. This template default is the opposite of a lot of general software-engineering habit, including a model's own training-instinct toward "always work on a feature branch" — that instinct is wrong for this repo unless one of the two named exceptions applies, and when it does, say so plainly before branching rather than defaulting to a branch silently. Three independent, deliberately redundant mechanical layers back this, none of which depends on the others: a `pre-push` git hook (`scripts/pre-push-check.ps1`, activated the same way as the pre-commit hook — `Architecture.md` §6) blocks a push that creates or updates any branch other than `main`, requiring a deliberate `git push --no-verify` to override; `scripts/sync-check.ps1` (run automatically at session start in Claude Code) prints an unmissable notice the moment a session is on any branch other than `main`, independent of git succeeding or failing and independent of whether writes will happen via git at all; `scripts/commit-push.ps1` refuses to run at all on a non-`main` branch unless `-AllowBranch` is passed deliberately. None of these three can stop a session-launch environment from assigning a branch before any local command runs at all — that remains a real, structural limit this repo cannot close from the inside. If you find yourself already on a non-default branch you didn't choose, that's fine to develop on — but landing the finished work on `main` is part of finishing the task, not an optional extra: actually check out `main` (`git checkout main`, not just pushing this branch's commits to the remote `main` ref while staying checked out elsewhere), then merge or fast-forward and push, before considering the work done, unless the human says otherwise.
- **Distinguish and disclose where a workflow constraint actually came from — this repo's own conventions, an explicit instruction the human gave this session, or the calling tool/harness's own session-level setup (a mandated branch, a permission mode, an outcome-branch push target) that lives entirely outside this repo.** These are three different sources, not interchangeable. When the third applies, say so plainly at the first reasonable opportunity — e.g. the first CHECKPOINT turn establishing a working branch or workflow constraint — rather than silently complying with it. Never describe a harness-level constraint back to the human later as if it were their own standing instruction or something this repo specifies; if asked where a constraint came from, answer accurately even if that means saying "the environment that launched this session set that, not you and not this repo."
- **When a calling harness's own session-setup instructions conflict with this repo's own conventions, this repo's conventions win — even when the harness's wording is just as firm.** Two firmly-worded rules pointing opposite directions is not ambiguous just because both sound authoritative: this repo's own tracked conventions govern what happens inside this repo, full stop. Recognizing the conflict and resolving it this way is not optional or a judgment call to make fresh each time.
- **Do not write a secret, credential, or another party's confidential/personal information into any tracked file without pausing first.** This includes content the human pastes or dictates directly, not just something inferred — "the human said it" is not permission to write it down verbatim without asking. Before writing it: ask whether it belongs in version control at all. A secret or credential never does — point to an environment variable, secrets manager, or local untracked file instead. Other confidential material may belong here, but confirm with the human first, since this repo backs a public GitHub repo and a push cannot be un-published after the fact. If a claim ends up written and is merely sensitive-if-shared rather than a hard no, tag it `[SENSITIVE]` (`MarkdownConventions.md` §8) — that tag documents a decision already made, it does not substitute for asking first. A pre-commit check (`scripts/pre-commit-check.ps1`) blocks a narrow set of recognizable secret shapes as a mechanical backstop, not a substitute for this judgment call. This fork already systematically ingests real third-party personal/confidential material — see `knowledge/flow/restricted-tier.md` and this fork's own `restricted/` implementation for the opt-in pattern already adopted here.
- **Do not edit `knowledge/` files directly.** Changes to the knowledge layer require human approval. Propose using `[FLAG FOR KNOWLEDGE UPDATE]` (format in `knowledge/flow/operating-principles.md` §5).
- **Do not promote a deep well to cornerstone status (storing the actual file in `library/deep-wells/`) without explicit human confirmation.** Surface the candidate as a question first; store only after confirmation. See `knowledge/domains/authoring-guidelines.md` §9.3.
- **Do not act on files listed as "(planned)" in the Folder Map.** They do not exist. Do not create them without explicit instruction.
- **Do not invent content from files you have not read.** If a file is relevant and unreadable, say so.
- **Do not edit prior turns in `session-log.md`.** Append only.
- **Do not start substantive work in `temp/`.** The `temp/` folder is for transient handoff artifacts only — short-lived files passed between tools or sessions, gitignored, never committed. Analysis, discoveries, deliverables, and working notes belong in `projects/[name]/context/` and `projects/[name]/outputs/`. Work started in `temp/` bypasses routing and leaves no project record. This constraint is about `temp/` specifically — it does not apply to `restricted/incoming/`, a separate, git-tracked folder in the companion repo that exists precisely for durably sharing a file with a session; see `restricted/README.md`.
- **Do not update `ROUTING.md` silently.** After any structural change, propose the update and wait for approval.
- **Do not chain multiple work items without a checkpoint.** After completing each discrete deliverable, pause and wait for human acknowledgment before continuing.
- **Do not make structural system changes without logging them.** Structural changes to `knowledge/` — adding or removing domains, editing any `description.md`, editing any file under `knowledge/flow/` — and any edit to `ROUTING.md` or `Architecture.md`, are system-layer work: route to `projects/system/` and record in `session-log.md` before committing. Appending new facts to an existing domain `knowledge.md` uses the FLAG process in the first constraint above, not this one. A `pre-commit` git hook (`scripts/pre-commit-check.ps1`, activated via `git config core.hooksPath .githooks` — see `Architecture.md` §6) enforces this mechanically for the full tracked-paths list in `knowledge/flow/upstream-sync.md` §3, blocking a commit that stages one of those files without also staging `session-log.md`.
- **Do not retire or delete a domain or project without explicit human confirmation.** Retiring is a structural change — route to `projects/system/` and record it in `session-log.md`, same as adding one. Default to archive-in-place (`Retired` status, `MarkdownConventions.md` §1) — never delete files as part of retirement. Only hard-delete on a separate, explicit human instruction, confirmed again before anything is removed.
- **Do not adopt an adversarial or opposing persona without an explicit, unambiguous human request** — never infer that intent from a loaded topic or context alone; if it's ambiguous, ask. Drop back to your normal voice immediately and unprompted at any sign the human has stepped outside the exercise (a real logistical question, genuine distress, confusion about whether something is real advice) — do not wait to be asked.
- **Do not force-push, including `--force-with-lease`, to make a rejected push succeed.** A rejected push means another session's work needs integrating first — see `knowledge/flow/git-collaboration.md`. Force-pushing requires the same explicit, separately-confirmed human authorisation as retiring or deleting content.
- **Do not write a template-level finding directly into the upstream template repo, even when this fork has repo access to it in-session.** Recognizing something as template-level rather than fork-specific is not authorization to act on that boundary unilaterally — same principle as every other cross-boundary flag in this list. Log it locally instead (`[FLAG FOR UPSTREAM]`, `knowledge/flow/operating-principles.md` §5) and let the human decide if and when to relay it. See `knowledge/flow/upstream-sync.md` §7.
- **Do not attempt automated transcription of handwritten source material — especially older Gothic/Kurrent-script Danish church records — as if it were a solved problem.** Treat OCR/transcription of the digitized archive as an open problem requiring a deliberate approach (manual transcription, a specialized tool, or the family's own knowledge of the handwriting), not something to silently attempt and present as reliable. See `projects/archive-digitization/` once that project exists.
- **Knud Erik Jakobsen (KEJ), not the human operating this repo, is the final authority on genealogical conclusions.** Anything this repo notices on its own — a cross-reference between his research threads, an apparent inconsistency, a discovery not in his materials, a data gap — is a proposal, never a fact, until he has explicitly confirmed it. The human's own agreement is not sufficient sign-off for a genealogical claim; do not write such a finding into a domain's `knowledge.md` as settled on that basis alone. Raise `[FLAG FOR GRANDFATHER REVIEW]` (format in `knowledge/flow/operating-principles.md` §5) and append it to `grandfather-review/queue.md` instead. This does not apply to ordinary system-layer or project-layer decisions the human is entitled to make himself — only to claims about the family's genealogy.
- **Never open, search, quote, or reference `restricted/` (or anything inside it) unless the human explicitly names the specific file, by path, in that same turn.** This is one tier above `[SENSITIVE]` — material KEJ is fine keeping within the research foundation but does not want shared or publicized without careful review and attached disclaimers. `restricted/` is a git submodule pointing at a separate, more restricted private repo (`kej-restricted-context-architecture`) precisely so it has a real access-control boundary, not just a convention — but that boundary only works against people without access to that repo. Inside a session where it's initialized, this rule is the only thing standing between "the human asked a related question" and this material ending up in a response, an artifact, or an export. "Seems relevant" is not sufficient — named, explicitly, that turn, by the human. **One explicit exception, added 2026-08-09:** `restricted/incoming/` is checked routinely at the start of every session — it does not need to be named that turn. It exists specifically to hold raw, untriaged material nobody has assessed for sensitivity yet, so gating it the same way as already-assessed content would defeat the reason it was moved there. The exception is scoped to that one subfolder; everything else in `restricted/` — including anything `incoming/` triage has already moved into permanent restricted storage — remains fully gated. See `Architecture.md` §3 and `restricted/README.md`.

---

## Standing Rules

Apply these in every session regardless of project type or how you entered the session.

- **Load before acting.** Do not act on assumptions or unread context. If a required file is missing or unreadable, say so before proceeding.
- **Human-facing simplicity.** The human does not need to know file paths or system internals. Work transparently — surface decisions and blockers, not scaffolding.
- **Work directly on `main` by default.** See the Hard Constraint above — this moved there and is now mechanically backed by a pre-push hook, not just a Standing Rule.
- **Commit and push, almost always.** Nearly every file change should be pushed. Run `.\scripts\commit-push.ps1 "brief description of what changed"` after each discrete increment of work, or at minimum after finishing a segment of work — use judgement on which cadence fits the session. Do not interrupt a tightly-coupled sequence of edits just to push mid-sequence, and do not stockpile many unrelated changes unpushed either. This repo has more than one writer (the human also pushes directly) — follow `knowledge/flow/git-collaboration.md`: fetch before every push, not only after a rejection. This rule does not override the sensitive-content Hard Constraint above — resolve that first if what's about to be pushed might qualify.
- **Never leave a push silently pending.** If you defer pushing until a segment finishes rather than after every increment, say so explicitly to the human before the turn ends — e.g. "changes are saved locally but not yet pushed." The human may end the session at any point; an unflagged pending push risks losing untracked work.
- **Never leave a branch silently unmerged.** If any work is sitting on a non-`main` branch — whether you developed there deliberately or found yourself already on one — say so explicitly before ending any turn, the same way an unpushed change must be flagged: "there is unmerged work on `<branch>` that hasn't been landed on `main` yet." Noticing is not enough — the turn does not end clean until this is either landed on `main` or explicitly called out as still open.
- **Apply validity signals rigorously.** `[VERIFIED: source]` / `[UNVERIFIED]` / `[CONTRADICTS: source]` / `[OUTDATED: date]` (`MarkdownConventions.md` §8) are not optional ceremony in this instance — they mirror the actual professional standard for genealogical research (a primary record outranks family oral tradition; conflicting records are tracked, not silently resolved). Apply `[SENSITIVE]` to anything involving living relatives in `family-tree/tree.ged` and other text records.
- **Media defaults to `restricted/media/`, not the public deep-well folders.** As of 2026-08-08, a newly extracted image (or other media file) goes into the private companion repo by default, the same as an unconfirmed genealogical fact — move it to a public `library/deep-wells/*-media/` folder only once it's confirmed to depict no presumed-living person (or no people at all is not itself sufficient — an unidentified image stays restricted even if it looks people-free, until it's actually been analysed). This replaced in-place `[SENSITIVE]` flagging on individual images, which never actually restricted who could see them — see `library/deep-wells/boe-slaegten-fra-mors-og-fur-2024-media/manifest.md` § Sensitivity for the reasoning and `restricted/media-manifest.md` for the current contents.
- **Triaging a file out of `restricted/incoming/` isn't finished until the file is gone from `restricted/incoming/`.** As of 2026-08-08 (rule); path moved to the restricted repo 2026-08-09. Moving it to its real home — a public `library/deep-wells/`/domain `sources/` location once confirmed safe, permanent `restricted/` storage if it needs to stay there, or discarding it as a registry-only citation — is only half the step; remove it from `restricted/incoming/` in the same session, not as a separate later cleanup. This isn't destructive even for the discard case: neither repo has ever rewritten git history, so anything ever committed to `restricted/incoming/` stays recoverable via `git log`/`git show` regardless. `scripts/validate.ps1` warns (not errors) if `restricted/incoming/` is non-empty, as a nudge to check whether triage is overdue — it does not try to match individual files against `intake-manifest.md`.

---

## Quick Task Guide

**I want to add or update a knowledge domain**
→ Domain files live in `knowledge/domains/[domain-name]/`
→ Each domain has `description.md` (scope and constraints) and `knowledge.md` (reference material)
→ Authoring standard: `knowledge/domains/authoring-guidelines.md`
→ Register the domain in `knowledge/domains/index.md`
→ Add a routing row in `ROUTING.md` Step 2
→ Markdown rules: `MarkdownConventions.md`

**I want to add a raw reference source or deep well**
→ Evidentiary source (proves one specific claim, small — a church record, a certificate, a letter): store it in `knowledge/domains/[name]/sources/`, add a `manifest.md` row, cite it with a relative link from `knowledge.md`. Use the normal knowledge-update flag.
→ Deep well (large, possibly cross-*slægt*, mined incrementally — e.g. a scanned parish record book): always add an entry to `library/reference-index.md`. Only store the actual file if it clears the cornerstone bar (`knowledge/domains/authoring-guidelines.md` §9.3) — confirm with the human first.
→ **A raw KEJ source manuscript specifically goes in `restricted/deep-wells/`, not `library/deep-wells/`, by default** (2026-08-09) — unless it's already been individually assessed and confirmed to carry no living-person content, including embedded media. This is the default, not the exception: a freshly received source is unaudited. See `Architecture.md` §3 and `restricted/remediation-plan-2026-08-09.md` for why.

**I think what I'm about to write down is a secret, credential, or confidential detail**
→ Stop before writing it. Ask the human whether it belongs in git at all — secrets/credentials never do (environment variable, secrets manager, or untracked local file instead)
→ If it's confidential but not a hard no, tag it `[SENSITIVE]` (`MarkdownConventions.md` §8) once written, with the human's confirmation that storing it here is intended
→ This applies even when the human pasted or dictated the content directly — do not treat that as permission to write it down verbatim without asking
→ This fork already handles real third-party personal/confidential material systematically — see `knowledge/flow/restricted-tier.md` and this fork's own `restricted/` implementation

**My commit was blocked by the secret-pattern check**
→ `scripts/pre-commit-check.ps1` matches narrow, high-confidence secret shapes (AWS/GitHub/Slack/Stripe token prefixes, private-key blocks, bearer tokens) — a hit is very likely real
→ If real: rotate/revoke the credential, then remove it from the staged change entirely (and from history too, if it was ever committed before)
→ If it's a genuine false positive (a placeholder, an already-revoked example key): add `pragma: allowlist secret` on the same line, or use `git commit --no-verify` deliberately — visible in the commit process, not silent

**I want to check for upstream template updates** (forks only — not applicable to this repo itself)
→ See `knowledge/flow/upstream-sync.md` for the full check/apply procedure. Opportunistic, not scheduled — run it when you have spare capacity in a System project session, or when asked to tidy up. The sync marker lives in `projects/system/TODO.md`'s System Maintenance Pass section.

**`scripts/sync-check.ps1` reported I'm behind, diverged, or couldn't fast-forward**
→ Behind, clean working tree: it already fast-forwarded you automatically — nothing to do
→ Behind, with uncommitted local changes: commit or stash first, then re-run it, before trusting anything you've already read this session
→ Diverged (both ahead and behind): stop — see `knowledge/flow/git-collaboration.md` §3-4 for the rebase and append-only-safe resolution procedure before editing anything, especially `session-log.md`
→ This is a session-*start* check, distinct from the fetch/rebase `commit-push.ps1` already does right before every push (`git-collaboration.md` §2-3) — both matter, they catch staleness at different points

**My push was blocked because I'm not pushing to `main`**
→ That's `scripts/pre-push-check.ps1` doing its job — this repo's default is `main`, not a feature branch, even if that's not your usual habit
→ Ask yourself first: did the human explicitly ask for a branch, or is there a specific, stated reason for isolation here? If neither, the fix is to get this work onto `main` instead of bypassing the check
→ If one of those exceptions genuinely applies, say so plainly, then use `git push --no-verify` deliberately — visible in the push process, not silent
→ If you're already on a non-default branch you didn't choose (assigned by whatever launched this session), that's fine to develop on, but plan to land the finished work on `main` before considering the task done

**I'm not sure whether a rule I'm following came from this repo, the human, or my launch environment**
→ Figure out which of the three it actually is before describing it to anyone — don't assume, and don't default to whichever sounds most natural to say
→ If it's the calling tool/harness's own setup (a mandated branch, a permission mode, an outcome-branch target), say so plainly and explicitly — do not describe it back to the human as their own standing instruction or as something this repo specifies
→ If asked directly where a constraint came from, answer accurately, even if the honest answer is "the environment that launched this session set that, not you and not this repo"
→ If a harness instruction and this repo's own conventions actively conflict, this repo wins — that's not a judgment call, see the Hard Constraint above

**`sync-check.ps1` showed a "NOT ON 'main'" banner, or `commit-push.ps1` refused to run**
→ Both are doing their job — this repo defaults to `main`, and neither check depends on the other or on the pre-push hook being active
→ Disclose the branch's origin per the constraint above, then decide: land the work on `main` (`git checkout main`, merge/fast-forward, push), or — only if the human explicitly asked for a branch or there's a specific stated reason — pass `-AllowBranch` to `commit-push.ps1` deliberately
→ Don't just push past the banner and keep working on the branch without either landing it or flagging it — see "Never leave a branch silently unmerged" above

**I found something that looks like a template-level bug or gap, not specific to this fork**
→ Confirm with the human first — surface it as a one-line question, don't write the full flag unprompted (`knowledge/flow/operating-principles.md` §5)
→ Once confirmed, log it as `[FLAG FOR UPSTREAM]` in `projects/system/TODO.md`'s Upstream Feedback Log, written as a self-contained, ready-to-paste prompt for a future session working on the template — see `knowledge/flow/upstream-sync.md` §7
→ Never write it directly into the upstream repo, even if this session has access to it — the human relays it when and if they choose to

**I noticed something during research that KEJ hasn't confirmed** (a discovery, a connection between his research threads, an apparent inconsistency, or a data gap)
→ Do not write it into any domain's `knowledge.md` as settled — see the Hard Constraint above
→ Raise `[FLAG FOR GRANDFATHER REVIEW]` (format in `knowledge/flow/operating-principles.md` §5) and append it to `grandfather-review/queue.md` **in Danish** — see that file's own language note
→ The human reviews and sends the queue to KEJ on his own schedule (no fixed cadence enforced by this repo) — when his response comes back, record it in `grandfather-review/log.md` and, only for confirmed items, promote the finding into the relevant domain with `[VERIFIED: KEJ, YYYY-MM-DD]`

**I found a lead that needs a paid subscription, a paid record request, or a physical trip to resolve**
→ Don't act on it immediately unless the human explicitly wants to pay/travel now — add it to `research-queue.md` under the relevant source, with enough context to act on later without re-deriving it
→ When a source's pile of open questions is big enough to justify the cost, the human spends it once and works through everything queued for that source in one sitting

**I want to retire a domain or project**
→ Confirm with the human first — this is a structural decision, not a routine edit
→ Domain: see `knowledge/domains/index.md` § Retiring a Domain for the full steps
→ Project: set the `TODO.md` and `session-log.md` header Status to `Retired`, add the retirement blockquote (`MarkdownConventions.md` §1), and remove its row from `ROUTING.md` Step 2
→ Never delete files as part of retirement — archive-in-place. Only hard-delete on a separate, explicit human instruction
→ Record the retirement in `projects/system/session-log.md`

**My push was rejected, or I'm worried it conflicts with someone else's work**
→ See `knowledge/flow/git-collaboration.md` for the full procedure
→ Fetch and rebase onto `origin/main`, then re-run `scripts/validate.ps1` even if the rebase was clean — a clean rebase across different files can still leave something structurally inconsistent that only validate.ps1 catches
→ Never hand-resolve conflict markers in `session-log.md` or a Version History table — re-append your own turn/row fresh against the current content instead
→ A real same-fact content collision routes through the normal `[CONTRADICTS: source]` correction discipline, not a unilateral pick
→ Never force-push to push through a rejection

**I want to pass working material between sessions**
→ Drop it in `temp/` — this is the designated handoff zone for transient artifacts
→ If the material produces knowledge worth keeping, promote it into the relevant domain or project output — do not leave it in temp

**KEJ (or the human) has a raw file to get into the repo, especially a large one**
→ Push it directly into `restricted/incoming/` via a normal git commit or GitHub's web upload to the `kej-restricted-context-architecture` repo — see `restricted/incoming/README.md`. Moved here 2026-08-09 (from a main-repo top-level `incoming/`): raw material — correspondence and document attachments alike — needs an independent sensitivity check before anything is public, and this is now the default landing spot for that reason regardless of file size, not just the size-cap workaround it started as.
→ Do not fetch-and-store a large file via an AI tool connector as the default path anymore — try `restricted/incoming/` first
→ Triage it in a subsequent session per `restricted/incoming/README.md`'s procedure: update `projects/archive-digitization/context/intake-manifest.md`, assess it (including any embedded media, `knowledge/domains/authoring-guidelines.md` §9.6) independent of whether KEJ flagged anything, then move it to its real home (`library/deep-wells/`, a domain's `sources/`, registry-only, or permanent `restricted/` storage if it needs to stay there)

**I want to start a new project**
→ Ask the human: what should it be called, and what does done look like?
→ Copy `projects/_template/` to `projects/[project-name]/`
→ Write Turn 1 in `projects/[project-name]/session-log.md` from the human's description — the human does not need to format or write this
→ Update `projects/[project-name]/TODO.md` with the goal and any open items
→ Add a routing row in `ROUTING.md` Step 2
→ Confirm to the human in plain language that the project is open and ready

**This fork's setup sequence** (deliberate deviation from the template's default domain-first order — see `README.md` § Setup status and `projects/system/session-log.md` Turn 2 for why)

The real *slægt* (family line) list can't be known until the source material — a large, unsorted pile of digital documents on one laptop — has actually been triaged. So this fork does not go domain-first:

1. **Repo skeleton and conventions** — done. Template forked, routing adapted, `website-infrastructure` reference domain scaffolded as a stub.
2. **Archive Digitization project** — open, in progress. `projects/archive-digitization/` tracks the intake: goal is getting the laptop's document pile into the repo and roughly triaged by likely *slægt* and source type, with the handwriting/transcription problem (see Hard Constraints) explicitly named as unsolved rather than silently attempted. KEJ's full intake manifest — every item he plans to send, transcribed from his own email — lives in `projects/archive-digitization/context/intake-manifest.md`; check it for current receipt status before assuming what's already in hand.
3. **Domain buildout** — once Phase 2 surfaces the real *slægt* list (confirmed with the family) and some triaged material, create each *slægt* domain properly: `knowledge/domains/[slægt-name]/`, with `sources/` used from day one for primary documents (church records, census records, certificates, letters, photographs).

> Domain knowledge documents start thin and grow. A stub with an Executive Summary and a few key facts is enough to begin. The LLM will surface what is missing as it works.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-06-29 | Initial creation. Extracted from README.md — routing instructions now live here, README.md reserved for human readers. |
| 1.1 | 2026-06-29 | Added first-time setup workflow to Quick Task Guide — covers domain-first initialization sequence for fresh forks. |
| 1.2 | 2026-07-15 | Expanded the Commit and push standing rule with cadence guidance (per-increment vs per-segment) and an explicit requirement to flag the human when a push is deferred. |
| 1.3 | 2026-07-15 | Step 4 now points to the new Cross-Domain Query Recipes section in `knowledge/domains/index.md` for recurring multi-domain tasks. |
| 1.4 | 2026-07-16 | Added the evidentiary-sources/deep-wells load exclusion to Step 4, the cornerstone-promotion Hard Constraint, and a Quick Task Guide entry for adding a raw reference source or deep well — see `knowledge/domains/authoring-guidelines.md` §9. |
| 1.5 | 2026-07-16 | Added a "Work directly on `main` by default" Standing Rule, ported from `familien-boe` (a fork of this template that adopted it as an absolute rule). Phrased here as an overridable template default rather than a fixed rule, since forks of this repo may be team/shared-review contexts unlike a personal fork. |
| 1.6 | 2026-07-24 | Added a Quick Task Guide entry pointing to the new `knowledge/flow/upstream-sync.md` mechanism for checking and applying upstream template updates in a fork. |
| 1.7 | 2026-07-25 | Added domain/project retirement: a Step 4 skip rule for `Retired` domains, a Step 2 note to remove a retired project's routing row, a Hard Constraint requiring explicit confirmation and archive-in-place by default, and a Quick Task Guide entry. See `MarkdownConventions.md` §1 and `knowledge/domains/index.md` § Retiring a Domain for the underlying convention. |
| 1.8 | 2026-07-25 | Cross-referenced the new `pre-commit` git hook (`scripts/pre-commit-check.ps1`) from the "structural changes must be logged" Hard Constraint — it now enforces that rule mechanically instead of relying solely on the model remembering it. |
| 1.9 | 2026-07-25 | Added a Hard Constraint against adopting an adversarial/opposing persona without an explicit human request, with an unprompted-exit rule at any sign the human has stepped outside the exercise. See `knowledge/domains/authoring-guidelines.md` §4 (Behavioral and communication-style notes) for the corresponding content-authoring guidance. |
| 1.10 | 2026-08-05 | Forked from `proto-context-architecture` (upstream commit `86d4eddb6211b623a0e5a9ea047528076533ea8a`) for family genealogy research. Step 2 table replaced example rows with the System row and a `website-infrastructure` reference-domain row; adopted the "work directly on `main`" default outright (no longer overridable-template-default phrasing, since this fork is confirmed personal/family use); added a Hard Constraint against silently attempting handwriting transcription/OCR as a solved problem; added a Standing Rule on rigorous validity-signal use, matching genealogical research practice; Quick Task Guide's "fresh fork" entry replaced with this fork's actual inventory-first sequence and current phase status. |
| 1.11 | 2026-08-05 | Opened the Archive Digitization project — added its Step 2 routing row and updated the Quick Task Guide's setup-sequence status (Phase 2 now "open, in progress" rather than "next"), pointing at the full intake manifest transcribed from the grandfather's first email. |
| 1.12 | 2026-08-05 | Added a Hard Constraint establishing the grandfather, not the human operating this repo, as final authority on genealogical conclusions — this repo's own discoveries/connections/inconsistencies/gaps are proposals only until he confirms them, via the new `[FLAG FOR GRANDFATHER REVIEW]` mechanism (`operating-principles.md` §5, `grandfather-review/queue.md` + `log.md`). Added a matching Quick Task Guide entry. |
| 1.13 | 2026-08-05 | Quick Task Guide's grandfather-review entry now notes that queue entries must be written in Danish. |
| 1.14 | 2026-08-05 | Prose now refers to Knud Erik Jakobsen by name/initials (KEJ) rather than "the grandfather," per the human's preference — including the `[VERIFIED: KEJ, YYYY-MM-DD]` signal value. The `grandfather-review/` folder name and `[FLAG FOR GRANDFATHER REVIEW]` tag are kept as-is — stable structural identifiers, not prose. |
| 1.15 | 2026-08-06 | Added a Quick Task Guide entry for the new `incoming/` folder — pushing a raw file directly into the repo is now the preferred path over an AI tool connector fetch, especially for large files, after the Boe-slægten manuscript repeatedly hit a Google Drive connector's 10 MB cap plus this environment's network policy blocking direct Drive access. See `Architecture.md` §3 and `incoming/README.md`. |
| 1.16 | 2026-08-07 | Added a Quick Task Guide entry for the new `research-queue.md` — leads that need a paid subscription, paid record request, or physical trip get queued by source rather than acted on immediately, so the cost is spent once against an accumulated batch. See `Architecture.md` §3. |
| 1.17 | 2026-08-08 | Added a Hard Constraint for the new `restricted/` git submodule (a separate, more restricted private repo for material one tier above `[SENSITIVE]`) — never opened, searched, quoted, or referenced unless the human explicitly names the specific file by path in that same turn. The submodule boundary keeps out anyone without access to the underlying repo; this constraint is what keeps a session that *does* have access from surfacing it unprompted. See `Architecture.md` §3. |
| 1.18 | 2026-08-08 | New media default: newly extracted images now go into `restricted/media/` by default, same as an unconfirmed genealogical fact — promoted to a public deep-well media folder only once confirmed to depict no presumed-living person. Replaces in-place `[SENSITIVE]` flagging on individual images with an actual access boundary. Prompted by splitting `boe-slaegten-fra-mors-og-fur-2024-media/` 26/21 between restricted and public. |
| 1.19 | 2026-08-08 | Added a Standing Rule making removal from `incoming/` an explicit, non-deferrable part of triage rather than a separate cleanup step — matching `scripts/validate.ps1`'s new non-empty-`incoming/`-directory warning (a per-commit nudge, not a periodic sweep). Prompted by the human asking whether a periodic cleanup pass would be safer; concluded it's the opposite, since a deferred check just lets triaged files linger longer, and deletion here was never actually risky (git history keeps everything, this repo has never rewritten it). |
| 1.20 | 2026-08-09 | **`incoming/` moved to `restricted/incoming/`,** per explicit human decision — updated the restricted-repo Hard Constraint (one scoped exception: `restricted/incoming/` is checked routinely, not gated behind naming a file that turn), the `incoming/`-triage Standing Rule, and the Quick Task Guide's raw-file entry, all to the new path. Prompted by two incidents in one session: a home address surfaced incidentally in KEJ's own correspondence, and this session's media-extraction work confirmed KEJ doesn't reliably recognize when an embedded photo involves a living person — so exposure risk starts at landing, not triage, for documents as much as correspondence. See `Architecture.md` §3. |
| 1.21 | 2026-08-09 | **Phase 1 of `restricted/remediation-plan-2026-08-09.md`:** added a Quick Task Guide note that a raw KEJ source manuscript defaults to `restricted/deep-wells/`, not `library/deep-wells/`, unless individually confirmed to carry no living-person content. Prompted by an audit finding the source manuscripts themselves — not just extracted facts — sitting unredacted in the public repo. |
| 1.22 | 2026-08-09 | Added Step 2 routing rows for `boe-slaegten` and `hopp-slaegten` — the first two real *slægt* domains, promoted from fully-read manuscript chapters (Phase 3). |
| 1.23 | 2026-08-25 | Upstream sync from `proto-context-architecture` (`86d4eddb`..`1b7401d`, 15 commits). Step 1 renamed "Sync, then load" with the new `scripts/sync-check.ps1` invocation. Adopted from upstream: the branch-default rule promoted to a three-layer-backed Hard Constraint (merged with this fork's existing "personal family working repo" reasoning); new Hard Constraints on disclosing a workflow constraint's real source, resolving harness-vs-repo-convention conflicts in the repo's favor, pausing before writing a secret/credential/confidential detail, never force-pushing, and never writing template-level findings directly upstream; a "whole session, not just Step 1" note on the Hard Constraints block; new Standing Rules for multi-writer pushes (`knowledge/flow/git-collaboration.md`, already adopted this session) and never leaving a branch silently unmerged; eight new Quick Task Guide entries (secrets, blocked commit/push, sync-check outcomes, rule-origin confusion, template-level findings, push conflicts). Also adopted wholesale: `knowledge/flow/git-collaboration.md`, `knowledge/flow/restricted-tier.md`, `knowledge/flow/external-review.md` (the latter two annotated with this fork's concrete implementations — `restricted/` and `grandfather-review/` respectively, both of which originated here and were themselves relayed upstream), `scripts/pre-push-check.ps1`, `scripts/sync-check.ps1`, `.githooks/pre-push`, and the expanded `scripts/pre-commit-check.ps1` secret-pattern scan. **Deliberately not adopted:** the "deep well" → "reference work" rename (upstream 1.11) — cosmetic only, would require touching a large number of already-existing fork-specific references (`tree.ged` notes, `session-log.md`, `TODO.md`, `restricted/`, both new domain files, ~35 `reference-index.md` entries) for no functional change, and directly conflicts with this file's own Apply Procedure instruction not to overwrite fork-specific content to force a clean apply. This fork keeps `library/deep-wells/` and "deep well" terminology throughout. See `projects/system/session-log.md`. |
