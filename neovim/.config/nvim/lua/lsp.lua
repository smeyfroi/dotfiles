local has_lsp_config = type(vim.lsp.config) == "function" or type(vim.lsp.config) == "table"

if not has_lsp_config or type(vim.lsp.enable) ~= "function" then
  vim.notify("This LSP setup requires Neovim 0.12 native LSP config APIs", vim.log.levels.ERROR)
  return
end

vim.opt.autocomplete = true
vim.opt.autocompletedelay = 120
vim.opt.completeopt = { "menuone", "noselect", "popup" }

local completion_trigger_chars = {}
for char in ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"):gmatch(".") do
  table.insert(completion_trigger_chars, char)
end

local function extend_completion_trigger_chars(client)
  local provider = client.server_capabilities.completionProvider
  if not provider then
    return
  end

  local triggers = vim.deepcopy(provider.triggerCharacters or {})
  local seen = {}

  for _, char in ipairs(triggers) do
    seen[char] = true
  end

  for _, char in ipairs(completion_trigger_chars) do
    if not seen[char] then
      table.insert(triggers, char)
      seen[char] = true
    end
  end

  provider.triggerCharacters = triggers
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("native_lsp", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    if client:supports_method("textDocument/completion") then
      extend_completion_trigger_chars(client)
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "<leader>xq", vim.diagnostic.setqflist, "Diagnostics quickfix")
    map("n", "<leader>xl", vim.diagnostic.setloclist, "Diagnostics loclist")
  end,
})

vim.keymap.set("i", "<C-space>", function()
  vim.lsp.completion.get()
end, { desc = "Trigger LSP completion" })

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      format = {
        enable = false,
      },
      hover = true,
      completion = true,
      customTags = {
        "!Fn",
        "!And",
        "!If",
        "!Not",
        "!Equals",
        "!Or",
        "!FindInMap Sequence",
        "!Base64",
        "!Cidr",
        "!Ref",
        "!Ref Scalar",
        "!Sub",
        "!Sub Sequence",
        "!GetAtt",
        "!GetAZs",
        "!ImportValue",
        "!Select",
        "!Split",
        "!Join Sequence",
      },
    },
  },
})

for _, server in ipairs({
  "bashls",
  "jsonls",
  "lua_ls",
  "ruby_lsp",
  "ts_ls",
  "yamlls",
}) do
  vim.lsp.enable(server)
end
