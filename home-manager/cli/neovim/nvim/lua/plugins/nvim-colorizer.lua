return {
    cond = not vim.g.vscode,
    name = "nvim-colorizer.lua",
    dir = "@nvim_colorizer@",
    event = {
        "BufNewFile",
        "BufReadPost",
    },
    -- `require("colorizer").setup({})` does not work ...
    -- so `opts = {}` can't be used.
    config = function(_, _)
        require("colorizer").setup()
    end,
}
