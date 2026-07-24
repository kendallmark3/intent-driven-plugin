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
