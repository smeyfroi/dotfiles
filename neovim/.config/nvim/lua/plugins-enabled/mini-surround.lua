return {
  specs = function(ctx)
    return {
      { src = ctx.gh("echasnovski/mini.surround") },
    }
  end,

  config = function(ctx)
    ctx.setup("mini.surround")
  end,
}
