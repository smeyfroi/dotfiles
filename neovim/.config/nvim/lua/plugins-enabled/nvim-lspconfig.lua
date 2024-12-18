local Plugin = { "neovim/nvim-lspconfig" }

Plugin.dependencies = {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
}

Plugin.config = function()
  local lspconfig = require("lspconfig")
  lspconfig.bashls.setup({})
  lspconfig.jsonls.setup({})
  lspconfig.lua_ls.setup({})
  lspconfig.ruby_lsp.setup({})
  lspconfig.ts_ls.setup({})
  lspconfig.yamlls.setup({
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

  local bind = vim.keymap.set

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      bind("n", "gD", vim.lsp.buf.declaration, opts)
      bind("n", "gd", vim.lsp.buf.definition, opts)
      bind("n", "gi", vim.lsp.buf.implementation, opts)
      bind("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      -- bind("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      -- bind("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      -- bind("n", "<space>wl", function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, opts)
      bind("n", "<space>D", vim.lsp.buf.type_definition, opts)
      bind("n", "<space>rn", vim.lsp.buf.rename, opts)
      bind({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      bind("n", "gr", vim.lsp.buf.references, opts)
    end,
  })
end

return Plugin
