return {
    name = "render-markdown.nvim",
    dir = "@render_markdown_nvim@",
    event = {
        "BufNewFile *.md",
        "BufReadPost *.md",
    },
    dependencies = {
        { name = "nvim-web-devicons", dir = "@nvim-web-devicons@" },
    },
    opts = {},
}
