return {
    name = "lualine.nvim",
    dir = "@lualine_nvim@",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = {
        name = "nvim-web-devicons",
        dir = "@nvim_web_devicons@",
    },
    opts = {
        options = {
            theme = "gruvbox_dark",
        },
    },
}
