-- NOTE: there is noice config to show @recording messages in the lualine setup

return {
  "folke/noice.nvim",
  dependencies = {
    {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
  },
  opts = {
    presets = {
      lsp_doc_border = true,
    }
  },
  config = function(_, opts)
    -- HACK: noice shows messages from before it was enabled,
    -- but this is not ideal when Lazy is installing plugins,
    -- so clear the messages in this case.
    if vim.o.filetype == "lazy" then
      vim.cmd([[messages clear]])
    end
    require("noice").setup(opts)
  end,
}
