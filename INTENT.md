# INTENT.md

This is the assembled build intent for the intent-driven-plugin Claude Code plugin.
Source files (kept for reference/reuse) live in [intents/](intents/); see [intents/README.md](intents/README.md) for the index and suggested build order.

---

# Intent: Build the Intent-Driven Engineering Claude Code Plugin

## Mission

Create a small but useful public Claude Code plugin in this repository:

https://github.com/kendallmark3/intent-driven-plugin

The plugin must:

- Install directly from this public GitHub repository
- Require no external credentials
- Be usable from Claude Code while working inside any software repository, including https://intent-driven-engineering.com

The first version should be deliberately simple, understandable, testable, and deployable quickly.

## Naming and Versioning

| Field | Value |
|---|---|
| Plugin Name | `intent-driven-plugin` |
| Marketplace Name | `intent-driven-marketplace` |
| Initial Version | `0.1.0` |

---

# Primary Capability

Create an Intent Readiness Report for the currently opened repository.

The plugin must add the following Claude Code command:

```
/intent-driven-plugin:intent-check
```

When invoked, the command analyzes the current repository and produces a structured report showing whether the repository is ready for intent-driven development.

## Constraints

The plugin must **not** require:

- API keys
- Cloud accounts
- Jira credentials
- GitHub tokens
- External services
- Databases
- Network calls
- MCP servers

It should use Claude Code's existing repository-reading and analysis capabilities only.

---

# User Experience

After installing the plugin, a developer should be able to open any repository in Visual Studio Code, start Claude Code, and run:

```
/intent-driven-plugin:intent-check
```

Claude should then inspect the repository and report on:

- Repository purpose
- Primary technology stack
- Build and package-management approach
- Test framework and test coverage signals
- Existing documentation
- Existing Claude configuration
- Existing intent or specification files
- Existing CI/CD configuration
- Security and dependency-management signals
- Missing information that would prevent reliable implementation
- Recommended next actions
- Overall Intent Readiness rating

## Rating Scale

The rating must be one of:

- Ready
- Mostly Ready
- Needs Preparation
- Not Ready

## Read-Only Requirement

The command must be read-only by default.

It must not modify repository files unless the user explicitly asks Claude to apply one of the recommendations after reviewing the report.

---

# Required Repository Structure

Create a valid Claude Code plugin and marketplace repository using a structure similar to:

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

## Notes

- Adjust the structure only when required by the current official Claude Code plugin specification.
- Do not invent unsupported plugin fields.
- Use the currently supported Claude Code plugin and marketplace formats.

---

# Plugin Manifest

Create: `.claude-plugin/plugin.json`

The manifest should include the supported metadata needed to identify the plugin.

| Field | Value |
|---|---|
| Name | `intent-driven-plugin` |
| Version | `0.1.0` |
| Description | A credential-free Claude Code plugin that evaluates whether a repository is ready for intent-driven development. |
| Author | Mark Kendall |
| Homepage | https://intent-driven-engineering.com |
| Repository | https://github.com/kendallmark3/intent-driven-plugin |

Only use fields supported by the official Claude Code plugin format.

---

# Marketplace Manifest

Create: `.claude-plugin/marketplace.json`

The marketplace must make this repository installable as a Claude Code plugin marketplace.

| Field | Value |
|---|---|
| Marketplace name | `intent-driven-marketplace` |
| Plugin name | `intent-driven-plugin` |
| Plugin source | the plugin contained in this repository |
| Description | Public Claude Code plugins for Intent-Driven Engineering |

Only use fields supported by the current official Claude Code marketplace specification.

---

# Command Requirements: `commands/intent-check.md`

The command must instruct Claude to follow the steps below.

## Step 1: Establish Repository Context

Inspect appropriate files, including when present:

- README files
- CLAUDE.md
- INTENT.md
- Feature.md
- Package manifests
- Project files
- Build scripts
- Test configuration
- CI/CD workflows
- Source directories
- Architecture documentation
- Contribution guidelines
- Security documentation

Do not scan generated dependency directories or large binary content.

Ignore directories such as:

- `node_modules`
- `dist`
- `build`
- `coverage`
- `target`
- `bin`
- `obj`
- `.git`
- `.next`
- `vendor`

## Step 2: Identify the Repository

Determine:

- What the repository appears to do
- Its primary languages and frameworks
- Its likely build command
- Its likely test command
- Its primary runtime
- Its deployment model, when discoverable

Clearly label uncertain conclusions as assumptions.

## Step 3: Evaluate Intent Readiness

Evaluate the repository across these categories:

| Category | Evaluation |
|---|---|
| Purpose | Is the repository's purpose clear? |
| Architecture | Can Claude understand the important components and boundaries? |
| Build | Are build and setup commands documented or discoverable? |
| Testing | Are tests and validation commands available? |
| Intent | Are requirements, acceptance criteria, or intent files available? |
| Claude Guidance | Is CLAUDE.md or equivalent repository guidance present? |
| Delivery | Is the pull-request and CI/CD process understandable? |
| Safety | Are secrets, generated files, and sensitive areas identifiable? |

## Step 4: Produce the Report

Use this output structure:

```markdown
# Intent Readiness Report

## Executive Summary

## Repository Profile

## Readiness Scorecard

## What Is Already Strong

## Missing or Ambiguous Information

## Implementation Risks

## Recommended Next Actions

## Overall Rating

## Suggested First Intent
```

Requirements:

- The report should be practical and specific to the repository.
- Avoid generic recommendations when repository evidence is available.
- Include relevant filenames as evidence.
- Do not expose secrets or print secret values.

## Step 5: Recommend a First Intent

Conclude with one small, realistic intent that could be safely attempted in the repository.

The recommendation must contain:

- Objective
- Business or user value
- Scope
- Out of scope
- Acceptance criteria
- Validation commands
- Risks or assumptions

Do not implement the recommendation during the initial command.

---

# Skill Requirements: `skills/repository-intent-analysis/SKILL.md`

The skill should contain reusable guidance for evaluating repository readiness and translating repository evidence into implementation intent.

The skill should emphasize:

- Evidence before assumptions
- Repository-specific findings
- Small implementation scope
- Explicit acceptance criteria
- Explicit validation commands
- Human review before modification
- No credential requirements
- Read-only analysis by default

Keep the skill focused and understandable. Do not turn the first release into a large framework.

---

