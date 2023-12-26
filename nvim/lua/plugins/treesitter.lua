return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "javascript", "regex", "json", "html" },
      })
    end
  },
}
