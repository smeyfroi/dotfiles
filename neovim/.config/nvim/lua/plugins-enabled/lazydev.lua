return {
  specs = function(ctx)
    return {
      { src = ctx.gh("folke/lazydev.nvim"), name = "lazydev" },
    }
  end,

  config = function(ctx)
    ctx.setup("lazydev", {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })
  end,
}
