# Structure Validation Checklist

Manual checklist to confirm the plugin is structurally sound before tagging a release. Run
`../scripts/validate-plugin.sh` (or `.ps1`) first to automate the file/JSON checks below, then walk
through the remaining items by hand.

## Automated (via validate-plugin script)

- [ ] `.claude-plugin/plugin.json` exists and is valid JSON
- [ ] `.claude-plugin/marketplace.json` exists and is valid JSON
- [ ] `commands/intent-check.md` exists
- [ ] `skills/repository-intent-analysis/SKILL.md` exists
- [ ] `README.md`, `LICENSE`, `CHANGELOG.md`, `CONTRIBUTING.md` exist

## Manifest content

- [ ] `plugin.json` `name` is `intent-driven-plugin` and matches the marketplace entry's `name`
- [ ] `plugin.json` `version` matches the version noted in `CHANGELOG.md`
- [ ] `marketplace.json` `name` is `intent-driven-marketplace`
- [ ] `marketplace.json` `plugins[0].source` correctly points at this repository (`./`)
- [ ] No field in either manifest is unrecognized by the current official Claude Code plugin/
      marketplace spec (check against `claude plugin validate .` output, not just this list)

## Command behavior

- [ ] Install the plugin from a local path (see `docs/DEVELOPMENT.md`) in a scratch test
      repository
- [ ] Run `/intent-driven-plugin:intent-check` in a repository with good documentation — report
      should rate it `Ready` or `Mostly Ready` and cite specific filenames as evidence
- [ ] Run it in a sparse/undocumented repository — report should rate it `Needs Preparation` or
      `Not Ready`, clearly label assumptions, and not fabricate build/test commands that aren't
      discoverable
- [ ] Confirm the report always includes all nine sections from the required output structure, in
      order
- [ ] Confirm the Overall Rating is always exactly one of the four allowed values
- [ ] Confirm the command does not create, edit, or delete any file during the run
- [ ] Confirm the "Suggested First Intent" includes all seven required fields (objective, value,
      scope, out of scope, acceptance criteria, validation commands, risks/assumptions)

## Marketplace install

- [ ] `/plugin marketplace add kendallmark3/intent-driven-plugin` succeeds from a clean Claude Code
      session
- [ ] `/plugin install intent-driven-plugin@intent-driven-marketplace` succeeds
- [ ] No credential prompt, network error, or MCP server requirement appears at any point in
      install or usage
