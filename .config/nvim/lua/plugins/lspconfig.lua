-- You need to install depndencies to make it work.
--
-- pacman -S lua-language-server clang pyright rust-analyzer gopls
-- sudo npm install -g typescript typescript-language-server \
--     vscode-langservers-extracted \
--     @tailwindcss/language-server \
--     @vue/language-server @vue/typescript-plugin 
-- cargo install asm-lsp

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
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
