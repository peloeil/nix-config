return {
    name = "alpha-nvim",
    dir = "@alpha_nvim@",
    dependencies = {
        { name = "nvim-web-devicons", dir = "@nvim_web_devicons@" },
    },
    event = {
        "VimEnter",
    },
    opts = function(_, _)
        return require("alpha.themes.startify").config
    end,
}
