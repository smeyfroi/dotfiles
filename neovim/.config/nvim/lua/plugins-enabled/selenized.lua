local Plugin = {'calind/selenized.nvim'}

Plugin.name = 'selenized'

Plugin.lazy = false

Plugin.priority = 1000 -- load before any plugin that might set colours

Plugin.config = function()
  vim.cmd.colorscheme "selenized"
end

return Plugin

