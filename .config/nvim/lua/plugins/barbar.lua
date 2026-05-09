vim.g.barbar_auto_setup = false
require("barbar").setup({
  animation = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  -- Valid options are 'left' (the default), 'previous', and 'right'
  focus_on_close = 'left',

  hide = {extensions = false, inactive = false},

  minimum_padding = 0,
  maximum_padding = 1,
  maximum_length  = 30,

  icons = {
    buffer_index = false,
    buffer_number = false,
    button = '',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
    },
    gitsigns = {
      added = {enabled = false, icon = '+ '},
      changed = {enabled = false, icon = '* '},
      deleted = {enabled = false, icon = '- '},
    },
    separator = {left = '[', right = ']'},

    separator_at_end = false,

    modified = {button = '●'},
    pinned = {button = '', filename = true},

    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },

  sidebar_filetypes = {   -- Set the filetypes which barbar will offset itself for
    -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
    NvimTree = true,
    -- Or, specify the text used for the offset:
    undotree = {
      text = 'undotree',
      align = 'left', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
    },
    -- Or, specify the event which the sidebar executes when leaving:
    ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify all three
    Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
  },
})
