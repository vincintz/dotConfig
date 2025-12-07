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
      completion = {
        menu = {
          auto_show = false,
        }
      }
    },
    opts_extend = { "sources.default" }
  }
}
