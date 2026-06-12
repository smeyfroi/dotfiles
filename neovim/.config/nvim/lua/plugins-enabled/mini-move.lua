return {
  specs = function(ctx)
    return {
      { src = ctx.gh("echasnovski/mini.move") },
    }
  end,

  config = function(ctx)
    ctx.setup("mini.move")
  end,
}
