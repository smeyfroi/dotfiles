local Plugin = { "williamboman/mason-lspconfig.nvim" }

Plugin.dependencies = {
  { "williamboman/mason.nvim" },
}

Plugin.config = function()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "bashls",
      -- "eslint_d",
      "jsonls",
      "lua_ls",
      "rubocop",
      "ts_ls",
      "ruby_lsp",
    },
  })
end

return Plugin
