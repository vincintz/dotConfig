-- Tmux navigator (lazy-loaded, only on Unix)
if vim.fn.has("win32") == 0 then
  local function setup_tmux_navigator()
    vim.cmd.packadd("vim-tmux-navigator")
  end
  
  vim.keymap.set("n", "<c-h>", function()
    setup_tmux_navigator()
    vim.cmd("TmuxNavigateLeft")
  end)
  vim.keymap.set("n", "<c-j>", function()
    setup_tmux_navigator()
    vim.cmd("TmuxNavigateDown")
  end)
  vim.keymap.set("n", "<c-k>", function()
    setup_tmux_navigator()
    vim.cmd("TmuxNavigateUp")
  end)
  vim.keymap.set("n", "<c-l>", function()
    setup_tmux_navigator()
    vim.cmd("TmuxNavigateRight")
  end)
end
