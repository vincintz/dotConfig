return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    ensure_installed = {
      "bash",
      "http",
      "javascript",
      "python",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
