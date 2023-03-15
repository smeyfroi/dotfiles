local Plugin = {'moll/vim-bbye'}

Plugin.name = 'vim-bbye'

Plugin.config = function()
  vim.cmd('com! Bdeleteall :bufdo :Bdelete')
end

Plugin.keys = {
  {'<leader>q', ':Bdelete<cr>'},
}

return Plugin
