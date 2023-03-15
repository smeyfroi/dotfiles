local Plugin = {'zirrostig/vim-schlepp'}

Plugin.name = 'schlepp'

Plugin.keys = {
  {'<up>',     '<Plug>SchleppUp', mode='v'},
  {'<down>',   '<Plug>SchleppDown', mode='v'},
  {'<left>',   '<Plug>SchleppLeft', mode='v'},
  {'<right>',  '<Plug>SchleppRight', mode='v'},
  {'<S-up>',   '<Plug>SchleppIndentUp', mode='v'},
  {'<S-down>', '<Plug>SchleppIndentDown', mode='v'},
  {'<C-D>',    '<Plug>SchleppDupDown', mode='v'},
}

return Plugin
