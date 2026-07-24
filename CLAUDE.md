# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This **is** the `intent-driven-plugin` repo — a public, credential-free Claude Code plugin. v0.1.0
is scaffolded: manifests, the `/intent-driven-plugin:intent-check` command, and the
`repository-intent-analysis` skill all exist. There is no build/lint/test tooling because the
plugin is plain markdown + JSON — validate it with `./scripts/validate-plugin.sh` (or
`claude plugin validate .`), and see [tests/structure-validation.md](tests/structure-validation.md)
for the manual checklist.

## Structure

- `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` — plugin and marketplace
  manifests. This repo is its own marketplace (`source: "./"`).
- `commands/intent-check.md` — the `/intent-driven-plugin:intent-check` command definition
  (read-only; `disallowed-tools: Write Edit NotebookEdit`).
- `skills/repository-intent-analysis/SKILL.md` — reusable evaluation guidance the command applies.
- `examples/sample-intent-readiness-report.md` — illustrative full report output.
- `docs/` — INSTALLATION, USAGE, DEVELOPMENT, WEBSITE-INTEGRATION, and the architecture diagram.
- `scripts/validate-plugin.{sh,ps1}` — structure/JSON validation.
- `tests/structure-validation.md` — manual pre-release checklist.
- `INTENT.md` / `intents/` — the original build spec that this plugin was scaffolded from, kept for
  reference (`intents/README.md` indexes the split files).

## Constraints to preserve when changing this plugin

- No API keys, cloud accounts, tokens, databases, network calls, or MCP servers — ever.
- `intent-check` stays read-only by default; it must not create/edit/delete repository files
  unless the user explicitly asks, in a separate request, after reviewing the report.
- Only use `plugin.json` / `marketplace.json` fields supported by the current official Claude Code
  plugin/marketplace spec — do not invent fields.
- Keep v0.1.x minimal: one command, one skill, no framework-building.
