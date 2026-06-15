local command = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
})

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.template",
  command = "setlocal filetype=yaml.cloudformation",
})

command(
  'StripTrailingWhitespace',
  function()
    -- Save cursor position to later restore
    local curpos = vim.api.nvim_win_get_cursor(0)
    -- Search and replace trailing whitespace
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, curpos)
  end,
  { desc = "Strip trailing whitespace" }
)

-- Highlight on yank
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
