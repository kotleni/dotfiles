require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})

vim.api.nvim_set_keymap("n", "<leader>t", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Auto-close neotree on select
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.bo.buftype == '' then
      vim.cmd('Neotree close')
    end
  end,
})

