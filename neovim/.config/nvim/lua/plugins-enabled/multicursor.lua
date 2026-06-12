return {
  specs = function(ctx)
    return {
      { src = ctx.gh("jake-stewart/multicursor.nvim"), version = "1.0" },
    }
  end,

  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    vim.keymap.set({ "n", "v" }, "<up>", function()
      mc.lineAddCursor(-1)
    end)
    vim.keymap.set({ "n", "v" }, "<down>", function()
      mc.lineAddCursor(1)
    end)
    vim.keymap.set({ "n", "v" }, "<leader><up>", function()
      mc.lineSkipCursor(-1)
    end)
    vim.keymap.set({ "n", "v" }, "<leader><down>", function()
      mc.lineSkipCursor(1)
    end)
    vim.keymap.set({ "n", "v" }, "<leader>n", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor" })
    vim.keymap.set({ "n", "v" }, "<leader>s", function()
      mc.matchSkipCursor(1)
    end, { desc = "Skip cursor" })
    vim.keymap.set({ "n", "v" }, "<leader>N", function()
      mc.matchAddCursor(-1)
    end, { desc = "Add cursor backwards" })
    vim.keymap.set({ "n", "v" }, "<leader>S", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Skip cursor backwards" })
    vim.keymap.set({ "n", "v" }, "<leader>A", mc.matchAllAddCursors, { desc = "Add all matching cursors" })
    vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
    vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)
    vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor, { desc = "Delete cursor" })
    vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
    vim.keymap.set({ "n", "v" }, "<c-q>", mc.toggleCursor)
    vim.keymap.set({ "n", "v" }, "<leader><c-q>", mc.duplicateCursors)
    vim.keymap.set("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      end
    end)
    vim.keymap.set("n", "<leader>gv", mc.restoreCursors)
    vim.keymap.set("n", "<leader>a", mc.alignCursors)
    vim.keymap.set("v", "S", mc.splitCursors)
    vim.keymap.set("v", "I", mc.insertVisual)
    vim.keymap.set("v", "A", mc.appendVisual)
    vim.keymap.set("v", "M", mc.matchCursors)
    vim.keymap.set("v", "<leader>t", function()
      mc.transposeCursors(1)
    end)
    vim.keymap.set("v", "<leader>T", function()
      mc.transposeCursors(-1)
    end)
    vim.keymap.set({ "v", "n" }, "<c-i>", mc.jumpForward)
    vim.keymap.set({ "v", "n" }, "<c-o>", mc.jumpBackward)

    vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
