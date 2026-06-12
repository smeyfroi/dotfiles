return {
  specs = function(ctx)
    return {
      { src = ctx.gh("echasnovski/mini.cursorword") },
    }
  end,

  config = function(ctx)
    ctx.setup("mini.cursorword")
  end,
}
