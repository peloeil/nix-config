local patterns_list = {
    bashls = { "*.sh" },
    clangd = { "*.c", "*.h", "*.cpp", "*.hpp" },
    docker_compose_language_service = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
    dockerls = { "Dockerfile" },
    lua_ls = { "*.lua" },
    nil_ls = { "*.nix" },
    pyright = { "*.py" },
    rust_analyzer = { "*.rs" },
    tinymist = { "*.typ" },
    yamlls = { "*.yaml", "*.yml" },
}

local function get_all_patterns()
    local all_patterns = {}
    for _, patterns in pairs(patterns_list) do
        for _, pattern in ipairs(patterns) do
            table.insert(all_patterns, pattern)
        end
    end
    return table.concat(all_patterns, ",")
end

local all_patterns = get_all_patterns()

return {
    name = "nvim-lspconfig",
    dir = "@nvim_lspconfig@",
    event = {
        "BufNewFile " .. all_patterns,
        "BufReadPost " .. all_patterns,
    },
    dependencies = {
        name = "cmp-nvim-lsp",
        dir = "@cmp_nvim_lsp@",
    },
    config = function(_, _)
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local doc_highlight = vim.api.nvim_create_augroup("__doc_highlight", {})

        for server, patterns in pairs(patterns_list) do
            local opt = {
                capabilities = capabilities,
                on_attach = function(client, _)
                    vim.opt.updatetime = 1000
                    if client.supports_method("textDocument/documentHighlight") then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            group = doc_highlight,
                            pattern = patterns,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            group = doc_highlight,
                            pattern = patterns,
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
