return {
    name = "lazydev.nvim",
    dir = "@lazydev_nvim@",
    event = {
        "BufNewFile *.lua",
        "BufReadPost *.lua",
    },
    opts = {},
}
