# Neovim config

Neovim 0.12+ config using native `vim.pack`.

Launch normally:

```sh
nvim
```

Mason is part of this setup again, and its `bin` directory is prepended to `PATH` for Neovim. Install the configured LSP servers, formatters, and linters with:

```vim
:MasonInstallConfigured
```

Configured Mason packages:

- LSP: `bash-language-server`, `vscode-json-language-server`, `lua-language-server`, `ruby-lsp`, `typescript-language-server`, `yaml-language-server`
- Formatters: `stylua`, `prettier`, `rubocop`, `shfmt`
- Linters: `selene`, `eslint_d`, `yamllint`, `jsonlint`, `rubocop`

The Mason package names are slightly different where upstream tools use different executable names: `json-lsp` provides `vscode-json-language-server`.

System tools still needed outside Mason:

- Treesitter parsers: `tree-sitter` CLI 0.26.1+ and a C compiler

On first launch, `vim.pack` installs plugins into Neovim's normal data directory and writes `nvim-pack-lock.json` here.

Current `nvim-treesitter` does not use the old `require("nvim-treesitter.configs").setup(...)` API. Use `:TSInstallConfigured` to install the parser set from this config.

Copilot stores auth under `$XDG_CONFIG_HOME/github-copilot`. Local auth files are ignored by Git.
