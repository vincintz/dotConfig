return {
    {
        "voldikss/vim-floaterm",
        config = function()
            -- settings
            vim.g.floaterm_width = 0.98
            vim.g.floaterm_height = 0.90
            vim.g.floaterm_titleposition = "center"
            vim.g.floaterm_borderchars = "░░░░░░░░"
            -- keymaps
            vim.keymap.set("n", "<c-t>", "<cmd>FloatermToggle<cr>")
            vim.keymap.set("n", "<c-\\>", "<cmd>FloatermNew<cr>")
            vim.keymap.set("t", "<c-t>", "<cmd>FloatermToggle<cr>")
            vim.keymap.set("t", "<c-j>", "<cmd>FloatermNext<cr>")
            vim.keymap.set("t", "<c-k>", "<cmd>FloatermPrev<cr>")
            vim.keymap.set("v", "<c-t>", "<cmd>'<,'>FloatermSend<cr><cmd>FloatermToggle<cr>")
        end
    },
}
