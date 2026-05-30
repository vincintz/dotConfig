-- VimWiki setup (lazy-loaded on VimwikiIndex command)
local function setup_vimwiki()
  vim.cmd.packadd("vimwiki")
  -- VimWiki initialization happens on first :VimwikiIndex call
end

-- Create command to load and use vimwiki
vim.api.nvim_create_user_command('VimwikiIndex', function()
  setup_vimwiki()
  vim.cmd.VimwikiIndex()
end, {})
