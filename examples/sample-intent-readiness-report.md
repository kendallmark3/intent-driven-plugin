# Sample: Intent Readiness Report

This is an illustrative example of the output produced by `/intent-driven-plugin:intent-check`,
run against a fictitious small Node.js CLI repository. It shows the expected shape, tone, and
level of specificity — not a real repository.

---

# Intent Readiness Report

## Executive Summary

This is a small TypeScript CLI tool (`csv-tidy`) that formats and validates CSV files. Purpose and
usage are clear from `README.md`, but there is no `CLAUDE.md`, no CI configuration, and test
coverage is thin (one test file covering roughly a third of `src/`). Overall: **Mostly Ready**.

## Repository Profile

- **Purpose:** Command-line CSV formatter/validator (from `README.md` and `package.json`
  `"description"`).
- **Primary stack:** TypeScript, Node.js 20 (`.nvmrc`), `commander` for CLI parsing
  (`package.json` dependencies).
- **Build command:** `npm run build` (runs `tsc`, per `package.json` `scripts.build`).
- **Test command:** `npm test` (runs `vitest`, per `package.json` `scripts.test`).
- **Runtime:** Node.js, published as a global npm CLI (`bin` field in `package.json`).
- **Deployment model:** Published to npm on tag push — *assumption*, inferred from a
  `publish.yml`-shaped file existing under `.github/workflows/`, not confirmed by reading its
  contents.

## Readiness Scorecard

| Category | Status | Evidence |
|---|---|---|
| Purpose | Strong | `README.md` states the tool's purpose and gives usage examples |
| Architecture | Adequate | `src/` has a clear `cli.ts` / `format.ts` / `validate.ts` split |
| Build | Strong | `npm run build` documented in `README.md` and `package.json` |
| Testing | Weak | `src/format.test.ts` exists; `validate.ts` has no corresponding test file |
| Intent | Missing | No `INTENT.md`, `Feature.md`, or issue templates found |
| Claude Guidance | Missing | No `CLAUDE.md` present |
| Delivery | Ambiguous | `.github/workflows/` present but not inspected in this pass |
| Safety | Adequate | `.env.example` present with placeholder values only; no secrets found in tracked files |

## What Is Already Strong

- Clear, example-driven `README.md` covering install and usage.
- Small, legible `src/` layout with an obvious entry point (`src/cli.ts`).
- Build and test commands are both documented and runnable without extra setup.

## Missing or Ambiguous Information

- No `CLAUDE.md` — a future Claude session has no persisted guidance on this repo's conventions.
- No intent/spec files (`INTENT.md`, `Feature.md`) describing planned work or acceptance criteria.
- `validate.ts` (the input-validation path) has no test coverage — risk for a change in that area.
- CI workflow contents weren't inspected in this pass, so the delivery process is only partially
  confirmed.

## Implementation Risks

- Changes to `validate.ts` are unverified by tests — a regression there could ship silently.
- Without a `CLAUDE.md`, future automated changes may not follow this repo's existing conventions
  (e.g. its use of `commander` subcommands) unless a human states them explicitly each time.

## Recommended Next Actions

1. Add a `CLAUDE.md` documenting the build/test commands and the `src/` layout above.
2. Add test coverage for `validate.ts`.
3. Confirm and document the release process referenced in `.github/workflows/`.

## Overall Rating

**Mostly Ready** — purpose, build, and test commands are all clear and discoverable; the main gaps
are missing Claude/intent guidance and thin coverage on one module.

## Suggested First Intent

**Objective:** Add a `CLAUDE.md` to `csv-tidy` documenting build/test commands and the `src/`
layout.

**Value:** Lets future Claude Code sessions (and new contributors) work productively without
re-deriving the project structure each time.

**Scope:** One new file, `CLAUDE.md`, at the repository root. No source changes.

**Out of scope:** Adding tests for `validate.ts`; changing the CI workflow. (Tracked separately —
see Recommended Next Actions above.)

**Acceptance criteria:** `CLAUDE.md` exists at the repo root and documents: the build command, the
test command, and the purpose of each file in `src/`.

**Validation commands:** `npm run build && npm test` still pass unchanged (this intent touches no
source files).

**Risks or assumptions:** None — this is a documentation-only addition with no behavioral risk.
