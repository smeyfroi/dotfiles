return {
  specs = function(ctx)
    return {
      { src = ctx.gh("stevearc/conform.nvim") },
    }
  end,

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        ruby = { "rubocop" },
        sh = { "shfmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
        prettier = {
          -- .template (CloudFormation) files have an extension prettier can't map
          -- to a parser, so force yaml for them; other filetypes infer as usual.
          prepend_args = function(_, ctx)
            if vim.bo[ctx.buf].filetype:find("cloudformation") then
              return { "--parser", "yaml" }
            end
            return {}
          end,
        },
      },
    })

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
        lsp_format = "fallback",
        range = range,
        timeout_ms = 3000,
      })
    end, { range = true, desc = "Format buffer or range" })
  end,
}
