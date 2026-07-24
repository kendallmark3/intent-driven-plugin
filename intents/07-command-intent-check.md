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
