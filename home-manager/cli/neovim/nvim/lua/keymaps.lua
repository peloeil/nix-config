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
