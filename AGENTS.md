# Dotfiles

## Project Overview

Dotfiles and macOS setup for an Apple Silicon Mac, managed with
[chezmoi](https://www.chezmoi.io/). `install.sh` bootstraps a new machine: it installs
Homebrew and chezmoi, then runs `chezmoi init --apply jmfontaine`.

**Repository:** <https://github.com/jmfontaine/dotfiles> (public)

## Project Structure

```text
home/                  # chezmoi source state (.chezmoiroot), deployed to ~
├── dot_Brewfile       # Formulae, casks, Mac App Store apps, VS Code extensions, uv tools
├── dot_zshrc, dot_zprofile, dot_zshenv, dot_zsh_plugins.txt, dot_p10k.zsh
├── dot_gitconfig      # Plus dot_config/git/{personal,moxieforge}.gitconfig
├── dot_config/        # ghostty, git, zsh functions, zsh-abbr, 1Password SSH agent
├── dot_omp/           # omp coding agent configuration
├── private_dot_aws/, private_dot_ssh/
├── private_Library/   # VS Code symlinks into vscode/
└── run_onchange_*     # Package install, antidote bundle, macOS defaults, Dock, firewall
vscode/                # VS Code user settings and keybindings (symlink targets)
.vscode/               # Workspace settings for editing this repository, cSpell words
install.sh             # Bootstrap script, fetched with curl from main
```

Only `home/` is deployed. Keep anything that must not land in `~` outside it.

## Development

Edit files in this repository, never the deployed copies in `~`. Then:

- `chezmoi diff`: Preview what an apply changes.
- `chezmoi apply`: Deploy. Runs the `run_onchange_` scripts whose content changed.
- `chezmoi status`: Empty when `~` matches the source state.

[prek](https://prek.j178.dev) runs the hooks in `.pre-commit-config.yaml` (file checks,
[betterleaks](https://betterleaks.com) for secrets, [rumdl](https://rumdl.dev) for
Markdown, shellcheck). Recipes live in the `justfile`:

- `just setup`: Install the Git pre-commit hook.
- `just pre-commit`: Run every hook on all files.
- `just pre-commit-update`: Update hook revisions, frozen to commit hashes.
- `just format`: Format Markdown. Run after editing any Markdown file.
- `just qa`: Check Markdown formatting and lint.

## Gotchas

- The repository is public. Never commit secrets. Reference 1Password instead: `op://`
  URLs, or item IDs as in `private_dot_aws/config`.
- Removing an entry from `dot_Brewfile` uninstalls it on the next apply:
  `run_onchange_install-packages.sh.tmpl` runs `brew bundle cleanup --force`. That
  includes VS Code extensions, so keep every member of an extension pack listed (the
  `bierner.*` Markdown extensions, `ms-python.*`).
- Deleting a file from `home/` does not delete it from `~`. Remove the deployed copy
  too.
- Add the `.tmpl` suffix only to files that use template directives.
- A `run_onchange_` script reruns whenever its rendered content changes, and only then.
  Renaming it does not rerun it. The Dock script empties the Dock and adds back its own
  list.
- `vscode/` is symlinked, so changes made in VS Code's settings UI edit this repository.
- Paths assume Apple Silicon (`/opt/homebrew`). The shell is macOS's `/bin/zsh`, and
  `vscode/settings.json` pins the VS Code terminal profile to it.
- Git commits must be signed. The identity comes from the `includeIf` rules in
  `dot_gitconfig`, and `useConfigOnly` makes commits fail outside those directories.
  Agents sign with the agent signing key, as `~/.omp/agent/AGENTS.md` describes, never
  through 1Password's `op-ssh-sign`.
- Keep `dot_config/git/ignore` to macOS and editor files. Project artifacts belong in
  each repository's own `.gitignore`.
- omp reloads `config.yml` in running sessions; `AGENTS.md`, `RULES.md` and
  `PERSONALITY.md` take effect in new sessions only. Check settings with
  `omp config list`.
- Add words cSpell flags to `cSpell.words` in `.vscode/settings.json`.
- `CLAUDE.md` only imports this file for Claude Code versions that don't read
  `AGENTS.md`. Edit `AGENTS.md`.
- Keep `home/dot_Brewfile` in its shape: entries sorted by name with the tap prefix
  ignored (`jmfontaine/tap/agent-discogs` sorts under `a`), related entries together
  (`ableton-live-suite` directly above `ableton-live-suite@11`), a `# description`
  comment aligned in one column, and the `mas` entries after the casks. A formula from
  a tap uses its full path and `trusted: true`. Leave commented-out entries, such as
  `# cask "screaming-frog-seo-spider"`, where they are. When asked to add an app, keep
  every existing entry.
- `cask_args require_sha: true` applies to every cask. Before adding one, run
  `brew info --cask --json=v2 <token> | jq '.casks[] | {token, version, sha256}'` and
  confirm a `sha256` exists; a cask without one needs `args: { require_sha: false }`.
  For a tap formula, `brew info --json=v2 <tap/formula> | jq '.formulae[0]'` shows its
  description.
- Run a full `chezmoi apply` only when asked: it also runs `brew bundle cleanup --force`
  whenever the Brewfile changed. To deploy the files you changed, name their targets and
  read the diff first, for example `chezmoi diff ~/.omp/agent/config.yml`, then
  `chezmoi apply --force ~/.omp/agent/config.yml`. The deployed copy can differ from the
  source (omp rewrites its own config), so `--force` overwrites what the diff shows.
- Commit subjects are imperative and sentence-case, without a type prefix (`Install SD
  Card Formatter`), and each installed app is its own commit.
- `check-json` rejects trailing commas in `vscode/settings.json`, which VS Code itself
  accepts.
- `prek` stashes unstaged changes while the hooks run. If a commit is interrupted,
  check `git stash list` and `git status` before retrying.

## Shared Workflow

This repository follows the shared workflow: the `github-workflow` skill's repository
setup describes its GitHub settings, rulesets, labels and templates. Those settings are
managed as code outside this repository; change them there, never with `gh api` or the
GitHub web UI.

### Deviations From the Shared Workflow

- **Commits go straight to `main`,** without branches or pull requests: this repository
  is a backup and history of changes, not a collaborative project. Open a pull request
  only when asked.

## Key Files

- `home/dot_Brewfile`: Everything installed on the machine
- `home/run_onchange_install-packages.sh.tmpl`: Installs and prunes Homebrew packages
- `home/dot_zshrc`: Shell configuration
- `home/dot_gitconfig`: Git aliases, signing, and per-directory identities
- `justfile`: Formatting, linting, and pre-commit recipes
