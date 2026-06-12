return {
  specs = function(ctx)
    return {
      { src = ctx.gh("nvim-telescope/telescope.nvim") },
      { src = ctx.gh("nvim-telescope/telescope-fzf-native.nvim") },
      { src = ctx.gh("AckslD/nvim-neoclip.lua") },
    }
  end,

  pack_changed = {
    ["telescope-fzf-native.nvim"] = function(data)
      vim.system({ "make" }, { cwd = data.path }):wait()
    end,
  },

  config = function()
    local telescope = require("telescope")
    local telescope_actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["<C-d>"] = telescope_actions.delete_buffer,
          },
          i = {
            ["<esc>"] = telescope_actions.close,
            ["<C-/>"] = telescope_actions.which_key,
            ["<C-d>"] = telescope_actions.delete_buffer,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        neoclip = {},
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "neoclip")

    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
    vim.keymap.set("n", "<leader>?", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
    vim.keymap.set("n", "<C-space>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope treesitter<cr>", { desc = "Find buffer symbols" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in buffer" })
    vim.keymap.set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "Clipboard history" })
    vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
  end,
}
