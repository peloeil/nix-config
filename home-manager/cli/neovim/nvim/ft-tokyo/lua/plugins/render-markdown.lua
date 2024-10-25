return {
    name = "render-markdown.nvim",
    dir = "@render_markdown_nvim@",
    cond = false,
    event = {
        "BufNewFile *.md",
        "BufReadPost *.md",
    },
    dependencies = {
        { name = "nvim-web-devicons", dir = "@nvim-web-devicons@" },
    },
    opts = {},
}
