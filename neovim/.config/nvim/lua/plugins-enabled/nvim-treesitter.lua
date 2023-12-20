local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.build = ":TSUpdate"

Plugin.config = function()
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    ensure_installed = {
      -- "lua",
      "typescript",
      "ruby",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return Plugin
