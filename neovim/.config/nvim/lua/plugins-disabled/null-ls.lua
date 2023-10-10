local Plugin = {'jose-elias-alvarez/null-ls.nvim'}

Plugin.dependencies = {
  {'nvim-lua/plenary.nvim'},
  {'jay-babu/mason-null-ls.nvim'},
}

function Plugin.config()
  local null_ls = require('null-ls')

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  local config = {
    on_attach = function(client, bufnr)
      local format_cmd = function(input)
        vim.lsp.buf.format({
          id = client.id,
          timeout_ms = 5000,
          async = input.bang,
        })
      end

      vim.api.nvim_buf_create_user_command(bufnr, 'NullFormat', format_cmd, {
        bang = true,
        range = true,
        desc = 'Format using null-ls'
      })
    end,
    sources = {
      formatting.prettier.with({
        prefer_local = 'node_modules/.bin',
      }),
      diagnostics.write_good,
      code_actions.gitsigns,
      diagnostics.actionlint,
      diagnostics.cfn_lint.with({
        filetypes = { "yaml", "yml", "json", "template" },
      }),
      diagnostics.checkmake,
      diagnostics.eslint,
      diagnostics.glslc.with({
        extra_args = { "--target-env=opengl" }, -- use opengl instead of vulkan1.0
      }),
      diagnostics.hadolint,
      diagnostics.markdownlint,
      diagnostics.rubocop,
      formatting.jq,
      formatting.mdformat,
      formatting.rubocop,
    }
  }

  null_ls.setup(config)
  require('mason-null-ls').setup()
end

return Plugin

