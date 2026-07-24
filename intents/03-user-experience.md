# User Experience

After installing the plugin, a developer should be able to open any repository in Visual Studio Code, start Claude Code, and run:

```
/intent-driven-plugin:intent-check
```

Claude should then inspect the repository and report on:

- Repository purpose
- Primary technology stack
- Build and package-management approach
- Test framework and test coverage signals
- Existing documentation
- Existing Claude configuration
- Existing intent or specification files
- Existing CI/CD configuration
- Security and dependency-management signals
- Missing information that would prevent reliable implementation
- Recommended next actions
- Overall Intent Readiness rating

## Rating Scale

The rating must be one of:

- Ready
- Mostly Ready
- Needs Preparation
- Not Ready

## Read-Only Requirement

The command must be read-only by default.

It must not modify repository files unless the user explicitly asks Claude to apply one of the recommendations after reviewing the report.
