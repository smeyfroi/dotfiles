local Plugin = {'nvim-treesitter/nvim-treesitter'}
-- Plugin.pin = true

Plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects', pin = true},
  {'JoosepAlviste/nvim-ts-context-commentstring'},
}

Plugin.opts = {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      node_decremental = 'grm',
    },
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['ia'] = '@parameter.inner',
      }
    },
    swap = {
      enable = true,
      swap_previous = {
        ['{a'] = '@parameter.inner',
      },
      swap_next = {
        ['}a'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']f'] = '@function.outer',
        [']c'] = '@class.outer',
        [']a'] = '@parameter.inner',
      },
      goto_next_end = {
        [']F'] = '@function.outer',
        [']C'] = '@class.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
        ['[c'] = '@class.outer',
        ['[a'] = '@parameter.inner',
      },
      goto_previous_end = {
        ['[F'] = '@function.outer',
        ['[C'] = '@class.outer',
      },
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'css',
    'json',
    'lua',
    'vim',
    'ruby',
    'bash',
  },
}

function Plugin.build()
  pcall(vim.cmd, 'TSUpdate')
end

function Plugin.config(_, opts)
  require('nvim-treesitter.configs').setup(opts)
end

return Plugin

