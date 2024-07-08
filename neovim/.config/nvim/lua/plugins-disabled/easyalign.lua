local Plugin = {'junegunn/vim-easy-align'}

Plugin.name = 'easyalign'

Plugin.keys = {
  {'<leader>a', '<Plug>(EasyAlign)', mode='n'},
  {'<leader>a', '<Plug>(EasyAlign)', mode='x'},
}

return Plugin
