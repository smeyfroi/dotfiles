local Plugin = {'nvim-tree/nvim-tree.lua'}

Plugin.config = true

Plugin.keys = {
  {'<tab>', ':NvimTreeToggle<cr>'},
}

return Plugin
