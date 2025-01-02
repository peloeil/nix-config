return {
    cond = not vim.g.vscode,
    name = "treesj",
    dir = "@treesj@",
    keys = {
        {
            "<leader>m",
            function()
                require("treesj").toggle()
            end,
        },
        {
            "<leader>M",
            function()
                require("treesj").toggle({ split = { recursive = true } })
            end,
        },
    },
    dependencies = {
        { name = "nvim-treesitter", dir = "@nvim_treesitter@" },
    },
    opts = {},
}
