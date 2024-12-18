  return {
  'MagicDuck/grug-far.nvim',
  config = true,
  init = function()
    vim.api.nvim_create_user_command(
      'MultiSearchReplace',
      function()
        vim.cmd([[GrugFar]])
      end,
      {desc = 'Multi-file search/replace (grug-far)'}
    )
  end
}
