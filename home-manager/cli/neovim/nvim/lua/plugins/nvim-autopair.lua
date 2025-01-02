return {
    cond = not vim.g.vscode,
    name = "nvim-autopairs",
    dir = "@nvim_autopairs@",
    event = {
        "InsertEnter",
    },
    opts = {},
}
