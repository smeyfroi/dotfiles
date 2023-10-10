-- Doesn't work?
local Plugin = {'folke/neodev.nvim'}

Plugin.name = 'neodev'

Plugin.config = function ()
  require('neodev').setup({})
end

return Plugin
