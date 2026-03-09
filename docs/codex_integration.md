# Plugging this into Codex

## What Codex is supposed to do here

Codex should behave like a bounded research engineer, not a chaotic general editor.

Its job is to:
1. understand the research target,
2. identify the files it is allowed to change,
3. establish a baseline,
4. run one experiment at a time,
5. log all outcomes,
6. preserve only improvements.

## Recommended setup

Put this framework **inside or next to** the actual training repo you want Codex to work on.
Then adapt:

- `configs/research_targets.example.yaml`
- `programs/codex_research_program.md`
- `scripts/run_experiment.sh`

The actual trainer can be anything:
- PyTorch
- MLX
- JAX
- inference benchmarks
- eval pipelines

## How to invoke Codex

Run Codex in the project root and tell it something like:

```text
Read docs/codex_integration.md and programs/codex_research_program.md.
Then inspect configs/research_targets.example.yaml.
Set up a fresh research run, establish a baseline, and begin bounded experiments.
Only edit files that are explicitly in scope.
Log every run.
Keep only improvements.
```

## Good Codex operating rules

- one experiment per commit
- always baseline first
- never silently change the metric
- never silently widen scope
- always write a result row after each run
- prefer small readable diffs over giant rewrites
- revert weak ideas quickly

## If you want Codex to behave well

Give it all four of these:

1. **target metric**
   - what number should go up or down?
2. **hard constraints**
   - VRAM, time budget, hardware, dependencies, editable files
3. **run command**
   - exactly how to run one experiment
4. **logging format**
   - exactly where results go

Without those, Codex will wander.

## Minimal Codex mental model

Codex is not “doing science” in the abstract.
It is playing a repetitive optimization game:

- propose
- edit
- run
- measure
- keep/revert
- repeat

Make the game tight and it becomes useful.
