---
description: Analyze the current repository and produce an Intent Readiness Report showing whether it is ready for intent-driven development.
disallowed-tools: Write Edit NotebookEdit
---

# Intent Check

Analyze the currently opened repository and produce a structured **Intent Readiness Report**.
This command is read-only: do not create, edit, or delete any repository files. If, after
reviewing the report, the user explicitly asks you to apply one of your recommendations, treat
that as a new, separate request outside this command.

Apply the principles in the `repository-intent-analysis` skill throughout this analysis
(evidence before assumptions, repository-specific findings, small implementation scope, explicit
acceptance criteria and validation commands).

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

Do not scan generated dependency directories or large binary content. Ignore directories such as:

`node_modules`, `dist`, `build`, `coverage`, `target`, `bin`, `obj`, `.git`, `.next`, `vendor`

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

Use this exact output structure:

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

- Be practical and specific to this repository — avoid generic recommendations when repository
  evidence is available.
- Include relevant filenames as evidence for each claim.
- Do not expose secrets or print secret values, even if you encounter them while reading files.
- The **Overall Rating** must be exactly one of: `Ready`, `Mostly Ready`, `Needs Preparation`,
  `Not Ready`.

## Step 5: Recommend a First Intent

Conclude the report with one small, realistic intent that could be safely attempted in this
repository next. It must contain:

- Objective
- Business or user value
- Scope
- Out of scope
- Acceptance criteria
- Validation commands
- Risks or assumptions

Do not implement the recommendation during this command — only propose it.
