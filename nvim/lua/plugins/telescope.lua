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
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.load_extension("fzf")
      -- keymaps
      vim.keymap.set("n", "fg", builtin.git_files, {})
      vim.keymap.set("n", "fs", builtin.live_grep, {})
      vim.keymap.set("n", "fb", builtin.buffers, {})
      vim.keymap.set("n", "fh", builtin.help_tags, {})
      vim.keymap.set("n", "fc", builtin.grep_string, {})
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.keymap.set("n", "ff", "<cmd>Telescope file_browser<cr>", {})
    end,
  }
}
