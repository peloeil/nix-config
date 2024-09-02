return {
    name = "hop.nvim",
    dir = "@hop_nvim@",
    keys = {
        {
            "f",
            function()
                require("hop").hint_char1()
            end,
            { remap = true },
        },
    },
    opts = {},
}
