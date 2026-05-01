require('base')
require('binds')

-- load lazy vim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        enabled = true,
        event = 'VimEnter',
        requires = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
    },
    {
        "mason-org/mason.nvim",
        lazy = false,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
    {
        "romgrk/barbar.nvim",
        lazy = false,
    },
    {
        "windwp/nvim-autopairs",
        lazy = false,
    },
    {
        "norcalli/nvim-colorizer.lua",
        lazy = false,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = false,
    },
})

-- vim.lsp.enable('pyright')

-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(args)
--         vim.o.signcolumn = 'yes:1'
--         local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--         if client:supports_method('textDocument/completion') then
--             vim.o.complete = 'o,.,w,b,u'
--             vim.o.completeopt = 'menu,menuone,popup,noinsert'
--             vim.lsp.completion.enable(true, client.id, args.buf)
--         end
--     end
-- })

-- Plugins
require('plugins.markdown-render')
require('plugins.barbar')
require('plugins.autopairs')
require('plugins.neotree')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.mason')
