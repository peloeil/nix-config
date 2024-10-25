return {
    name = "toggleterm.nvim",
    dir = "@toggleterm_nvim@",
    version = "*",
    keys = {
        { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", silent = true },
        { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", silent = true },
        { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", silent = true },
    },
    opts = function(_, _)
        -- terminal mode keymaps
        vim.api.nvim_create_autocmd("TermOpen", {
            group = vim.api.nvim_create_augroup("__terminal_mode", {}),
            callback = function()
                vim.cmd("startinsert")
                vim.wo.number = false
                vim.wo.relativenumber = false
            end,
        })
        local opt = { silent = true }
        vim.keymap.set("t", "<esc>", "<C-\\><C-n>", opt)
        vim.keymap.set("t", "<C-w><C-h>", "<cmd>wincmd h<cr>", opt)
        vim.keymap.set("t", "<C-w><C-j>", "<cmd>wincmd j<cr>", opt)
        vim.keymap.set("t", "<C-w><C-k>", "<cmd>wincmd k<cr>", opt)
        vim.keymap.set("t", "<C-w><C-l>", "<cmd>wincmd l<cr>", opt)
        vim.keymap.set("t", "<C-w>h", "<cmd>wincmd h<cr>", opt)
        vim.keymap.set("t", "<C-w>j", "<cmd>wincmd j<cr>", opt)
        vim.keymap.set("t", "<C-w>k", "<cmd>wincmd k<cr>", opt)
        vim.keymap.set("t", "<C-w>l", "<cmd>wincmd l<cr>", opt)
        return {
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 0.4
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            float_opts = {
                border = "double",
            },
        }
    end,
}
