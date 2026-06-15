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
    end, { desc = "Add cursor above" })
    vim.keymap.set({ "n", "v" }, "<down>", function()
      mc.lineAddCursor(1)
    end, { desc = "Add cursor below" })
    vim.keymap.set({ "n", "v" }, "<leader><up>", function()
      mc.lineSkipCursor(-1)
    end, { desc = "Skip cursor above" })
    vim.keymap.set({ "n", "v" }, "<leader><down>", function()
      mc.lineSkipCursor(1)
    end, { desc = "Skip cursor below" })
    vim.keymap.set({ "n", "v" }, "<leader>n", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor at next match" })
    vim.keymap.set({ "n", "v" }, "<leader>s", function()
      mc.matchSkipCursor(1)
    end, { desc = "Skip cursor to next match" })
    vim.keymap.set({ "n", "v" }, "<leader>N", function()
      mc.matchAddCursor(-1)
    end, { desc = "Add cursor at previous match" })
    vim.keymap.set({ "n", "v" }, "<leader>S", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Skip cursor to previous match" })
    vim.keymap.set({ "n", "v" }, "<leader>A", mc.matchAllAddCursors, { desc = "Add cursors at all matches" })
    vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor, { desc = "Go to next cursor" })
    vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor, { desc = "Go to previous cursor" })
    vim.keymap.set({ "n", "v" }, "<leader>X", mc.deleteCursor, { desc = "Delete cursor" })
    vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Toggle cursor (mouse)" })
    vim.keymap.set({ "n", "v" }, "<c-q>", mc.toggleCursor, { desc = "Toggle cursor" })
    vim.keymap.set({ "n", "v" }, "<leader><c-q>", mc.duplicateCursors, { desc = "Duplicate cursors" })
    vim.keymap.set("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      end
    end, { desc = "Enable/clear cursors" })
    vim.keymap.set("n", "<leader>gv", mc.restoreCursors, { desc = "Restore cursors" })
    vim.keymap.set("n", "<leader>a", mc.alignCursors, { desc = "Align cursors" })
    vim.keymap.set("v", "S", mc.splitCursors, { desc = "Split cursors by regex" })
    vim.keymap.set("v", "I", mc.insertVisual, { desc = "Insert at cursors" })
    vim.keymap.set("v", "A", mc.appendVisual, { desc = "Append at cursors" })
    vim.keymap.set("v", "M", mc.matchCursors, { desc = "Match cursors in selection" })
    vim.keymap.set("v", "<leader>t", function()
      mc.transposeCursors(1)
    end, { desc = "Transpose cursors forward" })
    vim.keymap.set("v", "<leader>T", function()
      mc.transposeCursors(-1)
    end, { desc = "Transpose cursors backward" })
    vim.keymap.set({ "v", "n" }, "<c-i>", mc.jumpForward, { desc = "Jump forward (cursors)" })
    vim.keymap.set({ "v", "n" }, "<c-o>", mc.jumpBackward, { desc = "Jump backward (cursors)" })

    vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
