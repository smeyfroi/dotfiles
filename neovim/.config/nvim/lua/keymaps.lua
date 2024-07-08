-- Bind options
local bind = vim.keymap.set
-- local remap = {remap = true}

-- Clear search with <esc>
-- vim.api.nvim_set_keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
-- -- Clear search highlights
vim.api.nvim_set_keymap('n', '<Leader>/', ':nohlsearch<CR>', { desc = "Clear hlsearch" })

-- Copy to system clipboard in visual mode with Ctrl-C
bind('v', '<C-c>', '"+y')

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { desc = "Go to Left Window"}) --, remap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { desc = "Go to Lower Window"}) --, remap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { desc = "Go to Upper Window"}) --, remap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { desc = "Go to Right Window"}) --, remap = true })

-- Window resize
vim.api.nvim_set_keymap("n", "<M-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.api.nvim_set_keymap("n", "<M-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.api.nvim_set_keymap("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
vim.api.nvim_set_keymap("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Maintain visual selection on indent in visual mode
bind('v', '>', '>gv')
bind('v', '<', '<gv')

-- Word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { desc = "Up", noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { desc = "Down", noremap = true, expr = true, silent = true })

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

