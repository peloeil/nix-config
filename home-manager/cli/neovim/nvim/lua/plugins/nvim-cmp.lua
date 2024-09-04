return {
    name = "nvim-cmp",
    dir = "@nvim_cmp@",
    event = {
        "InsertEnter",
        "CmdlineEnter",
    },
    dependencies = {
        { name = "nvim-lspconfig", dir = "@nvim_lspconfig@" },
        {
            name = "nvim-snippy",
            dir = "@nvim_snippy@",
            opts = {
                mappings = {
                    is = {
                        ["<Tab>"] = "expand_or_advance",
                        ["<S-Tab>"] = "previous",
                    },
                },
            },
        },
        { name = "cmp-snippy", dir = "@cmp_snippy@" },
        { name = "cmp-buffer", dir = "@cmp_buffer@" },
        { name = "cmp-path", dir = "@cmp_path@" },
        { name = "cmp-cmdline", dir = "@cmp_cmdline@" },
        { name = "cmp-nvim-lsp", dir = "@cmp_nvim_lsp@" },
    },
    opts = function(_, _)
        local cmp = require("cmp")
        local opts = {
            snippet = {
                expand = function(args)
                    require("snippy").expand_snippet(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "snippy" },
            }, {
                { name = "buffer" },
            }),
        }
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = {
                disallow_symbol_nonprefix_matching = false,
            },
        })
        return opts
    end,
}
