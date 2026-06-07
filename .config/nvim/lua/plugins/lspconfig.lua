local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("ts_ls", {})
vim.lsp.config("pyright", {})
vim.lsp.config("clangd", {})

vim.lsp.config("asm_lsp", {
    root_markers = { ".asm-lsp.toml", ".git" },
})

vim.lsp.config("rust_analyzer", {
    root_markers = { "Cargo.toml" },
    capabilities = capabilities,
    initialization_options = {},
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
        },
    },
})


vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "pyright",
    "clangd",
    "rust_analyzer",
}) 
