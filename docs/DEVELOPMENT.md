# Development

## Repository layout

```
intent-driven-plugin/
├── .claude-plugin/
│   ├── plugin.json          # plugin manifest
│   └── marketplace.json     # marketplace catalog (this repo is its own marketplace)
├── commands/
│   └── intent-check.md      # the /intent-driven-plugin:intent-check command
├── skills/
│   └── repository-intent-analysis/
│       └── SKILL.md         # reusable readiness-evaluation guidance
├── examples/
│   └── sample-intent-readiness-report.md
├── docs/                    # this directory
├── scripts/
│   ├── validate-plugin.sh   # structure/JSON validation (bash)
│   └── validate-plugin.ps1  # structure/JSON validation (PowerShell)
├── tests/
│   └── structure-validation.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
├── README.md
└── INTENT.md                # the original build spec (see also intents/)
```

## Making changes

1. Edit `commands/intent-check.md` to change what the command instructs Claude to do, or
   `skills/repository-intent-analysis/SKILL.md` to change the underlying evaluation guidance.
2. Run the validation script to catch structural/JSON mistakes:

   ```bash
   ./scripts/validate-plugin.sh
   ```

   or, if a Claude Code CLI with plugin support is installed:

   ```bash
   claude plugin validate .
   ```
3. Test it manually: open a test repository in Claude Code with this plugin installed (or loaded
   locally — see below) and run `/intent-driven-plugin:intent-check` against a few different kinds
   of repositories (well-documented, undocumented, mid-size, tiny) to check the report stays
   accurate and proportionate.
4. Walk through [tests/structure-validation.md](../tests/structure-validation.md) before tagging a
   release.

## Loading the plugin locally during development

From within a test repository in Claude Code:

```
/plugin marketplace add /path/to/local/intent-driven-plugin
/plugin install intent-driven-plugin@intent-driven-marketplace
```

This points at your local working copy instead of GitHub, so edits take effect after reloading
the plugin.

## Versioning

Bump `version` in `.claude-plugin/plugin.json` (and add an entry to `CHANGELOG.md`) for any
release users should be able to pin to. Keep changes to v0.1.x small — this plugin is intentionally
scoped to one command and one skill; resist folding in unrelated capabilities.

## Constraints to preserve

- No API keys, cloud accounts, tokens, databases, network calls, or MCP servers — ever.
- `intent-check` stays read-only by default.
- Only use `plugin.json` / `marketplace.json` fields supported by the current official Claude Code
  plugin/marketplace spec — do not invent fields.
