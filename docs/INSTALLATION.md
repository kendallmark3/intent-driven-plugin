# Installation

`intent-driven-plugin` installs directly from its public GitHub repository — no credentials, no
external services.

## Add the marketplace

In Claude Code, run:

```
/plugin marketplace add kendallmark3/intent-driven-plugin
```

This registers the `intent-driven-marketplace` marketplace defined in this repository's
`.claude-plugin/marketplace.json`.

## Install the plugin

```
/plugin install intent-driven-plugin@intent-driven-marketplace
```

## Verify

```
/plugin
```

should list `intent-driven-plugin` as installed and enabled. Then, inside any repository:

```
/intent-driven-plugin:intent-check
```

should run and produce an Intent Readiness Report. See [USAGE.md](USAGE.md) for what to expect.

## Requirements

- Claude Code (recent version with plugin marketplace support)
- Nothing else — no API keys, cloud accounts, tokens, databases, or network access are required.
