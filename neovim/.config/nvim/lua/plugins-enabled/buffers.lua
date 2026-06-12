return {
  config = function()
    vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
    vim.keymap.set("n", "<leader>bo", function()
      local current = vim.api.nvim_get_current_buf()
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if bufnr ~= current and vim.bo[bufnr].buflisted then
          pcall(vim.api.nvim_buf_delete, bufnr, {})
        end
      end
    end, { desc = "Delete other buffers" })
  end,
}
