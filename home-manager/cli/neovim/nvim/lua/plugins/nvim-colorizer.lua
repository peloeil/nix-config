return {
    name = "nvim-colorizer.lua",
    dir = "@nvim_colorizer@",
    event = {
        "BufNewFile",
        "BufReadPre"
    },
    -- `require("colorizer").setup({})` does not work ...
    -- so `opts = {}` can't be used.
    config = function()
        require("colorizer").setup()
    end,
}