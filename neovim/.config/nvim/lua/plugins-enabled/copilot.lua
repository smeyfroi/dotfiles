-- return {
--   'github/copilot.vim',
--   name = 'copilot',
--   init = function()
--     -- vim.keymap.set("M-]", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
--     -- M-[ previous
--     -- M-\ ask for suggestion
--     -- M-Right
--     vim.keymap.set("i", "M-z", "<Plug>(copilot-accept-word)", { noremap = false, desc = "Accept next word of current suggestion" })
--     -- vim.keymap.set("M-<", "<Plug>(copilot-accept-line)", { desc = "Accept next line of current suggestion" })
--   end,
-- }

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  -- build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<TAB>",
        accept_word = "<M-;>",
        accept_line = "<M-'>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>"
      },
      layout = {
        position = "bottom", -- | top | left | right | horizontal | vertical
        ratio = 0.4
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  }
}
