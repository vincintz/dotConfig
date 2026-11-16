local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

-- Vimwiki/markdown buffers map '-' themselves; override it with mini.files.
autocmd("FileType", {
  pattern = { "markdown", "mediawiki", "vimwiki" },
  group = autogroup("markdown-keymaps", { clear = true }),
  callback = function(args)
    vim.keymap.set("n", "-", function()
      _G.open_mini_files()
    end, { buffer = args.buf, desc = "Open Mini Files" })
  end,
})

-- highlight when yanking
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = autogroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- tmux: flag this pane as running nvim so tmux/.tmux.conf routes C-h/j/k/l here.
-- psmux reports the shell as the pane command, so the flag is set explicitly.
local tmux_pane = vim.env.TMUX_PANE
if vim.env.TMUX and tmux_pane and tmux_pane ~= "" then
  autocmd("VimEnter", {
    desc = "Mark tmux pane as running nvim",
    group = autogroup("tmux-nvim-flag", { clear = true }),
    callback = function()
      vim.fn.system({ "tmux", "set", "-p", "-t", tmux_pane, "@nvim_active", "1" })
    end,
  })
  autocmd("VimLeavePre", {
    desc = "Clear tmux pane nvim flag",
    group = autogroup("tmux-nvim-flag", { clear = false }),
    callback = function()
      vim.fn.system({ "tmux", "set", "-p", "-u", "-t", tmux_pane, "@nvim_active" })
    end,
  })
end
