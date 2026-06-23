return {
  specs = function(ctx)
    return {
      { src = ctx.gh("echasnovski/mini.starter") },
    }
  end,

  config = function()
    local starter = require("mini.starter")

    starter.setup({
      items = {
        starter.sections.recent_files(10, true, false), -- this repo (cwd)
        starter.sections.recent_files(10, false, true), -- recent everywhere, with path
        { name = "Find files", action = "Telescope find_files", section = "Telescope" },
        { name = "Live grep", action = "Telescope live_grep", section = "Telescope" },
        starter.sections.builtin_actions(),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning("center", "center"),
      },
    })
  end,
}
