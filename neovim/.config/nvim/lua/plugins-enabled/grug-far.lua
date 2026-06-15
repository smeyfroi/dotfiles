return {
  specs = function(ctx)
    return {
      { src = ctx.gh("MagicDuck/grug-far.nvim") },
    }
  end,

  config = function()
    local grug = require("grug-far")

    grug.setup({})

    -- <leader>r = "replace": project-wide search & replace via ripgrep
    vim.keymap.set("n", "<leader>rr", function()
      grug.open()
    end, { desc = "Search/replace in project" })

    vim.keymap.set("n", "<leader>rw", function()
      grug.open({ prefills = { search = vim.fn.expand("<cword>") } })
    end, { desc = "Replace word under cursor" })

    vim.keymap.set("n", "<leader>rf", function()
      grug.open({ prefills = { paths = vim.fn.expand("%") } })
    end, { desc = "Replace in current file" })

    vim.keymap.set("v", "<leader>rr", function()
      grug.with_visual_selection()
    end, { desc = "Replace visual selection" })
  end,
}
