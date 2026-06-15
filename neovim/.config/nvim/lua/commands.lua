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

-- Big file handling: for files larger than `vim.g.bigfile_size` (set in settings.lua),
-- detect the filetype as `bigfile`. Because LSP and treesitter both attach via FileType
-- autocmds keyed on real filetypes (lua, yaml, ...), neither fires for a `bigfile` buffer,
-- which keeps huge files (logs, minified JS, data dumps) responsive. We then fall back to
-- cheap built-in vim syntax based on what the filetype *would* have been.
vim.filetype.add({
  pattern = {
    [".*"] = function(path, buf)
      if not path or vim.bo[buf].filetype == "bigfile" then
        return
      end
      if vim.fn.getfsize(path) > vim.g.bigfile_size then
        return "bigfile"
      end
    end,
  },
})

autocmd("FileType", {
  group = vim.api.nvim_create_augroup("bigfile", { clear = true }),
  pattern = "bigfile",
  callback = function(ev)
    local real_ft = vim.filetype.match({ buf = ev.buf })
    vim.b[ev.buf].bigfile = true
    vim.bo[ev.buf].swapfile = false
    vim.bo[ev.buf].undolevels = -1
    vim.wo.foldmethod = "manual" -- skip treesitter foldexpr on the giant buffer
    vim.wo.spell = false
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(ev.buf) then
        vim.bo[ev.buf].syntax = real_ft or ""
      end
    end)
  end,
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
