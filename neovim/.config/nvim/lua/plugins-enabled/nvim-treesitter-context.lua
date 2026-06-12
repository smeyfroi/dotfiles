return {
  specs = function(ctx)
    return {
      { src = ctx.gh("nvim-treesitter/nvim-treesitter-context") },
    }
  end,

  config = function(ctx)
    ctx.setup("treesitter-context")
  end,
}
