# intent-driven-plugin

A small, credential-free Claude Code plugin that evaluates whether a repository is ready for
intent-driven development.

**Status:** intent captured, scaffolding not yet started. This repo currently holds the build
spec (`INTENT.md`, `intents/`) and plan (this README); the plugin files themselves
(`.claude-plugin/`, `commands/`, `skills/`) are the next step. See the architecture diagram at
[docs/architecture-diagram.png](docs/architecture-diagram.png) for the build → use flow.

## What it will do

Once built, the plugin adds one command:

```
/intent-driven-plugin:intent-check
```

Run inside any repository, it produces an **Intent Readiness Report** —
purpose, stack, build/test signals, docs, CI/CD, security signals, gaps, and
an overall rating (`Ready` / `Mostly Ready` / `Needs Preparation` / `Not Ready`)
— plus one recommended "first intent" to attempt next. It is read-only by
default and requires no API keys, tokens, MCP servers, or network calls.

| Field | Value |
|---|---|
| Plugin name | `intent-driven-plugin` |
| Marketplace name | `intent-driven-marketplace` |
| Initial version | `0.1.0` |
| Repository | https://github.com/kendallmark3/intent-driven-plugin |
| Homepage | https://intent-driven-engineering.com |

## Target repository structure

```
intent-driven-plugin/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── commands/
│   └── intent-check.md
├── skills/
│   └── repository-intent-analysis/
│       └── SKILL.md
├── examples/
│   └── sample-intent-readiness-report.md
├── docs/
│   ├── architecture-diagram.png
│   ├── INSTALLATION.md
│   ├── USAGE.md
│   ├── DEVELOPMENT.md
│   └── WEBSITE-INTEGRATION.md
├── scripts/
│   ├── validate-plugin.sh
│   └── validate-plugin.ps1
├── tests/
│   └── structure-validation.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
├── README.md
└── INTENT.md
```

## Remaining build order

1. **Manifests** — write `plugin.json` and `marketplace.json` ([intents/05-plugin-manifest.md](intents/05-plugin-manifest.md), [intents/06-marketplace-manifest.md](intents/06-marketplace-manifest.md))
2. **Confirm scope** — re-check capability and UX requirements before writing the command ([intents/02-primary-capability.md](intents/02-primary-capability.md), [intents/03-user-experience.md](intents/03-user-experience.md))
3. **Command** — write `commands/intent-check.md` per the 5-step spec ([intents/07-command-intent-check.md](intents/07-command-intent-check.md))
4. **Skill** — write `skills/repository-intent-analysis/SKILL.md` ([intents/08-skill-repository-intent-analysis.md](intents/08-skill-repository-intent-analysis.md))
5. **Fill in the rest** — remaining `docs/`, `examples/`, `scripts/`, `tests/`, `CHANGELOG.md`, `CONTRIBUTING.md`, `LICENSE`

## Guiding constraints (apply throughout)

- No credentials, cloud accounts, tokens, databases, network calls, or MCP servers
- Read-only by default; only modifies files if the user explicitly asks after reviewing a report
- Only use plugin/marketplace manifest fields supported by the current official Claude Code spec — no invented fields
- Keep v0.1.0 small: one command, one skill, no framework-building

## Intent files

The build spec is split into logical files under [intents/](intents/); see
[intents/README.md](intents/README.md) for the full index. `INTENT.md` is the same spec assembled
into a single file.
