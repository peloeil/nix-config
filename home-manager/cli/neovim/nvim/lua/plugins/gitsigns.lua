return {
    cond = not vim.g.vscode,
    name = "gitsigns.nvim",
    dir = "@gitsigns_nvim@",
    event = {
        "BufNewFile",
        "BufReadPost",
    },
    opts = {
        linehl = false,
        current_line_blame = true,
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")
            local function bufnr_with(desc)
                if desc == nil then
                    return { buffer = bufnr, silent = true }
                else
                    return { buffer = bufnr, silent = true, desc = desc }
                end
            end
            vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, bufnr_with("stage hunk"))
            vim.keymap.set("v", "<leader>gs", function()
                gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, bufnr_with("stage selected range"))
            vim.keymap.set("n", "<leader>gb", gitsigns.stage_buffer, bufnr_with("stage buffer"))
            vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, bufnr_with("unstage hunk"))
            vim.keymap.set("n", "<leader>gt", gitsigns.toggle_deleted, bufnr_with("toggle deleted lines"))
            vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, bufnr_with("preview hunk"))
        end,
    },
}
