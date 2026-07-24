# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This **is** the `intent-driven-plugin` repo — a public Claude Code plugin, not yet scaffolded.
Right now it holds only the build spec (`INTENT.md`, `intents/`) and plan (`README.md`); the
plugin itself (`.claude-plugin/`, `commands/`, `skills/`, etc.) has not been created yet. There is
no build, lint, or test tooling to run until that scaffolding exists.

## Structure

- `README.md` — plan summary: what the plugin does, naming/version, target file tree, remaining build order, guiding constraints.
- `INTENT.md` — the full spec assembled into one file.
- `intents/` — the same spec, split into one file per logical concern. `intents/README.md` indexes them. Each file is self-contained enough to hand to Claude on its own when working on that specific piece.
- `docs/architecture-diagram.png` — boxes-and-arrows overview of the build phase (intents → INTENT.md → this repo → scaffolded plugin) and the use phase (marketplace → install → `/intent-check` → readiness report).

## The plugin to build

A credential-free Claude Code plugin (`intent-driven-plugin`, marketplace
`intent-driven-marketplace`, v0.1.0) that adds one command, `/intent-driven-plugin:intent-check`.
Run inside any repository, it produces an Intent Readiness Report (purpose, stack, build/test
signals, docs, CI/CD, security signals, gaps, and a `Ready`/`Mostly Ready`/`Needs Preparation`/`Not
Ready` rating) plus one recommended "first intent." It must require no API keys, tokens, cloud
accounts, databases, network calls, or MCP servers, and must be read-only unless the user
explicitly asks it to apply a recommendation afterward.

Target repository structure (see `intents/04-repository-structure.md` for the authoritative
version):

```
intent-driven-plugin/
├── .claude-plugin/{plugin.json,marketplace.json}
├── commands/intent-check.md
├── skills/repository-intent-analysis/SKILL.md
├── examples/sample-intent-readiness-report.md
├── docs/{architecture-diagram.png,INSTALLATION,USAGE,DEVELOPMENT,WEBSITE-INTEGRATION}.md
├── scripts/{validate-plugin.sh,validate-plugin.ps1}
├── tests/structure-validation.md
├── CHANGELOG.md, CONTRIBUTING.md, LICENSE, README.md, INTENT.md
```

## Constraints to preserve when scaffolding the plugin

- No invented plugin/marketplace manifest fields — only fields supported by the current official
  Claude Code plugin/marketplace spec.
- Keep v0.1.0 minimal: one command, one skill, no framework-building.
- Read-only by default; file modification requires explicit user request after report review.
