-- Dependencies required:
-- pacman -S tree-sitter ripgrep fd rustup npm
-- brew install tree-sitter ripgrep fd npm rustup
-- rustup component add rust-analyzer rust-src clippy rustfmt

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

require("lazy").setup({
  "ellisonleao/gruvbox.nvim",
  "nvim-tree/nvim-web-devicons",

  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  "mason-org/mason.nvim",
  { "mason-org/mason-lspconfig.nvim", dependencies = { "neovim/nvim-lspconfig" } },
  "esmuellert/nvim-eslint",

  "windwp/nvim-autopairs",
  "norcalli/nvim-colorizer.lua",

  {
    "Saghen/blink.cmp",
    dependencies = { "Saghen/blink.lib" },
    build = "cargo build --release",
  },

  "nvim-lualine/lualine.nvim",
  "lewis6991/gitsigns.nvim",

  { "vyfor/cord.nvim", lazy = true },
})

-- Local plugins
require('plugins.hope')

-- Plugins configs
require('plugins.theme')
require('plugins.autopairs')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.mason')
require('plugins.lspconfig')
require('plugins.blink')
require('plugins.lualine')
require('plugins.eslint')
require('plugins.discord')
