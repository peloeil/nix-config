local server_list = {
    "bashls",
    "clangd",
    "docker_compose_language_service",
    "dockerls",
    "nil_ls",
    "ruff_lsp",
    "rust_analyzer",
    "tinymist",
    "yamlls",
}

local valid_patterns = {
    "*.sh",
    "*.c",
    "*.h",
    "*.cpp",
    "*.hpp",
    "Dockerfile",
    "*.lua",
    "*.nix",
    "*.py",
    "*.rs",
    "*.typ",
    "*.yaml",
    "*.yml",
}

return {
    name = "nvim-lspconfig",
    dir = "@nvim_lspconfig@",
    event = {
        "BufNewFile  *.sh,*.c,*.h,*.cpp,*.hpp,*Dockerfile,*.lua,*.nix,*.py,*.rs,*.typ,*.yaml,*.yml",
        "BufReadPost *.sh,*.c,*.h,*.cpp,*.hpp,*Dockerfile,*.lua,*.nix,*.py,*.rs,*.typ,*.yaml,*.yml",
    },
    dependencies = {
        name = "cmp-nvim-lsp",
        dir = "@cmp_nvim_lsp@",
    },
    config = function(_, _)
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        for _, server in ipairs(server_list) do
            lspconfig[server].setup({
                capabilities = capabilities,
            })
        end
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        -- keymaps
        local opt = { silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opt)
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opt)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opt)
        vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opt)

        -- highlight
        vim.opt.updatetime = 1000
        local group_id = vim.api.nvim_create_augroup("__doc_highlight", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = group_id,
            pattern = valid_patterns,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = group_id,
            pattern = valid_patterns,
            callback = vim.lsp.buf.clear_references,
        })
    end,
}
