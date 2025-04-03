local Plugin = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = "auto",
      globalstatus = vim.o.laststatus == 3,
      disabled_filetypes = { statusline = { "snacks_dashboard" } },
    },
    sections = {
      -- lualine_a = {
      --   {
      --     'filetype',
      --     colored = false,   -- Displays filetype icon in color if set to true
      --     icon_only = true, -- Display only an icon for filetype
      --     icon = { align = 'right' }, -- Display filetype icon on the right hand side
      --   }
      -- },
      lualine_a = { { "mode", fmt = function(str) return str:sub(1,1) end } },
      lualine_b = { "branch" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = {
        {
          require("noice").api.status.message.get_hl,
          cond = require("noice").api.status.message.has,
        },
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.mode.get,
          cond = require("noice").api.status.mode.has,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.search.get,
          cond = require("noice").api.status.search.has,
          color = { fg = "#ff9e64" },
        },
        { "diagnostics" },
      },
    },
  },
  extensions = { "neo-tree", "lazy" },
}

return Plugin
