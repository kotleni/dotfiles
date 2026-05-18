require('cord').setup({
    editor = {
        client = 'neovim',
        tooltip = 'Lua powered, btw!',
        icon = nil,
      },
      display = {
        theme = 'void',
        flavor = 'dark',
        view = 'full',
        swap_fields = false,
        swap_icons = false,
      },
      timestamp = {
        enabled = true,
        reset_on_idle = false,
        reset_on_change = false,
        shared = false,
      },
      idle = {
        enabled = true,
        timeout = 300000,
        show_status = true,
        ignore_focus = true,
        unidle_on_focus = true,
        smart_idle = true,
        details = 'Idling',
        state = nil,
        tooltip = '💤',
        icon = nil,
      },
})

