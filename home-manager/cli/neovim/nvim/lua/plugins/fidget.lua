return {
    cond = not vim.g.vscode,
    name = "fidget.nvim",
    dir = "@fidget_nvim@",
    event = {
        "BufNewFile",
        "BufReadPost",
    },
    opts = {},
}
