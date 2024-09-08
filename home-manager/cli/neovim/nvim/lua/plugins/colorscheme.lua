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
    {
        cond = false,
        name = "catppuccin",
        dir = "@catppuccin@",
        priority = 1000,
        event = {
            "VimEnter",
        },
        opts = {
            flavor = "mocha",
            transparent_background = true,
            term_colors = true,
            no_italic = true,
            integrations = {
                aerial = true,
                nvim_surround = true,
                lsp_trouble = true,
                which_key = true,
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd("colorscheme catppuccin")
        end,
    },
}
