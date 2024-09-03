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
            mv = function(src_path, dest_path)
                return true
            end,
            rm = function(path)
                return true
            end,
        },
        float = {
            preview_split = "right",
        },
    },
}
