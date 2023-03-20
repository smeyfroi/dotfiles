local Plugin = {'echasnovski/mini.animate'}

Plugin.name = 'animate'

Plugin.config = function ()
  require('mini.animate').setup()
end

return Plugin
