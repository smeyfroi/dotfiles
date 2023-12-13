local Plugin = {'echasnovski/mini.completion'}

Plugin.name = 'completion'

Plugin.config = function()
  require('mini.completion').setup({})
end

return Plugin
