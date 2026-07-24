# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [0.1.0] - 2026-07-24

### Added

- Initial release of `intent-driven-plugin`.
- `/intent-driven-plugin:intent-check` command: read-only Intent Readiness Report for the current
  repository (purpose, stack, build/test signals, docs, CI/CD, security signals, gaps, overall
  rating, and a suggested first intent).
- `repository-intent-analysis` skill with reusable evaluation guidance.
- `intent-driven-marketplace` marketplace manifest, making this repository directly installable.
- Documentation (`docs/`), a sample report (`examples/`), validation scripts (`scripts/`), and a
  structure-validation checklist (`tests/`).
