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
        "lua_ls",
        "ts_ls",
        "pyright",
        "clangd",
    },
})

-- Root dir for lua_ls
local root_dir = function(...)
    local lua_ls = require("lspconfig.configs.lua_ls").default_config
    local root = lua_ls.root_dir(...)
    -- NOTE: although returning `nil` here does nullify the "rootUri" property lua_ls still
    -- displays the error, I'm not sure if returning an empty string is the correct move as
    -- it generates "rootUri = "file://" but it does seem to quiet lua_ls and make it work
    -- as if it was started in single file mode
    return root and root ~= vim.env.HOME and root or ""
end

vim.lsp.config("lua_ls", {
    root_dir = function(bufnr, cb_root_dir)
        local bname = vim.api.nvim_buf_get_name(bufnr)
        local root = root_dir(#bname > 0 and bname or vim.uv.cwd())
        cb_root_dir(root)
    end,

    settings = {
        Lua = {
            telemetry = { enable = false },
            runtime = { version = "LuaJIT" },

            -- Skip annoying messages about .luarc.json
            workspace = { checkThirdParty = false },

            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
        },
    },
})
vim.lsp.config("ts_ls", {})
vim.lsp.config("pyright", {})
vim.lsp.config("clangd", {})

vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "pyright",
    "clangd",
})

