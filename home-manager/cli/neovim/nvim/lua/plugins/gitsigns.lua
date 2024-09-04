return {
    name = "gitsigns.nvim",
    dir = "@gitsigns_nvim@",
    event = {
        "BufWinEnter",
    },
    opts = {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")
            local opts = { buffer = bufnr }
            -- stage
            vim.keymap.set("n", "<leader>gsh", gitsigns.stage_hunk, opts)
            vim.keymap.set("n", "<leader>gsh", function()
                gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, opts)
            vim.keymap.set("n", "<leader>gsb", gitsigns.stage_buffer, opts)
            -- reset
            vim.keymap.set("n", "<leader>grh", gitsigns.reset_hunk, opts)
            vim.keymap.set("n", "<leader>grh", gitsigns.reset_hunk, opts)
            vim.keymap.set("n", "<leader>grb", gitsigns.reset_buffer, opts)
        end,
    },
}
