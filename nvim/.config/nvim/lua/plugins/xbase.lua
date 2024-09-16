return {
    {
        "xbase-lab/xbase",
        build = "make install",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        enabled = function()
            return jit.os == "OSX"
        end,
        config = function()
            require("xbase").setup({})
        end,
    },
}
