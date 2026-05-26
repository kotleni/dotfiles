local function show_hope_snippet()
  local filepath = vim.fn.expand("~/.config/nvim/hope.txt")

  local file = io.open(filepath, "r")
  if not file then
    vim.notify("Could not open " .. filepath, vim.log.levels.ERROR)
    return
  end

  local text_lines = {}
  for line in file:lines() do
    table.insert(text_lines, line)
  end
  file:close()

  if #text_lines == 0 then return end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, text_lines)

  local height = #text_lines
  local width = 0
  for _, line in ipairs(text_lines) do
    width = math.max(width, vim.fn.strdisplaywidth(line))
  end

  local win = vim.api.nvim_open_win(buf, false, {
    relative = "cursor",
    row = 1,
    col = 0,
    width = math.max(width, 1),
    height = math.max(height, 1),
    style = "minimal",
    border = "rounded",
  })

  local autocmd
  autocmd = vim.api.nvim_create_autocmd({ "InsertLeave", "CursorMoved" }, {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      vim.api.nvim_del_autocmd(autocmd)
    end,
  })
end

vim.api.nvim_create_user_command("ShowHope", show_hope_snippet, {})
vim.keymap.set("n", "<leader>hh", show_hope_snippet, { desc = "Show hope snippet" })
