return {
  specs = function(ctx)
    return {
      { src = ctx.gh("lewis6991/gitsigns.nvim"), name = "gitsigns" },
    }
  end,

  config = function(ctx)
    ctx.setup("gitsigns", {
      current_line_blame = false,
    })
  end,
}
