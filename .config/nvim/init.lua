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
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 99,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
    },
    {
        'nvim-telescope/telescope.nvim',
        enabled = true,
        event = 'VimEnter',
        requires = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
    },
--     {
--         dir = vim.fn.stdpath("config") .. "/localplugins/mason.nvim",
--         name = "mason.nvim",
--         lazy = false,
--     },
--     {
--         "williamboman/mason-lspconfig.nvim",
--         lazy = false,
--     },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
    {
        "esmuellert/nvim-eslint",
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
    {
        "saghen/blink.cmp",
        dependencies = { 'saghen/blink.lib' },
        build = function()
            require('blink.cmp').build():wait(4000)
        end,
        lazy = false,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = false,
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
    },
    {
        "vyfor/cord.nvim",
        lazy = true,
    },
})

-- Local plugins
require('plugins.hope')

-- Plugins configs
require('plugins.theme')
require('plugins.markdown-render')
require('plugins.autopairs')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lspconfig')
require('plugins.blink')
require('plugins.lualine')
require('plugins.eslint')
require('plugins.discord')
