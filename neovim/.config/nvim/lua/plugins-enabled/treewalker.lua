return {
  specs = function(ctx)
    return {
      { src = ctx.gh("aaronik/treewalker.nvim") },
    }
  end,

  config = function(ctx)
    ctx.setup("treewalker", {
      highlight = true,
      highlight_duration = 250,
      highlight_group = "CursorLine",
      jumplist = true,
    })

    vim.keymap.set("n", "<C-k>", "<cmd>Treewalker Up<cr>", { desc = "Treewalker Up" })
    vim.keymap.set("n", "<C-j>", "<cmd>Treewalker Down<cr>", { desc = "Treewalker Down" })
    vim.keymap.set("n", "<C-h>", "<cmd>Treewalker Left<cr>", { desc = "Treewalker Left" })
    vim.keymap.set("n", "<C-l>", "<cmd>Treewalker Right<cr>", { desc = "Treewalker Right" })
    vim.keymap.set("n", "<C-S-k>", "<cmd>Treewalker SwapUp<cr>", { desc = "Treewalker Swap up" })
    vim.keymap.set("n", "<C-S-j>", "<cmd>Treewalker SwapDown<cr>", { desc = "Treewalker Swap down" })
    vim.keymap.set("n", "<C-S-h>", "<cmd>Treewalker SwapLeft<cr>", { desc = "Treewalker Swap left" })
    vim.keymap.set("n", "<C-S-l>", "<cmd>Treewalker SwapRight<cr>", { desc = "Treewalker Swap right" })
  end,
}
