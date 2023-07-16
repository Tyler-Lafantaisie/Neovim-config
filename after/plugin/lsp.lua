require("mason").setup({
     ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver" },
})

require("lspconfig").lua_ls.setup{
    on_attach = on_attach,
    capabilities = capabilites,
}




