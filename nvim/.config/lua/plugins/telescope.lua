return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("telescope").setup {
        pickers = {
          live_grep = {
            additional_args = function()
              return {"--hidden"}
            end
          },
        },
      }
      -- keymaps
      vim.keymap.set("n", "fg", "<cmd>Telescope git_files<cr>")
      vim.keymap.set("n", "fs", "<cmd>Telescope live_grep hidden=true<cr>")
      vim.keymap.set("n", "fb", "<cmd>Telescope buffers<cr>")
      vim.keymap.set("n", "fh", "<cmd>Telescope help_tags<cr>")
      vim.keymap.set("n", "fc", "<cmd>Telescope grep_string<cr>")
      vim.keymap.set("n", "ff", "<cmd>Telescope find_files hidden=true<cr>")
    end,
  },
}