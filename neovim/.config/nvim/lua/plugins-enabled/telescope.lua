local Plugin = {'nvim-telescope/telescope.nvim', tag = '0.1.3'}

Plugin.dependencies = {
  {'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
  -- {'nvim-telescope/telescope-file-browser.nvim'},
  {'AckslD/nvim-neoclip.lua'},
}

Plugin.cmd = 'Telescope'

function Plugin.init()
  local bind = vim.keymap.set

  -- Search pattern
  bind('n', '<leader>fg', ':Telescope live_grep<CR>')

  -- Show key bindings list
  bind('n', '<Leader>?', ':Telescope keymaps<CR>')

  -- Show file browser
  -- bind('n', '<Leader-fi>', ':Telescope file_browser<CR>')

  -- Find files by name
  bind('n', '<C-space>', ':Telescope find_files<CR>')

  -- Search symbols in buffer
  -- bind('n', '<Leader>fs', ':Telescope treesitter<CR>')

  -- Search buffer lines
  bind('n', '<Leader>fb', ':Telescope current_buffer_fuzzy_find<CR>')

  -- Search in files history
  bind('n', '<Leader>fy', ':Telescope neoclip<CR>')

  -- Search in active buffers list
  bind('n', '<Leader>bb', ':Telescope buffers<CR>')
end

function Plugin.config()
  local command = vim.api.nvim_create_user_command

  local telescope = require('telescope')
  local actions = require('telescope.actions')

  telescope.setup({
    defaults = {
      mappings = {
        n = {
          ['<C-d>'] = actions.delete_buffer,
        },
        i = {
          ['<esc>'] = actions.close,
          ['<C-/>'] = actions.which_key,
          ['<C-d>'] = actions.delete_buffer,
        }
      },
    },
    extension = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      },
      -- fzy_native = {
      --   override_generic_sorter = true,
      --   override_file_sorter = true
      -- },
      neoclip = {},
    }
  })

  -- telescope.load_extension('fzy_native')
  telescope.load_extension('fzf')
  telescope.load_extension('neoclip')
  -- telescope.load_extension('file_browser')
end

return Plugin
