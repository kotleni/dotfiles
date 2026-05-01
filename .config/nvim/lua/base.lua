local cfgutils = require('cfgutils')

cfgutils.setTabWidth(4)
vim.o.expandtab = true

-- transparent background
local highlight_groups = {
    "Normal", "NormalNC", "SignColumn", "LineNr", "EndOfBuffer", "MsgArea"
}
for _, group in ipairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end
vim.opt.termguicolors = true

vim.g.mapleader = ','
vim.o.number = true
vim.o.mouse = ''
vim.o.showmode = false
vim.o.breakindent = true
vim.o.cursorline = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 0
vim.opt.relativenumber = true

-- minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10

-- case insensitive searching unless \C or no one capital letter is present
vim.o.ignorecase = true
vim.o.smartcase = true

-- set character to show some whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- sync clipboard between OS and nvim
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- hightlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Inline diagnostic messages 
vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
