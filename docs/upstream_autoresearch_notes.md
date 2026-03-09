# Upstream notes: `karpathy/autoresearch`

Repo: https://github.com/karpathy/autoresearch

## Core concept

The upstream repo is a compact agentic research harness for small-scale LLM pretraining experiments.
An agent repeatedly edits training code, runs a fixed-duration experiment, reads the metric, and keeps or discards the change.

## Core pieces in the original repo

- `prepare.py`
  - data prep
  - tokenizer training
  - runtime utilities
  - intended to remain fixed
- `train.py`
  - the editable research surface
  - architecture, optimizer, and training loop changes happen here
- `program.md`
  - the human-authored instruction file for the agent
- `pyproject.toml`
  - dependencies

## Design strengths

- strong scope control
- fixed wall-clock experiment budget
- one metric for comparison
- simple enough for overnight iterative runs

## Design tradeoffs

- very opinionated around a specific training backend
- currently aimed at single NVIDIA GPU usage
- less immediately reusable as a generalized Codex research framework

## Why this derivative repo exists

This derivative repo keeps the spirit of the upstream idea but shifts emphasis toward:

- Codex integration
- reusable research policy
- backend portability
- cleaner handoff into custom model codebases
