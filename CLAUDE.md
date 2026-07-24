# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This is **not** the plugin codebase itself — it is the planning/intent workspace for building
`intent-driven-plugin`, a public Claude Code plugin that will live in a separate repository:
https://github.com/kendallmark3/intent-driven-plugin

There is no build, lint, or test tooling here; this directory contains only markdown intent
documents. The actual scaffolding, manifests, command, and skill described here are meant to be
created inside the cloned target repo (see `intents/00-repo-setup.md`), not in this directory.

## Structure

- `README.md` — plan summary: what the plugin does, naming/version, target file tree, build order, guiding constraints.
- `intents/` — the full spec, split into one file per logical concern. `intents/README.md` indexes them and states the suggested build order. Read files in numeric order (`00` → `08`) to reconstruct the complete intent; each file is also self-contained enough to hand to Claude on its own when working on that specific piece.

## The plugin being planned

Target: a credential-free Claude Code plugin (`intent-driven-plugin`, marketplace
`intent-driven-marketplace`, v0.1.0) that adds one command, `/intent-driven-plugin:intent-check`.
Run inside any repository, it produces an Intent Readiness Report (purpose, stack, build/test
signals, docs, CI/CD, security signals, gaps, and a `Ready`/`Mostly Ready`/`Needs Preparation`/`Not
Ready` rating) plus one recommended "first intent." It must require no API keys, tokens, cloud
accounts, databases, network calls, or MCP servers, and must be read-only unless the user
explicitly asks it to apply a recommendation afterward.

Target repository structure for the plugin (see `intents/04-repository-structure.md` for the
authoritative version):

```
intent-driven-plugin/
├── .claude-plugin/{plugin.json,marketplace.json}
├── commands/intent-check.md
├── skills/repository-intent-analysis/SKILL.md
├── examples/sample-intent-readiness-report.md
├── docs/{INSTALLATION,USAGE,DEVELOPMENT,WEBSITE-INTEGRATION}.md
├── scripts/{validate-plugin.sh,validate-plugin.ps1}
├── tests/structure-validation.md
├── CHANGELOG.md, CONTRIBUTING.md, LICENSE, README.md, INTENT.md
```

## Constraints to preserve when editing intents or building the plugin

- No invented plugin/marketplace manifest fields — only fields supported by the current official
  Claude Code plugin/marketplace spec.
- Keep v0.1.0 minimal: one command, one skill, no framework-building.
- Read-only by default; file modification requires explicit user request after report review.
