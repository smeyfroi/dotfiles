local Plugin = {'echasnovski/mini.sessions'}

Plugin.name = 'sessions'

Plugin.config = function()
  require('mini.sessions').setup({})
end

return Plugin
