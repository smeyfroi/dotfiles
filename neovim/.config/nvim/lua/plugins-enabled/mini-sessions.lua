local Plugin = {'echasnovski/mini.sessions'}

Plugin.config = function()
  require('mini.sessions').setup({})
end

return Plugin
