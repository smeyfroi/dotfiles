local treesitter_languages = {
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "ruby",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}

local function select_range(range)
  local start_row, start_col, end_row, end_col = unpack(range)

  if end_col == 0 then
    end_row = end_row - 1
    end_col = #vim.fn.getline(end_row + 1) + 1
  end

  vim.cmd.normal({ "v\27", bang = true })
  vim.fn.setpos("'<", { 0, start_row + 1, start_col + 1, 0 })
  vim.fn.setpos("'>", { 0, end_row + 1, end_col, 0 })
  vim.cmd.normal({ "gv", bang = true })
end

local function select_node_at_cursor()
  pcall(vim.treesitter.start)

  local node = vim.treesitter.get_node()
  if not node then
    vim.notify("No Treesitter node under cursor", vim.log.levels.WARN)
    return
  end

  select_range({ node:range() })
end

return {
  specs = function(ctx)
    return {
      { src = ctx.gh("nvim-treesitter/nvim-treesitter") },
    }
  end,

  pack_changed = {
    ["nvim-treesitter"] = function(data)
      vim.schedule(function()
        if not data.active then
          pcall(vim.cmd.packadd, "nvim-treesitter")
        end
        pcall(vim.cmd, "TSUpdate")
      end)
    end,
  },

  config = function()
    local treesitter_filetypes = vim.list_extend(vim.deepcopy(treesitter_languages), { "jsonc" })

    vim.treesitter.language.register("json", "jsonc")

    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    vim.api.nvim_create_user_command("TSInstallConfigured", function()
      require("nvim-treesitter").install(treesitter_languages)
    end, { desc = "Install configured Treesitter parsers" })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
      pattern = treesitter_filetypes,
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    vim.keymap.set("n", "<leader>+", select_node_at_cursor, { desc = "Increment TS Selection" })
    vim.keymap.set("x", "<leader>+", function()
      require("vim.treesitter._select").select_parent(vim.v.count1)
    end, { desc = "Increment TS Selection" })
    vim.keymap.set("x", "<leader>-", function()
      require("vim.treesitter._select").select_child(vim.v.count1)
    end, { desc = "Decrement TS Selection" })
  end,
}
