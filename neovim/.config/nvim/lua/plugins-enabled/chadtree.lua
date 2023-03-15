local Plugin = {'ms-jpq/chadtree'}

Plugin.name = 'CHADTree'

Plugin.build = 'python3 -m chadtree deps'

Plugin.keys = {
  {'<leader>f', ':CHADopen<cr>'},
}

Plugin.lazy = false

return Plugin
