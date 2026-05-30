-- Blink completion setup
require("blink.cmp").setup({
  keymap = { preset = 'enter' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    menu = {
      auto_show = false,
    }
  }
})
