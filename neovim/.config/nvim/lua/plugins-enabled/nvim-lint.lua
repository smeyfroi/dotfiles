return {
  specs = function(ctx)
    return {
      { src = ctx.gh("mfussenegger/nvim-lint") },
    }
  end,

  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      lua = { "selene" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      yaml = { "yamllint" },
      json = { "jsonlint" },
      ruby = { "rubocop" },
      cloudformation = { "cfn_lint" },
    }

    for ft, names in pairs(lint.linters_by_ft) do
      lint.linters_by_ft[ft] = vim.tbl_filter(function(name)
        local linter = lint.linters[name]
        local cmd = type(linter) == "table" and linter.cmd or nil
        return type(cmd) ~= "string" or vim.fn.executable(cmd) == 1
      end, names)
    end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Lint" })
  end,
}
