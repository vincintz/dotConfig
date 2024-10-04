-- vim.g.user_emmet_leader_key = "<C-n>"

return {
  "diepm/vim-rest-console",
  "editorconfig/editorconfig-vim",
  "mechatroner/rainbow_csv",
  "tpope/vim-commentary",
  "vimwiki/vimwiki",
  "AndrewRadev/tagalong.vim",
  "mattn/emmet-vim",
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<c-w><c-h>" },
      { "<c-j>", "<c-w><c-j>" },
      { "<c-k>", "<c-w><c-k>" },
      { "<c-l>", "<c-w><c-l>" },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
      require("outline").setup {}
    end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.keymap.set("n", "<leader>p", "<cmd>Barbecue toggle<CR>", { desc = "Toggle Breadcrumbs" })
      require("barbecue").setup {}
      require("barbecue.ui").toggle(false)
    end,
  },
  {
    "sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup ({})
      vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>")
    end,
  },
}
