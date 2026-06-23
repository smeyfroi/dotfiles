-- See https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
-- opt.completeopt = "menu,menuone,noselect" ---- Set by mini.completion
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorcolumn = true -- Enable highlighting of the current column
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
-- opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
vim.cmd([[set listchars=tab:▷\ ,trail:·,extends:◣,precedes:◢,nbsp:○]])
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = true -- Show mode now that lualine is not used
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.spelloptions:append("noplainbuffer")
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
-- opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
-- opt.winborder = 'rounded'

opt.smoothscroll = true
opt.foldmethod = "expr" -- decide folds from an expression...
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- ...namely treesitter's structural folds
opt.foldtext = "" -- show the fold's first line verbatim (with its normal highlights)
opt.foldlevelstart = 99 -- open every buffer fully unfolded; you fold on demand
opt.foldcolumn = "0" -- a custom statuscolumn (below) draws a single fold glyph instead

-- Reuse the glyphs from 'fillchars' rather than embedding them here (private-use
-- glyphs don't survive being typed inline, and this keeps the gutter consistent).
local _fcs = vim.opt.fillchars:get()
local FOLD_CLOSED = _fcs.foldclose or ">"
local FOLD_OPEN = _fcs.foldopen or "v"

-- Minimal native-fold UI: one gutter glyph, never any depth info.
--   • a CLOSED fold always shows the closed glyph (content is hidden here)
--   • an OPEN fold shows the open glyph only on the cursor line, an unobtrusive
--     "you can fold here" hint that follows the cursor (relies on cursorline)
-- To make it sparser, delete the open-fold block; to always show open folds,
-- drop the `vim.v.relnum == 0` test.
function _G.fold_marker()
  local lnum = vim.v.lnum
  if vim.v.virtnum ~= 0 then -- wrapped/virtual line
    return " "
  end
  if vim.fn.foldclosed(lnum) == lnum then -- first line of a closed fold
    return FOLD_CLOSED
  end
  if vim.v.relnum == 0 and vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1) then
    return FOLD_OPEN -- a fold starts here and the cursor is on this line
  end
  return " "
end

-- statuscolumn replaces the whole gutter: signs (%s), line number (%l), fold glyph
opt.statuscolumn = "%s%=%l %{v:lua.fold_marker()}"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.diagnostic.config({
  float = {
    border = "rounded",
    source = "if_many",
  },
  virtual_lines = false,
  virtual_text = {
    current_line = true,
    source = "if_many",
    spacing = 2,
    virt_text_pos = "eol_right_align",
  },
})

-- From https://gpanders.com/blog/whats-new-in-neovim-0-11/#builtin-auto-completion
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })

opt.guifont = "Iosevka Nerd Font Mono:h14"
