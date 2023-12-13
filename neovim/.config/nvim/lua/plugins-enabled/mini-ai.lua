local Plugin = {'echasnovski/mini.ai'}

Plugin.name = 'ai'

Plugin.config = function()
  require('mini.ai').setup({})
end

return Plugin
