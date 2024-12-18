local Plugin = {
  "Tsuzat/NeoSolarized.nvim",
  lazy = false,
  priority = 1000, -- load before any plugin that might set colours
  config = function()
    require("NeoSolarized").setup({
      style = "dark", -- "dark" or "light"
      transparent = true, -- true/false; Enable this to disable setting the background color
    })
    vim.cmd.colorscheme "NeoSolarized"
  end
}

return Plugin
