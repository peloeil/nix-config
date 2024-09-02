return {
    name = "conform.nvim",
    dir = "@conform_nvim@",
    event = {
        "BufWritePre",
    },
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            lua = { "stylua" },
            nix = { "nixfmt-rfc-style" },
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
            },
        },
    },
}
