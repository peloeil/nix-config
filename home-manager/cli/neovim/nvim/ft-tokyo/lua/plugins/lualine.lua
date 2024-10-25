return {
    name = "lualine.nvim",
    dir = "@lualine_nvim@",
    event = {
        "UIEnter",
    },
    dependencies = {
        name = "nvim-web-devicons",
        dir = "@nvim_web_devicons@",
    },
    opts = {
        options = {
            theme = "iceberg_dark",
        },
    },
}
