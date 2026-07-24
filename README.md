# intent-driven-plugin

A small, credential-free Claude Code plugin that evaluates whether a repository is ready for
intent-driven development. It installs directly from this public GitHub repository — no external
credentials required.

## Install

```
/plugin marketplace add kendallmark3/intent-driven-plugin
/plugin install intent-driven-plugin@intent-driven-marketplace
```

See [docs/INSTALLATION.md](docs/INSTALLATION.md) for details.

## Usage

Inside any repository:

```
/intent-driven-plugin:intent-check
```

produces an **Intent Readiness Report** — purpose, stack, build/test signals, docs, CI/CD,
security signals, gaps, and an overall rating (`Ready` / `Mostly Ready` / `Needs Preparation` /
`Not Ready`) — plus one recommended "first intent" to attempt next. It is read-only by default and
requires no API keys, tokens, MCP servers, or network calls.

See [docs/USAGE.md](docs/USAGE.md) and the full
[sample report](examples/sample-intent-readiness-report.md). Architecture overview:
[docs/architecture-diagram.png](docs/architecture-diagram.png).

| Field | Value |
|---|---|
| Plugin name | `intent-driven-plugin` |
| Marketplace name | `intent-driven-marketplace` |
| Version | `0.1.0` |
| Repository | https://github.com/kendallmark3/intent-driven-plugin |
| Homepage | https://intent-driven-engineering.com |

## Repository structure

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

## Developing

See [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) for the local dev/test loop and
[CONTRIBUTING.md](CONTRIBUTING.md) for the ground rules (credential-free, read-only by default,
keep it small).

## Guiding constraints

- No credentials, cloud accounts, tokens, databases, network calls, or MCP servers
- Read-only by default; only modifies files if the user explicitly asks after reviewing a report
- Only use plugin/marketplace manifest fields supported by the current official Claude Code spec — no invented fields
- Keep v0.1.0 small: one command, one skill, no framework-building

## Intent files

This plugin was scaffolded from a written intent, split into logical files under
[intents/](intents/) (index: [intents/README.md](intents/README.md)); `INTENT.md` is the same spec
assembled into a single file. Kept for reference and for anyone extending the plugin the same way.
