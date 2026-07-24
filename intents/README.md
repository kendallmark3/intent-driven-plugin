# Intents Index

This directory splits the original `intent.md` (the master build spec for the
`intent-driven-plugin` Claude Code plugin) into logical, independently
readable files. Together they are equivalent to the original document —
read in order 00 → 08 to reconstruct the full intent.

| File | Covers |
|---|---|
| [00-repo-setup.md](00-repo-setup.md) | Clone/branch/launch steps for the target repo |
| [01-mission.md](01-mission.md) | Mission statement, plugin/marketplace naming, version |
| [02-primary-capability.md](02-primary-capability.md) | The `/intent-driven-plugin:intent-check` command and no-credential constraints |
| [03-user-experience.md](03-user-experience.md) | UX flow, report contents, rating scale, read-only requirement |
| [04-repository-structure.md](04-repository-structure.md) | Required plugin repository file tree |
| [05-plugin-manifest.md](05-plugin-manifest.md) | `.claude-plugin/plugin.json` fields |
| [06-marketplace-manifest.md](06-marketplace-manifest.md) | `.claude-plugin/marketplace.json` fields |
| [07-command-intent-check.md](07-command-intent-check.md) | Full `commands/intent-check.md` behavior spec (Steps 1-5) |
| [08-skill-repository-intent-analysis.md](08-skill-repository-intent-analysis.md) | `skills/repository-intent-analysis/SKILL.md` requirements |

## Suggested build order

1. `00-repo-setup.md` — clone the target repo and check out a branch
2. `04-repository-structure.md` — scaffold the file tree
3. `05-plugin-manifest.md` + `06-marketplace-manifest.md` — write the two manifests
4. `02-primary-capability.md` + `03-user-experience.md` — confirm scope/UX before writing the command
5. `07-command-intent-check.md` — write `commands/intent-check.md`
6. `08-skill-repository-intent-analysis.md` — write the skill
7. Fill in `docs/`, `examples/`, `scripts/`, `tests/`, `README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, `LICENSE` per `04-repository-structure.md`
