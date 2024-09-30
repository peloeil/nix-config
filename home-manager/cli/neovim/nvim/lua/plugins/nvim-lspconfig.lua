local server_list = {
    "bashls",
    "clangd",
    "docker_compose_language_service",
    "dockerls",
    "lua_ls",
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
}

return {
    name = "nvim-lspconfig",
    dir = "@nvim_lspconfig@",
    event = {
        "BufNewFile  *.sh,*.c,*.h,*.cpp,*.hpp,*Dockerfile,*.lua,*.nix,*.py,*.rs,*.typ",
        "BufReadPost *.sh,*.c,*.h,*.cpp,*.hpp,*Dockerfile,*.lua,*.nix,*.py,*.rs,*.typ",
    },
    dependencies = {
        name = "cmp-nvim-lsp",
        dir = "@cmp_nvim_lsp@",
    },
    config = function(_, _)
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local doc_highlight = vim.api.nvim_create_augroup("__doc_highlight", {})

        for _, server in ipairs(server_list) do
            local opt = {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    vim.opt.updatetime = 1000
                    if client.supports_method("textDocument/documentHighlight") then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            group = doc_highlight,
                            buffer = bufnr,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            group = doc_highlight,
                            pattern = valid_patterns,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            }
            if server == "lua_ls" then
                opt.settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                }
            end
            lspconfig[server].setup(opt)
        end

        local opt = { silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opt)
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opt)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opt)
        vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opt)
    end,
}
