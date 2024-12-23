return {
    {
        cond = false,
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
        cond = true,
        name = "kanagawa.nvim",
        dir = "@kanagawa_nvim@",
        priority = 1000,
        event = {
            "VimEnter",
        },
        opts = {
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
            transparent = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    -- transparent floating window (?)
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },

                    -- borderless telescope
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

                    -- dark popup window
                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
                    PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },

                    WinSeparator = {
                        fg = colors.palette.fujiGray,
                        bold = true,
                    },
                }
            end,
        },
        config = function(_, opts)
            local kanagawa = require("kanagawa")
            kanagawa.setup(opts)
            kanagawa.load("wave")
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
