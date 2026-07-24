# Usage

## Running the command

Open any repository in Claude Code and run:

```
/intent-driven-plugin:intent-check
```

Claude will read the repository (README files, `CLAUDE.md`, `INTENT.md`, package manifests, build
scripts, test configuration, CI/CD workflows, source directories, architecture docs, contribution
guidelines, and security docs where present — skipping generated/vendored directories) and produce
an **Intent Readiness Report**.

See [examples/sample-intent-readiness-report.md](../examples/sample-intent-readiness-report.md)
for a full sample report.

## What the report contains

- Executive Summary
- Repository Profile (purpose, stack, build/test/runtime, deployment model)
- Readiness Scorecard (Purpose, Architecture, Build, Testing, Intent, Claude Guidance, Delivery,
  Safety)
- What Is Already Strong
- Missing or Ambiguous Information
- Implementation Risks
- Recommended Next Actions
- Overall Rating: `Ready`, `Mostly Ready`, `Needs Preparation`, or `Not Ready`
- Suggested First Intent (objective, value, scope, out of scope, acceptance criteria, validation
  commands, risks/assumptions)

## Read-only by default

`intent-check` never modifies repository files. If you want to act on one of its recommendations
— for example, the "Suggested First Intent" — ask Claude explicitly in a follow-up message. The
command itself only analyzes and reports.

## No credentials required

The command relies entirely on Claude Code's existing repository-reading and analysis
capabilities. It makes no network calls and needs no API keys, tokens, cloud accounts, or MCP
servers.
