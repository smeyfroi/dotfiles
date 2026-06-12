return {
  specs = function(ctx)
    return {
      { src = ctx.gh("calind/selenized.nvim"), name = "selenized" },
    }
  end,

  config = function()
    vim.cmd.colorscheme("selenized")
  end,
}
