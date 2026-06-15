return {
  specs = function(ctx)
    return {
      { src = ctx.gh("folke/which-key.nvim"), name = "which-key.nvim" },
    }
  end,

  config = function()
    local wk = require("which-key")

    wk.setup({
      triggers = {
        { "<auto>", mode = "nxso" },
        { "<leader>", mode = "nv" },
      },
    })

    wk.add({
      { "<leader>b", group = "buffers" },
      { "<leader>f", group = "find" },
      { "<leader>r", group = "replace" },
      { "<leader>w", group = "which-key" },
    })

    vim.keymap.set("n", "<leader>wk", function()
      require("which-key").show({ keys = "<leader>", mode = "n" })
    end, { desc = "Show leader keymaps" })

    vim.keymap.set("n", "<leader>wK", function()
      require("which-key").show({ global = false })
    end, { desc = "Show buffer local keymaps" })
  end,
}
