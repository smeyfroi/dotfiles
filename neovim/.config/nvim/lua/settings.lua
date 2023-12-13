-- vim.opt.background = 'dark'

-- Show matching parentheses
vim.opt.showmatch = true

-- Ignore case when searching
vim.opt.ignorecase = true
-- Ignore case if search pattern is all lowercase, case-sensitive otherwise
vim.opt.smartcase = true

-- Show line numbers
vim.opt.number = true

-- Use the pretty colors
vim.opt.termguicolors = true

-- Show cursor line
vim.opt.cursorline = true
-- Show cursor column
vim.opt.cursorcolumn = true

-- Enable mouse support
-- vim.opt.mouse = 'a'

-- Set window title
vim.opt.title = true

-- Save undo history
vim.opt.undofile = true

-- Setup tab width
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.copyindent = true

vim.cmd('set list')
vim.cmd([[set listchars=tab:▷\ ,trail:·,extends:◣,precedes:◢,nbsp:○]])

---- Set by mini.completion
-- Insert mode completion setting
-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.guifont = "EssentialPragmataPro Nerd Font:h14"

-- Always display signcolumn (for diagnostic related stuff)
vim.opt.signcolumn = 'yes'

-- vim.diagnostic.config({
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
--   underline = true,
--   severity_sort = true,
--   float = {
--     focusable = false,
--     style = 'minimal',
--     border = 'rounded',
--     source = 'always',
--     header = '',
--     prefix = '',
--   }
-- })

-- highlight yank https://neovim.io/doc/user/lua.html#lua-highlight {{{
vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

-- folds
-- set foldmethod=manual " or expr to use TS
-- " set foldexpr=nvim_treesitter#foldexpr()
-- " autocmd BufReadPost,FileReadPost * normal zR
