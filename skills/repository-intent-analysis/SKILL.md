---
description: Guidance for evaluating whether a repository is ready for intent-driven development and for turning repository evidence into a small, safely-scoped implementation intent. Use when assessing repository readiness, writing an Intent Readiness Report, or drafting a first intent from repository evidence.
---

# Repository Intent Analysis

Reusable guidance for evaluating repository readiness and translating repository evidence into
implementation intent. Keep analysis focused — this is a method, not a framework.

## Principles

- **Evidence before assumptions.** Base every conclusion on a file you actually read. When you
  must guess (e.g. an undocumented build command), say so explicitly and label it as an
  assumption rather than presenting it as fact.
- **Repository-specific findings.** Cite filenames and quote relevant lines as evidence. Avoid
  generic advice ("add more tests", "write documentation") when the repository already shows what
  is missing and where.
- **Small implementation scope.** Any recommended intent should be one narrow, safely-attemptable
  change — not a roadmap, not a rewrite. If the repository needs many things, pick the single
  highest-leverage one.
- **Explicit acceptance criteria.** Every recommended intent must state how you'd know it
  succeeded — a concrete, checkable condition, not "it works correctly."
- **Explicit validation commands.** State the actual build/test/lint commands discovered in the
  repository (from package manifests, CI config, or documentation). If none are discoverable, say
  so — don't invent plausible-sounding ones.
- **Human review before modification.** Analysis and recommendations only. Never edit, create, or
  delete repository files as part of this analysis; a human decides whether and how to act on the
  report.
- **No credential requirements.** Reach every conclusion from files already in the repository and
  read-only local commands (e.g. `git log`). Never rely on API keys, tokens, network calls, or
  external services.
- **Read-only analysis by default.** This applies to the analysis process itself, not just the
  final report — do not stage, commit, or modify anything while gathering evidence.

## What to look for

Signal for readiness typically comes from: README files, `CLAUDE.md`, `INTENT.md`/spec files,
package manifests, build/test configuration, CI/CD workflow files, architecture or design docs,
contribution guidelines, and security documentation. Skip generated or vendored directories
(`node_modules`, `dist`, `build`, `coverage`, `target`, `bin`, `obj`, `.git`, `.next`, `vendor`) —
they drown out signal and can be large enough to blow the analysis budget.

## Translating evidence into intent

A good "first intent" recommendation reads like a small ticket, not a proposal:

1. **Objective** — the one thing that changes.
2. **Value** — why it matters to a user or the business, in one sentence.
3. **Scope / Out of scope** — draw the line explicitly; scope creep is the main way small intents
   turn into large, risky ones.
4. **Acceptance criteria** — checkable, not aspirational.
5. **Validation commands** — the exact commands to run to confirm it.
6. **Risks or assumptions** — anything you weren't able to verify from the repository itself.
