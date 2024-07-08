local Plugin = { "stevearc/conform.nvim" }

Plugin.opts = {
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- Use a sub-list to run only the first available formatter
    lua = { "stylua" },
    python = { "autopep8" },
    javascript = { "prettier" },
    json = { "jq", "fixjson" },
    markdown = { "markdownlint" },
    ruby = { "rubocop" },
    sql = { "sql-formatter" },
    yaml = { "yamlfmt" },
    sh = { "shfmt", "beautysh" },
  },
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2", "-ci" },
    },
  },
}

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range, formatters = { "injected" }, timeout_ms = 3000 })
end, { range = true })

return Plugin
