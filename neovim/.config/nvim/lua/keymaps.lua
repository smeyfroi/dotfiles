-- Bind options
local bind = vim.keymap.set
-- local remap = {remap = true}

vim.api.nvim_set_keymap('n', '<Leader>/', ':nohlsearch<CR>', { desc = "Clear hlsearch" })

-- Copy to system clipboard in visual mode with Ctrl-C
bind('v', '<C-c>', '"+y')

-- CONFLICTS with MacOS switch workspaces
-- Window navigation
-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { desc = "Go to Left Window"}) --, remap = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { desc = "Go to Lower Window"}) --, remap = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { desc = "Go to Upper Window"}) --, remap = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { desc = "Go to Right Window"}) --, remap = true })

-- CONFLICTS with mini.move
-- Window resize
-- vim.api.nvim_set_keymap("n", "<M-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- vim.api.nvim_set_keymap("n", "<M-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- vim.api.nvim_set_keymap("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
-- vim.api.nvim_set_keymap("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Maintain visual selection on indent in visual mode
bind('v', '>', '>gv')
bind('v', '<', '<gv')

-- better up/down
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.api.nvim_set_keymap("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Close quickfix
vim.api.nvim_set_keymap('n', '<Leader>c', ':cclose<CR>', { desc = "Close quickfix" })

-- Supercharged dot formula
vim.api.nvim_set_keymap('n', '<leader>;', '*``cgn', { desc = "Supercharged dot formula forward" })
vim.api.nvim_set_keymap('n', '<leader>,', '#``cgN', { desc = "Supercharged dot formula backwards" })
