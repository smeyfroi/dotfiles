local Plugin = {'echasnovski/mini.surround'}

Plugin.name = 'surround'

Plugin.config = function ()
  require('mini.surround').setup()
end

return Plugin
