return {
  "CopilotC-Nvim/CopilotChat.nvim",
  name = "copilot-chat",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    -- { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    -- See Configuration section for options

    -- default mappings
    mappings = {
      complete = {
        insert = "<Tab>",
      },
      close = {
        normal = "q",
        insert = "<C-c>",
      },
      reset = {
        normal = "<C-l>",
        insert = "<C-l>",
      },
      submit_prompt = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      toggle_sticky = {
        detail = "Makes line under cursor sticky or deletes sticky line.",
        normal = "gr",
      },
      accept_diff = {
        normal = "<C-y>",
        insert = "<C-y>",
      },
      jump_to_diff = {
        normal = "gj",
      },
      quickfix_diffs = {
        normal = "gq",
      },
      yank_diff = {
        normal = "gy",
        register = '"',
      },
      show_diff = {
        normal = "gd",
      },
      show_info = {
        normal = "gi",
      },
      show_context = {
        normal = "gc",
      },
      show_help = {
        normal = "gh",
      },
    },

  },
  -- See Commands section for default commands if you want to lazy load on them
}
