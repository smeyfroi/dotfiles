return {
  "mfussenegger/nvim-lint",
  dependencies = { "williamboman/mason.nvim" },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      -- lua = { "selene" },
      ruby = { "rubocop" },
      javascript = { "eslint" },
      yaml = { "yamllint" },
      json = { "jsonlint" },
      cfn = { "cfn-lint" },
    },
  },
}
