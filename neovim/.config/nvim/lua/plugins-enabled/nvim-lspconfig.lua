local Plugin = { "neovim/nvim-lspconfig" }

Plugin.dependencies = {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "saghen/blink.cmp" },
}

Plugin.config = function()
  local lspconfig = require("lspconfig")
  local capabilities = require('blink.cmp').get_lsp_capabilities()
  lspconfig.bashls.setup({ capabilities = capabilities })
  lspconfig.jsonls.setup({ capabilities = capabilities })
  lspconfig.lua_ls.setup({ capabilities = capabilities })
  lspconfig.ruby_lsp.setup({ capabilities = capabilities })
  lspconfig.ts_ls.setup({ capabilities = capabilities })
  lspconfig.yamlls.setup({
    capabilities = capabilities,
    settings = {
      yaml = {
        format = {
          enable = false,
        },
        hover = true,
        completion = true,
        customTags = {
          "!Fn",
          "!And",
          "!If",
          "!Not",
          "!Equals",
          "!Or",
          "!FindInMap Sequence",
          "!Base64",
          "!Cidr",
          "!Ref",
          "!Ref Scalar",
          "!Sub",
          "!Sub Sequence",
          "!GetAtt",
          "!GetAZs",
          "!ImportValue",
          "!Select",
          "!Split",
          "!Join Sequence",
        },
      },
    },
  })

end

return Plugin
