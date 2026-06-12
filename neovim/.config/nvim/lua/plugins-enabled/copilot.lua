return {
  specs = function(ctx)
    return {
      { src = ctx.gh("zbirenbaum/copilot.lua"), name = "copilot.lua" },
    }
  end,

  config = function(ctx)
    ctx.setup("copilot", {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<TAB>",
          accept_word = "<M-;>",
          accept_line = "<M-'>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom",
          ratio = 0.4,
        },
        filetypes = {
          markdown = true,
          help = true,
        },
      },
    })
  end,
}
