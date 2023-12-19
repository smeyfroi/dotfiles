local Plugin = { "williamboman/mason-lspconfig.nvim" }

Plugin.dependencies = {
  { "williamboman/mason.nvim" },
}

Plugin.config = function()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "bashls",
      -- "cfn-lint",
      -- "dockerls",
      "jsonls",
      "lua_ls",
      -- "markdownlint",
      -- "prettier",
      -- "pylint",
      "rubocop",
      "solargraph",
      "tsserver",
      "yamlls",
    },
  })
end

return Plugin
