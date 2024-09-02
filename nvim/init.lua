vim.loader.enable()

local lazypath = "@lazy_nvim@"
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("lazy").setup({
    defaults = { lazy = true },
    spec = "plugins",
})
require("options")
require("keymaps")
