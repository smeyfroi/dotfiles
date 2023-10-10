local Plugin = {'nvim-tree/nvim-web-devicons'}

Plugin.name = 'nvim-web-devicons'

Plugin.config = function ()
  require('nvim-web-devicons').setup()
end

return Plugin
