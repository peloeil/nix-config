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
            aerial = {
                format_symbol = function(symbol_path, filetype)
                    if filetype == "json" or filetype == "yaml" then
                        return table.concat(symbol_path, ".")
                    else
                        return symbol_path[#symbol_path]
                    end
                end,
                show_columns = "both",
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
}
