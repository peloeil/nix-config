return {
    name = "hlchunk.nvim",
    dir = "@hlchunk_nvim@",
    event = {
        "BufReadPre",
	"BufNewFile"
    },
    config = true
}
