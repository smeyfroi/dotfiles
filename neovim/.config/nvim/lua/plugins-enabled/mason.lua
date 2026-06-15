local mason_packages = {
  "bash-language-server",
  "json-lsp",
  "lua-language-server",
  "ruby-lsp",
  "typescript-language-server",
  "yaml-language-server",
  "stylua",
  "prettier",
  "rubocop",
  "shfmt",
  "selene",
  "eslint_d",
  "yamllint",
  "jsonlint",
  "cfn-lint",
}

local function mason_install_configured()
  local ok, registry = pcall(require, "mason-registry")
  if not ok then
    vim.notify("mason-registry is not available", vim.log.levels.WARN)
    return
  end

  registry.refresh(function()
    for _, package_name in ipairs(mason_packages) do
      local package_ok, package = pcall(registry.get_package, package_name)
      if not package_ok then
        vim.schedule(function()
          vim.notify(("Mason package not found: %s"):format(package_name), vim.log.levels.WARN)
        end)
      elseif not package:is_installed() and not package:is_installing() then
        package:install()
      end
    end
  end)
end

return {
  specs = function(ctx)
    return {
      { src = ctx.gh("williamboman/mason.nvim") },
    }
  end,

  config = function(ctx)
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
    local path = vim.env.PATH or ""

    if not path:find(mason_bin, 1, true) then
      vim.env.PATH = mason_bin .. ":" .. path
    end

    ctx.setup("mason", {
      PATH = "prepend",
      ui = {
        icons = {
          package_installed = "+",
          package_pending = ">",
          package_uninstalled = "x",
        },
      },
    })

    vim.api.nvim_create_user_command("MasonInstallConfigured", mason_install_configured, {
      desc = "Install configured Mason packages",
    })
  end,
}
