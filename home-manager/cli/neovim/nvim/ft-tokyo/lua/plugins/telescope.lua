return {
    name = "telescope.nvim",
    dir = "@telescope_nvim@",
    branch = "0.1.x",
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            silent = true,
            desc = "find files",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            silent = true,
            desc = "live grep",
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            silent = true,
            desc = "help tags",
        },
    },
    dependencies = {
        { name = "plenary.nvim", dir = "@plenary_nvim@" },
        { name = "telescope-fzf-native.nvim", dir = "@telescope_fzf_native_nvim@" },
    },
    opts = {
        defaults = {
            path_display = { "shorten" },
            preview = {
                filesize_limit = 0.1, --MB
            },
            mappings = {
                i = {
                    ["<C-u>"] = false,
                },
            },
            file_ignore_patterns = {
                "^.git/",
            },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "-uu",
            },
        },
        pickers = {
            find_files = {
                theme = "dropdown",
            },
            live_grep = {
                theme = "dropdown",
            },
            help_tags = {
                theme = "dropdown",
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
}
