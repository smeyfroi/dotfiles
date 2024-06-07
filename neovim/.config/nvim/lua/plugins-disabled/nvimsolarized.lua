local Plugin = {'ishan9299/nvim-solarized-lua'}

Plugin.name = 'nvim-solarized'

Plugin.lazy = false

Plugin.priority = 1000 -- load before any plugin that might set colours

Plugin.config = function()
  vim.cmd([[colorscheme solarized]])
end

return Plugin

