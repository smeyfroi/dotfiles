return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = false,
        jump_labels = false,
      },
      -- search = {
      --   enabled = false,
      -- },
    },
  },
  keys = {
    { "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
