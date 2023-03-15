local Plugin = {'nvim-telescope/telescope.nvim'}
local user = {}

Plugin.dependencies = {
  {'nvim-lua/plenary.nvim'},
  {
    'nvim-telescope/telescope-fzy-native.nvim',
    build = function() user.build_fzy() end
  },
  {'nvim-telescope/telescope-file-browser.nvim'},
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
  bind('n', '<Leader-ff>', ':Telescope file_browser<CR>')

  -- Find files by name
  bind('n', '<C-space>', ':Telescope find_files<CR>')

  -- Search symbols in buffer
  bind('n', '<Leader>fs', ':Telescope treesitter<CR>')

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
      fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true
      },
      neoclip = {},
    }
  })

  telescope.load_extension('fzy_native')
  telescope.load_extension('neoclip')
  telescope.load_extension('file_browser')
end

function user.job_output(cid, data, name)
  for i, val in pairs(data) do
    print(val)
  end
end

function user.build_fzy()
  if vim.fn.executable('make') == 0 then
    return
  end

  local workdir = vim.api.nvim_get_runtime_file('deps/fzy-lua-native', 1)

  if workdir[1] == nil then
    return
  end

  vim.fn.jobstart({'make'}, {
    cwd = workdir[1],
    on_stdout = user.job_output,
  })
end

return Plugin

