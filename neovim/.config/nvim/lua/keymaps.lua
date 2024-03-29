-- Bind options
local bind = vim.keymap.set
-- local remap = {remap = true}

-- Clear search highlights
bind('n', '<Leader>/', ':nohlsearch<CR>')

-- Copy to system clipboard in visual mode with Ctrl-C
bind('v', '<C-c>', '"+y')

-- Window navigation
bind('n', '<C-h>', '<C-w>h')
bind('n', '<C-j>', '<C-w>j')
bind('n', '<C-k>', '<C-w>k')
bind('n', '<C-l>', '<C-w>l')

-- Window resize
-- bind('n', '<M-l>', ':vertical resize +5<CR>')
-- bind('n', '<M-h>', ':vertical resize -5<CR>')
-- bind('n', '<M-k>', ':resize -5<CR>')
-- bind('n', '<M-j>', ':resize +5<CR>')

-- Maintain visual selection on indent in visual mode
bind('v', '>', '>gv')
bind('v', '<', '<gv')

-- Word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Close quickfix
bind('n', '<Leader>c',':cclose<CR>')

-- Supercharged dot formula
bind('n', '<leader>;', '*``cgn')
bind('n', '<leader>,', '#``cgN')

-- LSP diagnostics here for now
bind('n', '<space>d', vim.diagnostic.open_float)
bind('n', '[d', vim.diagnostic.goto_prev)
bind('n', ']d', vim.diagnostic.goto_next)
bind('n', '<space>q', vim.diagnostic.setloclist)

