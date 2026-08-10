# Research Queue — By External Source

Version 1.1 | 2026-08-09 | Active

---

## Document Purpose

Open genealogical questions, grouped by **which external resource would most efficiently resolve them** — a paid subscription site, a physical archive visit, a specific institution's paid record request — rather than by family line or project. The point is batching cost and effort: subscribe to MyHeritage once, when enough questions have piled up to be worth answering in one sitting, rather than paying per lookup; make one trip to a Dutch archive once enough Hopp-slægten gaps genuinely need it, rather than several partial trips.

This is deliberately separate from `grandfather-review/queue.md` (questions only KEJ himself can answer) and `family-tree/possible-duplicates.md` (routine same-name ambiguity, resolved by evidence already in hand). A question belongs here when the answer plausibly exists, but reaching it costs money, travel, or both — so it's worth stockpiling rather than acting on immediately.

**How to use this file:** add a question under the relevant source as it comes up, with enough context (name, `tree.ged` ID, what's already known, what specifically is being asked) that acting on it later doesn't require re-deriving the context. When a source's pile feels big enough to justify the cost, spend it — work through every open question for that source in one sitting, move resolved ones into `tree.ged`/`grandfather-review/` as appropriate, and mark them done here.

---

## Sources

### MyHeritage (subscription required)

**Status:** Not subscribed. 1 open question.

- [ ] **Jens Christian Christensen** (`family-tree/tree.ged#I29`), b. 22 Sep 1872 in Fur — emigrated to America c.1890 after an advance inheritance from his father; family lost contact after 5-6 years; excluded from the 1904/05 "Boe" name grant as a result; descendants unknown. A MyHeritage SuperSearch ([search URL](https://www.myheritage.dk/research?action=query&formId=master&formMode=1&qname=Name+fn.Jens%2F3Christian+fnmo.2+fnmsvos.1+fnmsmi.1+ln.Christensen+lnmo.4+lnmsdm.1+lnmsmf3.1+lnmsrs.1&qevents-birth0=Event+et.birth+ey.1872+epmo.similar&qevents-any1=Event+et.any+ep.+epmo.similar&qevents=List&useTranslation=1&exactSearch=0), found by Nikolaj 2026-08-07) returned several candidate hits, but every record's actual value (names, dates, places) is paywalled — only collection names and field labels are visible without a subscription. What's visible from the free preview:
  - Several "FamilySearch Family Tree" and "Filae slægtstræer" (Filae family trees) entries with blurred Fødsel (birth)/Hustru (spouse)/Død (death) fields.
  - Multiple "1930 Danmark Folketælling" (1930 Danish census) hits — worth checking, though odd on its face if our Jens Christian truly emigrated permanently c.1890 (would he have returned? a different Jens Christian entirely? not resolvable without the subscription).
  - One partially-visible newspaper snippet, from "Navne og historier i aviser fra OldNews.com (Californien, Hawaii, Alaska, Puerto Rico, De Amerikanske Jomfruøer)": *"SANTA MONICA, Sept. 1 — Jens Christian Christensen, a seaman on the..."* — cut off, rest paywalled. **Caution:** "Jens Christian Christensen" is an extremely common Danish name combination (see the false-positive FamilySearch match already ruled out for this same person, 2026-08-06 — a different man entirely, born 1836 not 1872). A seaman docking in Santa Monica doesn't obviously fit a Fur farmer's son, but isn't ruled out either. Needs the actual record, not just the name match, before treating as a lead.
  - Full search-results HTML page as received is not stored here (mostly paywall chrome, near-zero extractable content beyond what's summarized above) — the search URL above reproduces the same query if re-run after subscribing.

### Nederlandse archieven (Hopp-slægten, Dutch records)

**Status:** 1 open question, not yet acted on.

- [ ] **Daniel Madsen Hopp's birth year** (candidate for `family-tree/tree.ged#I364`'s presumed father, not yet in `tree.ged`) — one external secondary source gives 1633, which is impossible given his claimed son Knud Danielsen Hopp's birth ~1640; a *different* external source's own summary chart silently corrects this to "omk 1620" without citing anything. Full analysis: `projects/archive-digitization/context/hopp-slaegten-pre-1640-hypothesis.md`, Hypothesis A. If Daniel really was born before the family's move from Holland to Skagen (c. 1625), the relevant records would be Dutch, not Danish — but neither source pins down which Dutch town the family lived in before emigrating, so this can't be acted on yet. Revisit once/if that's narrowed down (possibly something KEJ already knows — see `grandfather-review/queue.md` item 2).

### Danske kirkebøger — Vendsyssel/Skagen/Aalborg (Hopp-slægten, pre-1640)

**Status:** 2 open questions, not yet acted on. Unlike the other sources in this file, these are likely *free* via Rigsarkivet's Arkivalieronline (digitized Danish church books) rather than needing a paid subscription — logged here anyway because they need dedicated archive-search time and, for this period, Gothic/Kurrent handwriting the family hasn't yet settled a transcription approach for (`projects/archive-digitization/TODO.md`'s open item on this).

- [ ] **Knud Danielsen Hopp's own baptism**, ~1640, presumed Aalborg area per `external-source-hopp-herredsfoged.md` (itself uncorroborated) — the single most decisive record for the pre-1640 hypotheses, since a baptism entry from this period typically names the father directly. Would settle whether "Daniel" is real without needing his own birth year resolved at all.
- [ ] **Daniel Madsen Hopp's baptism**, if he was born *after* the family's arrival in Skagen c. 1625 rather than before it (the Dutch-records alternative above) — Skagen or wider Vendsyssel kirkebøger, 1620s-30s.

---

## Version History

| Version | Date | Summary |
|---|---|---|
| 1.0 | 2026-08-07 | Initial creation, prompted by Nikolaj finding a paywalled MyHeritage lead on Jens Christian Christensen (the American emigrant, `I29`) and proposing a general mechanism for batching cost/effort against external resources rather than paying or traveling repeatedly. Seeded with the MyHeritage lead and an empty placeholder for the anticipated future Dutch-archive Hopp-slægten case. |
| 1.1 | 2026-08-09 | The anticipated Dutch-archive placeholder became a real question: Daniel Madsen Hopp's disputed birth year (`projects/archive-digitization/context/hopp-slaegten-pre-1640-hypothesis.md`, Hypothesis A). Added a new section for Danish kirkebog candidates (Knud Danielsen Hopp's own baptism, and Daniel Madsen Hopp's if born in Denmark rather than Holland) — flagged as likely free via Arkivalieronline rather than paywalled, but logged here anyway since they need dedicated search time and a not-yet-settled approach to this period's handwriting. |
