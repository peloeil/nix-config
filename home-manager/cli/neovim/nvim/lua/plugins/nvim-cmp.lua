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
        {
            name = "copilot-cmp",
            dir = "@copilot_cmp@",
            cmd = "Copilot",
            dependencies = { name = "copilot", dir = "@copilot_lua@" },
            opts = {},
        },
    },
    opts = function(_, _)
        local cmp = require("cmp")
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
        return {
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
                { name = "copilot" },
                { name = "lazydev", group_index = 0 },
            }),
            sorting = {
                priority_weight = 2,
                comparators = {
                    require("copilot_cmp.comparators").prioritize,
                    -- Below is the default comparitor list and order for nvim-cmp
                    cmp.config.compare.offset,
                    -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        }
    end,
}
