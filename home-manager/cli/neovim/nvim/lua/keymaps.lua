local opt = { silent = true }
-- insert mode keymaps
vim.keymap.set("i", "jj", "<esc>", opt)
vim.keymap.set("i", "<C-h>", "<left>", opt)
vim.keymap.set("i", "<C-j>", "<down>", opt)
vim.keymap.set("i", "<C-k>", "<up>", opt)
vim.keymap.set("i", "<C-l>", "<right>", opt)
vim.keymap.set("i", "<C-s>", "<cmd>w<cr>", opt)

-- normal mode keymaps
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", opt)
vim.keymap.set("n", "j", "gj", opt)
vim.keymap.set("n", "k", "gk", opt)
vim.keymap.set("n", "<leader><esc>", "<cmd>nohlsearch<cr>", opt)

-- terminal mode keymaps
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("__terminal_mode", {}),
    callback = function()
        vim.cmd("startinsert")
        vim.wo.number = false
        vim.wo.relativenumber = false
    end,
})
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", opt)
vim.keymap.set("t", "<C-w><C-h>", "<cmd>wincmd h<cr>", opt)
vim.keymap.set("t", "<C-w><C-j>", "<cmd>wincmd j<cr>", opt)
vim.keymap.set("t", "<C-w><C-k>", "<cmd>wincmd k<cr>", opt)
vim.keymap.set("t", "<C-w><C-l>", "<cmd>wincmd l<cr>", opt)
vim.keymap.set("t", "<C-w>h", "<cmd>wincmd h<cr>", opt)
vim.keymap.set("t", "<C-w>j", "<cmd>wincmd j<cr>", opt)
vim.keymap.set("t", "<C-w>k", "<cmd>wincmd k<cr>", opt)
vim.keymap.set("t", "<C-w>l", "<cmd>wincmd l<cr>", opt)
