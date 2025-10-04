return {
  {
    "saghen/blink.cmp",
    enable = true,
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*",

    opts = {
      keymap = {
        preset = "enter",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "accept", "fallback" },
        ["<Esc>"] = { "hide", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono"
      },
      completion = {
        documentation = { auto_show = false }
      },

    },
    opts_extend = { "sources.default" }
  },
}
