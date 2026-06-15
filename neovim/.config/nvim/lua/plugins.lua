if vim.fn.has("nvim-0.12") == 0 or vim.pack == nil then
  vim.notify("This config requires Neovim 0.12+ for vim.pack", vim.log.levels.ERROR)
  return
end

local plugin_modules = {
  "plugins-enabled.selenized",
  "plugins-enabled.nvim-web-devicons",
  "plugins-enabled.plenary",
  "plugins-enabled.mason",
  "plugins-enabled.nvim-lspconfig",
  "plugins-enabled.conform",
  "plugins-enabled.nvim-lint",
  "plugins-enabled.nvim-treesitter",
  "plugins-enabled.nvim-treesitter-context",
  "plugins-enabled.gitsigns",
  "plugins-enabled.whichkey",
  "plugins-enabled.lazydev",
  "plugins-enabled.copilot",
  "plugins-enabled.copilot-chat",
  "plugins-enabled.nvim-tree",
  "plugins-enabled.toggleterm",
  "plugins-enabled.flash",
  "plugins-enabled.mini-ai",
  "plugins-enabled.mini-cursorword",
  "plugins-enabled.mini-move",
  "plugins-enabled.mini-splitjoin",
  "plugins-enabled.mini-surround",
  "plugins-enabled.treewalker",
  "plugins-enabled.telescope",
  "plugins-enabled.multicursor",
  "plugins-enabled.interestingwords",
  "plugins-enabled.rainbowcsv",
  "plugins-enabled.switch",
}

local function gh(repo)
  return "https://github.com/" .. repo
end

local function setup(module, opts)
  local ok, plugin = pcall(require, module)
  if ok and type(plugin.setup) == "function" then
    plugin.setup(opts or {})
  elseif not ok then
    vim.notify(("Could not load %s: %s"):format(module, plugin), vim.log.levels.WARN)
  end
end

local ctx = {
  gh = gh,
  setup = setup,
}

local specs = {}
local pack_changed_handlers = {}
local plugins = {}

local function add_specs(plugin)
  local plugin_specs = plugin.specs
  if type(plugin_specs) == "function" then
    plugin_specs = plugin_specs(ctx)
  end

  if plugin_specs == nil then
    return
  end

  if vim.islist(plugin_specs) then
    vim.list_extend(specs, plugin_specs)
  else
    table.insert(specs, plugin_specs)
  end
end

local function add_pack_changed_handlers(plugin)
  local handlers = plugin.pack_changed
  if type(handlers) == "function" then
    handlers = handlers(ctx)
  end

  if type(handlers) ~= "table" then
    return
  end

  for name, handler in pairs(handlers) do
    pack_changed_handlers[name] = handler
  end
end

for _, module in ipairs(plugin_modules) do
  local ok, plugin = pcall(require, module)
  if not ok then
    vim.notify(("Could not load %s: %s"):format(module, plugin), vim.log.levels.WARN)
  else
    table.insert(plugins, { module = module, plugin = plugin })
    add_specs(plugin)
    add_pack_changed_handlers(plugin)
  end
end

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("pack_builds", { clear = true }),
  callback = function(ev)
    local data = ev.data or {}

    if data.kind ~= "install" and data.kind ~= "update" then
      return
    end

    local spec = data.spec or {}
    local handler = spec.name and pack_changed_handlers[spec.name]

    if not handler then
      return
    end

    local ok, err = pcall(handler, data)
    if not ok then
      vim.notify(("PackChanged failed for %s: %s"):format(spec.name, err), vim.log.levels.ERROR)
    end
  end,
})

if #specs > 0 then
  vim.pack.add(specs, { confirm = false, load = true })
end

for _, entry in ipairs(plugins) do
  if type(entry.plugin.config) == "function" then
    local ok, err = pcall(entry.plugin.config, ctx)
    if not ok then
      vim.notify(("Could not configure %s: %s"):format(entry.module, err), vim.log.levels.ERROR)
    end
  end
end
