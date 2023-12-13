local Plugin = {'echasnovski/mini.splitjoin'}

Plugin.name = 'splitjoin'

Plugin.config = function()
  require('mini.splitjoin').setup({})
end

return Plugin
