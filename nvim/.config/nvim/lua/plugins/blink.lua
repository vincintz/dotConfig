return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    opts = {
      keymap = { preset = 'enter' },

      appearance = {
        nerd_font_variant = 'mono'
      },
    },
    opts_extend = { "sources.default" }
  }
}
