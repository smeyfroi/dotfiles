return {
  specs = function(ctx)
    return {
      { src = ctx.gh("nvim-tree/nvim-tree.lua") },
    }
  end,

  config = function(ctx)
    ctx.setup("nvim-tree")

    vim.keymap.set("n", "<tab>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
  end,
}
