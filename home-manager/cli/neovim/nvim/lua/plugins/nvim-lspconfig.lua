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
    ft = {
        "sh",
        "c",
        "cpp",
        "dockerfile",
        "lua",
        "nix",
        "python",
        "rust",
        "typst",
        "yaml",
    },
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lspconfig = require("lspconfig")
        for _, server in ipairs(server_list) do
            lspconfig[server].setup({})
        end
        lspconfig["lua_ls"].setup({
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        -- keymaps
        local opt = { noremap = true, silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opt)
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opt)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opt)
        vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opt)

        -- highlight
        vim.opt.updatetime = 500
        local group_id = vim.api.nvim_create_augroup("__doc_highlight", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            pattern = valid_patterns,
            group = group_id,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            pattern = valid_patterns,
            group = group_id,
            callback = vim.lsp.buf.clear_references,
        })
    end,
}
