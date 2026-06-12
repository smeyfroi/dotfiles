return {
  specs = function(ctx)
    return {
      { src = ctx.gh("folke/flash.nvim") },
    }
  end,

  config = function(ctx)
    ctx.setup("flash", {
      modes = {
        char = {
          enabled = false,
          jump_labels = false,
        },
      },
    })

    vim.keymap.set({ "n", "x", "o" }, "<CR>", function()
      require("flash").jump()
    end, { desc = "Flash" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "qf",
      callback = function(event)
        vim.keymap.set("n", "<CR>", function()
          local wininfo = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1]

          if wininfo and wininfo.loclist == 1 then
            vim.cmd(".ll")
          else
            vim.cmd(".cc")
          end
        end, { buffer = event.buf, desc = "Open quickfix item" })
      end,
    })
  end,
}
