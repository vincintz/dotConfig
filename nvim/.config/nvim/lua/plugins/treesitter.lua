return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "go",
          "html",
          "javascript",
          "lua",
          "python",
          "tsx",
          "typescript",
        },
      })
    end,
  },
}
