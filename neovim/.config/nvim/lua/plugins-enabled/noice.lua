-- NOTE: there is noice config to show @recording messages in the lualine setup

local Plugin = {
  "folke/noice.nvim",
  dependencies = {
    {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
  },
  config = true,
}

return Plugin
