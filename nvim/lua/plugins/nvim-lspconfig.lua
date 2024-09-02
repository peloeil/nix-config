local server_list = {
    "nil_ls"
}

return {
    name = "nvim-lspconfig",
    dir = "@nvim_lspconfig@",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lspconfig = require("lspconfig")
        for _, server in ipairs(server_list) do
            lspconfig[server].setup({})
	end

        lspconfig["lua_ls"].setup({
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" }}
                }
            }
        })
    end
}
