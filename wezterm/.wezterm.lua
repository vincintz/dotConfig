local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = wezterm.config_builder()
local act = wezterm.action

config.default_prog = { 'C:\\Program Files\\Powershell\\7\\pwsh.exe' }
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.scrollback_lines = 100000

-- look and feel
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
config.color_scheme = 'Gruvbox dark, hard (base16)'
window_decorations = "RESIZE"
config.enable_tab_bar = false

-- ----------------------------------------
-- keymaps
config.keys = {
  -- split pane
  { key = 'v', mods = 'LEADER', action = act.SplitPane { direction = 'Right' } },
  { key = 'h', mods = 'LEADER', action = act.SplitPane { direction = 'Down' } },

  -- shift left/right tab
  { key = 'LeftArrow', mods = 'SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'RightArrow', mods = 'SHIFT', action = act.ActivateTabRelative(1) },

  -- clipboard shortcuts
  { key = 'p', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },
  { key = 'y', mods = 'LEADER', action = act.ActivateCopyMode },

  -- tab/pane shortcuts
  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'LEADER', action = act.ShowTabNavigator },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
  { key = 'd', mods = 'LEADER', action = act.CloseCurrentTab { confirm = true } },

  { key = 'a', mods = 'LEADER', action = act.SendKey { key = 'a', mods = 'CTRL' } },
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },
  { key = 'l', mods = 'LEADER', action = act.SendKey { key = 'l', mods = 'CTRL' } },
  { key = 'l', mods = 'CTRL|ALT', action = act.SendKey { key = 'l', mods = 'CTRL' } },
  { key = 'f', mods = 'LEADER', action = act.ToggleFullScreen },
}

-- plugins
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
smart_splits.apply_to_config(config)

-- Maximize the initial GUI window after WezTerm creates it.
wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- return
return config
