return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*",

    opts = {
      keymap = {
        preset = "default",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "accept", "fallback" },
        ["<Cr>"] = { "accept", "fallback" },
        ["<Esc>"] = { "hide", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono"
      },

    },
    opts_extend = { "sources.default" }
  },
}
