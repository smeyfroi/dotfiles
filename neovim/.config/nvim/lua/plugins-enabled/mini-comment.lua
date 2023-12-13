local Plugin = {'echasnovski/mini.comment'}

Plugin.name = 'comment'

Plugin.config = function()
  require('mini.comment').setup({})
end

return Plugin
