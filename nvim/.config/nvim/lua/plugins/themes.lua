return {
  {
    "vague-theme/vague.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "vague"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = { theme = "codedark" }
      })
    end
  },
}
