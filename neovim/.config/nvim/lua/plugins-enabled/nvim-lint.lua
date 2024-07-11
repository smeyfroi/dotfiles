local Plugin = { "mfussenegger/nvim-lint" }

Plugin.config = function()
  local lint = require("lint")
  lint.linters_by_ft = {
    lua = { "selene" },
    markdown = { "markdownlint" },
    ruby = { "rubocop" },
    javascript = { "eslint" },
    yaml = { "yamllint" },
    json = { "jsonlint" },
    -- cfn = { "cfn-lint" },
  }

  vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

return Plugin
