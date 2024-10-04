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
      require"telescope".setup {
        pickers = {
          live_grep = {
            additional_args = function()
              return {"--hidden"}
            end
          },
        },
      }
      -- keymaps
      vim.keymap.set("n", "fg", "<cmd>Telescope git_files theme=ivy<cr>")
      vim.keymap.set("n", "fs", "<cmd>Telescope live_grep hidden=true theme=ivy<cr>")
      vim.keymap.set("n", "fb", "<cmd>Telescope buffers theme=ivy<cr>")
      vim.keymap.set("n", "fh", "<cmd>Telescope help_tags theme=ivy<cr>")
      vim.keymap.set("n", "fc", "<cmd>Telescope grep_string theme=ivy<cr>")
      vim.keymap.set("n", "ff", "<cmd>Telescope find_files hidden=true theme=ivy<cr>")
      vim.keymap.set("n", "<f1>", "<cmd>Telescope help_tags theme=ivy<cr>")
      vim.keymap.set("n", "<leader>h", "<cmd>Telescope harpoon marks theme=ivy<cr>")
      vim.keymap.set("n", "<leader>m", "<cmd>Telescope marks theme=ivy<cr>")
      vim.keymap.set("n", "<leader>q", "<cmd>Telescope quickfix theme=ivy<cr>")
    end,
  },
}
