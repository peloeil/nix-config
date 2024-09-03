return {
    name = "nvim-treesitter",
    dir = "@nvim_treesitter@",
    event = {
        "BufNewFile",
        "BufReadPre",
    },
    opts = {
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function()
        vim.opt.runtimepath:append("@treesitter_parser@")
    end,
}
