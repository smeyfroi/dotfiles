local Plugin = {'echasnovski/mini.starter'}

Plugin.name = 'starter'

Plugin.config = function()
  require('mini.starter').setup({})
end

return Plugin
