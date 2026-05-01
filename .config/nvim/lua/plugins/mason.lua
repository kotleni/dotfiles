local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
    ensure_installed = {
        "ts_ls",
        "pyright",
        "clangd",
    },
})


vim.lsp.config("ts_ls", {})
vim.lsp.config("pyright", {})
vim.lsp.config("clangd", {})

vim.lsp.enable({
    "ts_ls",
    "pyright",
    "clangd",
})
