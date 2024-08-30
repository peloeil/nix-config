local lazypath = "@lazy_nvim@"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    default = { lazy = true },
    spec = "plugins"
})
