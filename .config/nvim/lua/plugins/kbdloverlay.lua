
local M = {}
local buf = nil
local win = nil
local ns_id = vim.api.nvim_create_namespace("kbd_layout_hl")
local timer = nil
local key_listener = nil

local layout_art = {
  "w l y p k z x o u ; [ ] \\",
  " c r s t b f n e i a '",
  "  j v d g q m h / , .",
}

local function clear_hl()
  if buf and vim.api.nvim_buf_is_valid(buf) then
    vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)
  end
end

local function highlight_char(char)
  clear_hl()
  if not buf or not vim.api.nvim_buf_is_valid(buf) or #char ~= 1 then
    return
  end

  local target = char:lower()
  for r, line in ipairs(layout_art) do
    local c = line:find(target, 1, true)
    if c then
      vim.api.nvim_buf_add_highlight(buf, ns_id, "IncSearch", r - 1, c - 1, c)
      if timer then
        timer:stop()
        if not timer:is_closing() then timer:close() end
      end
      timer = vim.uv.new_timer()
      timer:start(1000, 0, vim.schedule_wrap(clear_hl))
      break
    end
  end
end

function M.show()
  if win and vim.api.nvim_win_is_valid(win) then
    return
  end

  buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, layout_art)

  local width = 0
  for _, line in ipairs(layout_art) do
    width = math.max(width, vim.fn.strdisplaywidth(line))
  end
  local height = #layout_art

  local margin = 1
  local row = margin
  local col = vim.o.columns - width - margin

  win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "none",
    focusable = false,
    zindex = 32,
  })

  key_listener = vim.on_key(function(key)
    highlight_char(key)
  end)
end

function M.hide()
  if key_listener then
    vim.on_key(nil, key_listener)
    key_listener = nil
  end
  if timer then
    timer:stop()
    if not timer:is_closing() then timer:close() end
    timer = nil
  end
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
    win, buf = nil, nil
  end
end

vim.api.nvim_create_user_command("KbdLayoutShow", M.show, {})
vim.api.nvim_create_user_command("KbdLayoutHide", M.hide, {})

return M
