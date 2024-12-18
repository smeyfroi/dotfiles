return {
  "folke/persistence.nvim",
  name = "persistence",
  event = "BufReadPre",
  config = true,
  init = function()
    vim.api.nvim_create_user_command(
      'LoadSession',
      function()
        vim.cmd([[lua require("persistence").load()]])
      end,
      {desc = 'Load session'}
    )
  end
}
