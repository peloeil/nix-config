return {
    cond = not vim.g.vscode,
    name = "rainbow-delimiters.nvim",
    dir = "@rainbow_delimiters_nvim@",
    event = {
        "BufNewFile",
        "BufReadPost",
    },
}
