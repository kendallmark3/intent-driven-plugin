# Installation

`intent-driven-plugin` installs directly from its public GitHub repository — no credentials, no
external services.

## Where to run this

**Use a real terminal**, not an IDE chat panel. `/plugin` (and the underlying `claude plugin`
commands) are features of the `claude` CLI itself. They are not available inside chat surfaces
like the VS Code / JetBrains extension panels — those have their own separate slash-command set,
and `/plugin` isn't part of it. If you type `/plugin marketplace add ...` in one of those and get
"no plugin command," that's why — it's not broken, it's the wrong surface.

Installed plugins are per-machine (user scope), so once you've done this once in a terminal, it's
available in every future `claude` session on that machine — including ones started from inside
an IDE.

## Option A: interactive session

Open a terminal and start Claude Code:

```
claude
```

At the interactive prompt, run:

```
/plugin marketplace add kendallmark3/intent-driven-plugin
/plugin install intent-driven-plugin@intent-driven-marketplace
```

Verify:

```
/plugin
```

should list `intent-driven-plugin` as installed and enabled.

## Option B: straight from the shell

Same result, without opening the interactive REPL first — run these directly in your regular
terminal:

```
claude plugin marketplace add kendallmark3/intent-driven-plugin
claude plugin install intent-driven-plugin@intent-driven-marketplace
claude plugin list
```

`claude plugin list` should show `intent-driven-plugin@intent-driven-marketplace`, version
`0.1.0`, scope `user`, status enabled.

## Use it

Inside any repository:

```
/intent-driven-plugin:intent-check
```

should run and produce an Intent Readiness Report. See [USAGE.md](USAGE.md) for what to expect.

## Requirements

- Claude Code (recent version with plugin marketplace support) run from an actual terminal
- Nothing else — no API keys, cloud accounts, tokens, databases, or network access are required.
