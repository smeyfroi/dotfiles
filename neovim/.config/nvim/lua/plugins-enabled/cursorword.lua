local Plugin = {'echasnovski/mini.cursorword'}

Plugin.name = 'cursorword'

Plugin.config = function()
  require('mini.cursorword').setup({})
end

return Plugin
