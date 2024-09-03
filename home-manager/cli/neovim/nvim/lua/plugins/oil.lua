return {
    name = "oil.nvim",
    dir = "@oil_nvim@",
    keys = {
        {
            "-",
            function()
                require("oil").open()
            end,
        },
        {
            "<leader>-",
            function()
                require("oil").open_float()
            end,
        },
    },
    dependencies = {
        name = "nvim-web-devicons",
        dir = "@nvim_web_devicons@",
    },
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
        git = {
            mv = function(_, _)
                return true
            end,
            rm = function(_)
                return true
            end,
        },
        float = {
            preview_split = "right",
        },
    },
}
