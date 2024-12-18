
-- Bind options
local bind = vim.keymap.set
-- local remap = {remap = true}

-- -- Clear search highlights
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

-- Buffer navigation
vim.api.nvim_set_keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.api.nvim_set_keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Open lines above and below cursor
blank_above = function()
    local repeated = vim.fn["repeat"]({""}, vim.v.count1)
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line-1, line-1, true, repeated)
end
blank_below = function()
    local repeated = vim.fn["repeat"]({""}, vim.v.count1)
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line, line, true, repeated)
end
vim.api.nvim_set_keymap("n", "[ ", "<cmd>lua blank_above()<CR>", { desc = "Open new lines above" })
vim.api.nvim_set_keymap("n", "] ", "<cmd>lua blank_below()<CR>", { desc = "Open new lines below" })

-- LSP diagnostics here for now
bind('n', '<space>d', vim.diagnostic.open_float)
bind('n', '[d', vim.diagnostic.goto_prev)
bind('n', ']d', vim.diagnostic.goto_next)
bind('n', '<space>q', vim.diagnostic.setloclist)

