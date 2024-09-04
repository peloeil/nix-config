return {
    {
        name = "gruvbox.nvim",
        dir = "@gruvbox_nvim@",
        priority = 1000,
        event = {
            "VimEnter",
        },
        opts = {
            terminal_colors = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                folds = false,
            },
            transparent_mode = true,
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.opt.background = "dark"
            vim.cmd("colorscheme gruvbox")
        end,
    },
}
