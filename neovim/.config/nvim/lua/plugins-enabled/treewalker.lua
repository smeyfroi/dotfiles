return {
  "aaronik/treewalker.nvim",
  keys = {
    { "<C-k>", "<cmd>Treewalker Up<cr>", desc = "Treewalker Up" },
    { "<C-j>", "<cmd>Treewalker Down<cr>", desc = "Treewalker Down" },
    { "<C-h>", "<cmd>Treewalker Left<cr>", desc = "Treewalker Left" },
    { "<C-l>", "<cmd>Treewalker Right<cr>", desc = "Treewalker Right" },
    { "<C-S-k>", "<cmd>Treewalker SwapUp<cr>", desc = "Treewalker SwapUp" },
    { "<C-S-j>", "<cmd>Treewalker SwapDown<cr>", desc = "Treewalker SwapDown" },
    { "<C-S-h>", "<cmd>Treewalker SwapLeft<cr>", desc = "Treewalker SwapLeft" },
    { "<C-S-l>", "<cmd>Treewalker SwapRight<cr>", desc = "Treewalker SwapRight" },
  },
  opts = {
    -- Whether to briefly highlight the node after jumping to it
    highlight = true,

    -- How long should above highlight last (in ms)
    highlight_duration = 250,

    -- The color of the above highlight. Must be a valid vim highlight group.
    -- (see :h highlight-group for options)
    highlight_group = 'CursorLine',

    -- Whether the plugin adds movements to the jumplist -- true | false | 'left'
    --  true: All movements more than 1 line are added to the jumplist. This is the default,
    --        and is meant to cover most use cases. It's modeled on how { and } natively add
    --        to the jumplist.
    --  false: Treewalker does not add to the jumplist at all
    --  "left": Treewalker only adds :Treewalker Left to the jumplist. This is usually the most
    --          likely one to be confusing, so it has its own mode.
    jumplist = true,
  }
}
