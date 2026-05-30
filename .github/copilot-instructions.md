# Copilot instructions — dotConfig

Purpose
- Personal dotfiles repository. Configs are organized by tool (nvim, zsh, bash, tmux, alacritty, etc.). Primary entrypoints: bootstrap/ (OS bootstrap scripts) and _docs_/README.md and README.md for setup.

Build / Test / Lint commands
- No build or test suite in this repo (dotfiles).
- Lint / format helpers to run on single files or directories:
  - Shell scripts: shellcheck <file>
  - Python formatting: black <file_or_dir>
  - Python import sorting: isort <file_or_dir>
  - Neovim plugins: managed with vim.pack — use `:PackUpdate`, `:PackInstall`, `:PackList` or shell/PowerShell scripts (see nvim/PACK_MANAGEMENT.md)

High-level architecture
- Top-level layout: one folder per tool. Examples:
  - nvim/ -> contains nvim/.config/nvim (Lua configs, lazy-lock.json)
  - zsh/ -> shell fragments combined by top-level .zshrc
  - bash/ -> .bashrc/.bash_profile
  - tmux/ -> .tmux.conf
  - alacritty/ -> terminal config
  - bootstrap/ -> OS bootstrap scripts (bootstrap/ubuntu.sh)
  - libs/ -> cloned third-party plugin repos (used by bootstrap to vendor plugins)
- Workflow: clone repo into a chosen folder (often $HOME/dotConfig), then either run bootstrap/ubuntu.sh or create symlinks from repository files to $HOME as shown in README/_docs_.
- Neovim uses vim.pack (native plugin system as of 0.12) with git submodules:
  - `pack/theovim/start/` — plugins that load on startup (LSP, completion, treesitter, mini, themes, lualine)
  - `pack/theovim/opt/` — plugins that lazy-load on-demand (telescope, git, flash, harpoon, trouble, vimwiki)
  - Plugin configs live in `lua/plugin-config/` and are loaded from `init.lua`
  - Lazy-loaders (in `lua/plugin-config/*.lua`) use `:packadd` to load on first keymap/command use

Key conventions (repo-specific)
- Tool-per-directory: modify config for a tool inside its folder; top-level dotfiles are intended to be symlinked into $HOME.
- Symlink convention: README/_docs_ show examples (ln -s $HOME/dotConfig/.zshrc $HOME/.zshrc). Follow that rather than copying files.
- Neovim plugin management:
  - Plugins are git submodules in `pack/theovim/{start,opt}/`
  - When adding/removing plugins, use `git submodule add/deinit` and update `lua/plugin-config/` config files
  - Run `git submodule update --init --recursive` when cloning or `:PackInstall` in nvim to install
  - See nvim/PACK_MANAGEMENT.md for detailed instructions and cross-platform scripts
- Bootstrapping: bootstrap/ubuntu.sh installs system packages and clones required libs/plugins; update this script when adding OS-level deps.
- Small scripts and fragments are intentionally split (e.g., zsh/*.zsh) so that top-level .zshrc sources them — keep that split when editing.

Files to update when changing behavior
- _docs_/README.md and README.md for install instructions
- bootstrap/ubuntu.sh when adding system packages or new cloned libs
- nvim/.config/nvim/lua/plugin-config/* when updating plugin configs
- nvim/PACK_MANAGEMENT.md when adding/removing plugins or changing plugin management approach

Other AI assistant configs
- No CLAUDE.md, .cursorrules, AGENTS.md, CONVENTIONS.md, AIDER_CONVENTIONS.md, .windsurfrules, .clinerules, or .github/copilot-instructions.md were present before this file. If any are added, consider integrating salient parts here.

Notes for Copilot sessions
- Clone with `git clone --recurse-submodules` to get all plugins. If cloned without, run `git submodule update --init --recursive`
- Plugin management: use `:PackUpdate`, `:PackInstall` commands in nvim, or scripts in nvim/ directory (pack-update.sh for Unix, pack-update.ps1 for Windows)
- See nvim/PACK_MANAGEMENT.md for detailed plugin management and migration guide (if coming from lazy.nvim)
- Prefer changes inside the per-tool folder and update the corresponding config/docs files
- No CI/tests to run; verify shell scripts with shellcheck and manual bootstrap in a disposable VM/container if adding system-level changes

If anything should be added (examples: how to manage secrets, platform-specific differences, or frequently edited snippets), say which area to expand.
