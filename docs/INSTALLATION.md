# Installation

`intent-driven-plugin` installs directly from its public GitHub repository — no credentials, no
external services.

## Add the marketplace

In an interactive Claude Code session, run:

```
/plugin marketplace add kendallmark3/intent-driven-plugin
```

This registers the `intent-driven-marketplace` marketplace defined in this repository's
`.claude-plugin/marketplace.json`.

## Install the plugin

```
/plugin install intent-driven-plugin@intent-driven-marketplace
```

## CLI alternative

The `/plugin` slash commands only work inside an interactive session. From a terminal (including
non-interactive contexts, like a Claude Code agent acting on your behalf), use the equivalent
`claude plugin` CLI subcommands instead:

```
claude plugin marketplace add kendallmark3/intent-driven-plugin
claude plugin install intent-driven-plugin@intent-driven-marketplace
claude plugin list
```

## Verify

```
/plugin
```

(or `claude plugin list` from a terminal) should list `intent-driven-plugin` as installed and
enabled. Then, inside any repository:

```
/intent-driven-plugin:intent-check
```

should run and produce an Intent Readiness Report. See [USAGE.md](USAGE.md) for what to expect.

## Requirements

- Claude Code (recent version with plugin marketplace support)
- Nothing else — no API keys, cloud accounts, tokens, databases, or network access are required.
