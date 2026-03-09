# Amoeba Research Lab

A **concept fork** inspired by `karpathy/autoresearch`, but aimed at a broader, more controllable workflow for **Codex-driven Amoeba market testing and market research**.

This repo is **not** a 1:1 mirror of the upstream project.
It keeps the useful idea — agentic experimentation around a small, measurable training loop — but moves in a different direction:

- **Codex-first workflow**
- **backend-agnostic structure** (not hard-wired to one single upstream training file)
- **better experiment hygiene**
- **explicit research prompts + logging templates**
- **easier adaptation for local forks and custom model stacks**

---

## What this project is for

The core idea is simple:

1. give Codex a bounded research target,
2. define the metric and allowed files clearly,
3. let it run iterative experiments,
4. keep only changes that measurably improve the target.

Instead of treating the model code as the only “research surface”, this repo treats the whole research loop as programmable:

- prompts
- experiment policy
- result logging
- scope rules
- rollback criteria
- benchmark discipline

That makes it easier to adapt the setup to:

- Amoeba market testing workflows
- market research loops
- eval-heavy business experiments
- inference / agent optimization loops
- small decision-policy experiments
- dataset / prompt / tooling iterations

---

## Difference vs `karpathy/autoresearch`

Upstream `autoresearch` is deliberately minimal:
- one small training setup
- one main editable training file
- one `program.md`
- fixed 5-minute runs
- very tight scope

This repo moves in a different direction:

- **Codex integration docs are first-class**
- **prompts are modularized** instead of packed into one file
- **templates** exist for results, run tags, and experiment records
- **research policy** is separated from **training backend**
- the repo is meant to be adapted to **your own trainer**, not just one inherited one

Think of this as an **Amoeba research operating system skeleton** rather than a literal training repo.

---

## Repository layout

```text
README.md                         high-level overview
AUTORESEARCH_RUNDOWN.txt          plain-English explanation of the upstream idea

docs/codex_integration.md         how to plug the workflow into Codex
docs/upstream_autoresearch_notes.md  notes on what the original repo does

programs/codex_research_program.md   the main Codex research prompt/program

templates/results.tsv             experiment log template
configs/research_targets.example.yaml example target definition

scripts/new_run.sh                create a new dated run workspace
scripts/run_experiment.sh         wrapper stub for a single experiment run
```

---

## How to use this with Codex

Read:
- `docs/codex_integration.md`
- `programs/codex_research_program.md`

The short version:

1. put your actual training/eval code in this repo,
2. define your target metric and constraints,
3. start Codex in this repo,
4. point it at `programs/codex_research_program.md`,
5. let it run bounded experiments and log results in `templates/results.tsv`-style format.

---

## Philosophy

The important thing is not “an agent edits code.”
The important thing is that the research loop is:

- measurable
- bounded
- revertible
- logged
- easy to inspect afterward

That is the durable part worth keeping.

---

## Attribution

Inspired by `karpathy/autoresearch`:
https://github.com/karpathy/autoresearch

This repository is an original derivative concept repo, not a line-for-line copy.
