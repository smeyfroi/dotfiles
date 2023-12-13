local Plugin = {'echasnovski/mini.move'}

Plugin.name = 'move'

Plugin.config = function()
  require('mini.move').setup({})
end

return Plugin
