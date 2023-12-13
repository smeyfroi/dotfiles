local Plugin = {'echasnovski/mini.jump2d'}

Plugin.name = 'jump2d'

Plugin.config = function()
  require('mini.jump2d').setup({})
end

return Plugin
