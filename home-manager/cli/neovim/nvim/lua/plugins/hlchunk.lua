return {
    name = "hlchunk.nvim",
    dir = "@hlchunk_nvim@",
    event = {
        "BufWinEnter",
    },
    opts = {
        chunk = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        -- It seems blank settings do not work for now.
        -- reference: https://github.com/shellRaining/hlchunk.nvim/issues/123
        blank = {
            enable = true,
            chars = { " " },
            style = {
                { bg = "#434437" },
                { bg = "#2f4440" },
                { bg = "#433054" },
                { bg = "#284251" },
            },
        },
    },
}
