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
