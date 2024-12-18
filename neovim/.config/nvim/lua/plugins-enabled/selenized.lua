return {
  "calind/selenized.nvim",
  name = 'selenized',
  lazy = false,
  priority = 1000, -- load before any plugin that might set colours
  config = function()
    vim.cmd.colorscheme "selenized"
  end,
}
