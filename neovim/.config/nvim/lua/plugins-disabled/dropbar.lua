local Plugin = {'Bekaboo/dropbar.nvim'}

Plugin.name = 'dropbar'

Plugin.config = function ()
  require('dropbar').setup()
end

return Plugin
