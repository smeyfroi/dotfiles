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
  end,
}
