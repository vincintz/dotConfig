require "config.options"
require "config.autocmds"
require "config.keymaps"

-- Load START plugins (auto-loaded from pack/theovim/start/)
-- These require immediate setup

require "plugin-config.colorscheme"
require "plugin-config.completion"
require "plugin-config.lsp"
require "plugin-config.treesitter"
require "plugin-config.mini"

-- Load OPT plugin loaders (lazy-loaded on demand)
require "plugin-config.telescope-lazy"
require "plugin-config.git"
require "plugin-config.flash"
require "plugin-config.harpoon"
require "plugin-config.trouble"
require "plugin-config.vimwiki"
require "plugin-config.tmux-navigator"
