return {
  specs = function(ctx)
    return {
      { src = ctx.gh("echasnovski/mini.ai") },
    }
  end,

  config = function(ctx)
    ctx.setup("mini.ai")
  end,
}
