return {
  "stevearc/conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "zapling/mason-conform.nvim",
  },
  lazy = true,
  opts = {
    formatters_by_ft = {
      -- Conform will run multiple formatters sequentially
      -- Use a sub-list to run only the first available formatter
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "jq" },
      ruby = { "rubocop" },
      yaml = { "yamlfmt" },
      sh = { "shfmt" },
    },
    formatters = {
      injected = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
      },
    },
  },
  init = function()
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({
        async = true,
        lsp_fallback = true,
        range = range,
        timeout_ms = 3000,
      })
    end, { range = true })

    -- Optionally set up format-on-save
    -- require("conform").setup({
    --   format_on_save = {
    --     -- These options will be passed to conform.format()
    --     timeout_ms = 500,
    --     lsp_format = "fallback",
    --   },
    -- })
  end,
}
