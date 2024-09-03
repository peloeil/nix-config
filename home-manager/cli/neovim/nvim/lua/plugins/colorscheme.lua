return {
    {
        name = "gruvbox.nvim",
        dir = "@gruvbox_nvim@",
        priority = 1000,
        event = {
            "VimEnter",
        },
        opts = {
            italic = {
                strings = false, -- ??
                emphasis = false,
                comments = false,
                folds = false,
            },
        },
        config = function()
            vim.opt.background = "dark"
            vim.cmd("colorscheme gruvbox")
        end,
    },
}
