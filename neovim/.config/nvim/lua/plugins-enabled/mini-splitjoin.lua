return {
  specs = function(ctx)
    return {
      { src = ctx.gh("echasnovski/mini.splitjoin") },
    }
  end,

  config = function(ctx)
    ctx.setup("mini.splitjoin")
  end,
}
