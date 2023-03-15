local Plugin = {'akinsho/toggleterm.nvim'}

Plugin.name = 'toggleterm'

Plugin.opts = {
  open_mapping = [[<c-\>]],
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
}

return Plugin
