return {
    name = "hlchunk.nvim",
    dir = "@hlchunk_nvim@",
    event = {
        "BufNewFile",
        "BufReadPost",
    },
    opts = {
        chunk = {
            enable = true,
        },
        indent = {
            enable = true,
            chars = {
                "│",
            },
            style = {
                "#FF0000",
                "#FF7F00",
                "#FFFF00",
                "#00FF00",
                "#00FFFF",
                "#0000FF",
                "#8B00FF",
            },
        },
        -- It seems blank settings do not work for now.
        -- reference: https://github.com/shellRaining/hlchunk.nvim/issues/123
        blank = {
            enable = false,
            style = {
                { bg = "#434437" },
                { bg = "#2f4440" },
                { bg = "#433054" },
                { bg = "#284251" },
            },
        },
    },
}
