return {
  specs = function(ctx)
    return {
      { src = ctx.gh("akinsho/toggleterm.nvim") },
    }
  end,

  config = function(ctx)
    ctx.setup("toggleterm", {
      open_mapping = [[<c-\>]],
      insert_mappings = true,
      terminal_mappings = true,
      direction = "float",
      close_on_exit = true,
    })
  end,
}
