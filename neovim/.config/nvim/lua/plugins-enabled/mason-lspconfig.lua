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
      "eslint",
      "jsonls",
      -- "lua_ls",
      -- "markdownlint",
      -- "prettier",
      -- "pylint",
      "rubocop",
      "tsserver",
      "yamlls",
    },
  })
end

return Plugin
