return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    { "folke/persistence.nvim" },
  },
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd =  "",
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },

    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  init = function()
    vim.keymap.set("n", "<leader>bd", function()
      Snacks.bufdelete()
    end, { desc = "Delete Buffer" })
    vim.keymap.set("n", "<leader>bo", function()
      Snacks.bufdelete.other()
    end, { desc = "Delete Other Buffers" })
    vim.api.nvim_create_user_command(
      'GitBrowse',
      function()
        Snacks.gitbrowse()
      end,
      {desc = 'Browse file in online repo'}
    )
  end,
}
