return {
    name = "conform.nvim",
    dir = "@conform_nvim@",
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format()
            end,
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
