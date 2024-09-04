return {
    name = "conform.nvim",
    dir = "@conform_nvim@",
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format()
            end,
            ft = {
                "c",
                "cpp",
                "json",
                "lua",
                "nix",
                "python",
                "rust",
                "sh",
                "typst",
                "yaml",
            },
            { desc = "format buffer" },
        },
    },
    opts = {
        formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
            json = { "jq" },
            lua = { "stylua" },
            nix = { "nixfmt" },
            python = { "ruff_organize_import", "ruff_format", "ruff_fix" },
            rust = { "rustfmt" },
            sh = { "shellcheck", "shfmt" },
            typst = { "typstyle" },
            yaml = { "yamlfix" },
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
            },
        },
    },
}
