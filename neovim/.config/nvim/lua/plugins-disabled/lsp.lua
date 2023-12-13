local Plugin = {'neovim/nvim-lspconfig'}

Plugin.dependencies = {
  -- {'j-hui/fidget.nvim'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'VonHeikemen/lsp-zero.nvim'},
  {'folke/neodev.nvim'},
}

function Plugin.config()
  -- require('fidget').setup({
  --   text = {
  --     spinner = 'moon'
  --   },
  --   window = {
  --     blend = 0
  --   },
  --   sources = {
  --     ['null-ls'] = {ignore = true}
  --   }
  -- })
  local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
    sign_icons = {
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    }
  })
  lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr}
    local bind = vim.keymap.set
  -- bind('n', 'K', lsp.hover, opts)
  -- bind('n', 'gd', lsp.definition, opts)
  -- bind('n', 'gD', lsp.declaration, opts)
  -- bind('n', 'gi', lsp.implementation, opts)
  -- bind('n', 'go', lsp.type_definition, opts)
  -- bind('n', 'gr', lsp.references, opts)
  -- bind('n', 'gs', lsp.signature_help, opts)
  -- bind('n', '<F2>', lsp.rename, opts)
  -- bind('n', '<F4>', lsp.code_action, opts)
  -- bind('x', '<F4>', lsp.range_code_action, opts)
  -- bind('n', 'gl', vim.diagnostic.open_float, opts)
  -- bind('n', '[d', vim.diagnostic.goto_prev, opts)
  -- bind('n', ']d', vim.diagnostic.goto_next, opts)
    local telescope = require('telescope.builtin')
    bind('n', '<leader>fd', telescope.lsp_document_symbols, opts)
    bind('n', '<leader>fq', telescope.lsp_workspace_symbols, opts)
  end)
  lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = {
      completeopt = 'menu,menuone,noinsert,noselect'
    },
  })
  lsp.setup()
end

return Plugin

