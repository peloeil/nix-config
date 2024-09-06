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
    },
    opts = {
        defaults = {
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
        extensions = {
            file_browser = {
                hijack_netrw = true,
            },
        },
    },
}
