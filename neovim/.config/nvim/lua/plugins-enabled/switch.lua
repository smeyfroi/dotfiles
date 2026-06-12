return {
  specs = function(ctx)
    return {
      { src = ctx.gh("AndrewRadev/switch.vim"), name = "switch" },
    }
  end,

  config = function()
    vim.keymap.set("n", "-", "<cmd>Switch<cr>", { desc = "Switch" })
  end,
}
