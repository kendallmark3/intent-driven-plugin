# Contributing

Thanks for considering a contribution to `intent-driven-plugin`.

## Ground rules

- No API keys, cloud accounts, tokens, databases, network calls, or MCP servers — this plugin
  stays credential-free by design. PRs that introduce any of these will not be merged.
- `/intent-driven-plugin:intent-check` must stay read-only by default. It should never modify
  repository files as part of its own execution.
- Keep changes small. This plugin is intentionally scoped to one command and one skill for
  v0.1.x; propose new capabilities as a discussion before implementing them.
- Only use `plugin.json` / `marketplace.json` fields supported by the current official Claude Code
  plugin/marketplace spec — don't invent fields.

## Making a change

1. Fork and clone the repository, then create a branch.
2. Make your change. See [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) for the repository layout and
   how to load the plugin locally for testing.
3. Run `./scripts/validate-plugin.sh` (or `.ps1` on Windows) and walk through
   [tests/structure-validation.md](tests/structure-validation.md).
4. Update `CHANGELOG.md` if your change is user-visible.
5. Open a pull request describing what changed and why.

## Reporting issues

Open a GitHub issue with: what repository you ran `/intent-driven-plugin:intent-check` in (or a
minimal repro), what you expected, and what you got instead.
