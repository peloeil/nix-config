return {
    name = "nvim-treesitter",
    dir = "@nvim_treesitter@",
    event = {
        "BufNewFile",
        "BufReadPre",
    },
    opts = function(_, _)
        vim.opt.runtimepath:append("@treesitter_parser@")
        return {
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
}
