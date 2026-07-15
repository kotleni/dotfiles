local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vim.fn.system("npm root -g"):gsub("\n", "") .. "/@vue/typescript-plugin",                
                languages = { "javascript", "typescript", "vue" },
            },
        },
    },
    filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "vue",
    },
})

vim.lsp.config("vue_ls", {
    filetypes = { "vue" },
})

vim.lsp.config("cssls", {
    capabilities = capabilities,
})

vim.lsp.config("tailwindcss", {
    capabilities = capabilities,
})

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

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            semanticTokens = false,
        },
    },
})

require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "ts_ls",
        "vue_ls",
        "cssls",
        "tailwindcss",
        "pyright",
        "clangd",
        "rust_analyzer",
        "gopls",
    },
}

vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "vue_ls",
    "cssls",
    "tailwindcss",
    "pyright",
    "clangd",
    "rust_analyzer",
    "gopls",
})

vim.filetype.add({
  extension = {
    vsh = 'glsl',
    fsh = 'glsl',
    gsh = 'glsl',
  },
})
