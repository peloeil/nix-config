return {
    name = "nvim-treesitter",
    dir = "@nvim_treesitter@",
    event = {
        "BufNewFile",
        "BufReadPre",
    },
    opts = function(_, _)
        local opts = {
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        }
        vim.opt.runtimepath:append("@treesitter_parser@")
        return opts
    end,
}
