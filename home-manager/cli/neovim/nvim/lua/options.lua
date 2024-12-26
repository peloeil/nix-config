-- display line number
vim.opt.number = true
vim.opt.numberwidth = 5
--vim.opt.relativenumber = true

-- search options
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.expandtab = not @useFtTokyo@
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
if @useFtTokyo@ then
    vim.opt.tabstop = 4
    vim.opt.list = true
    vim.opt.listchars = { tab = "<->", trail = "-" }
end

-- enconding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"

-- scroll off
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

-- transparency
vim.opt.winblend = 20
vim.opt.pumblend = 20

-- others
vim.opt.cursorline = true
vim.opt.loadplugins = false
vim.opt.showbreak = "> "
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.wildignorecase = true

vim.api.nvim_create_autocmd({ "BufNewfile", "BufReadPre" }, {
    group = vim.api.nvim_create_augroup("__matchpairs", {}),
    pattern = { "*.c", "*.cpp", "*.hpp", "*.rs" },
    callback = function()
        vim.opt.matchpairs:append("<:>")
        vim.opt.matchpairs:append("=:;")
    end,
})
