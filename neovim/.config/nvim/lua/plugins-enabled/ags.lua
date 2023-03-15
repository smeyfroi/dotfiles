local Plugin = {'gabesoft/vim-ags'}

Plugin.name = 'ags'

Plugin.config = function()
  vim.cmd([[autocmd BufNewFile,BufRead,BufEnter *.agsv set filetype=agsv]])
end

return Plugin
