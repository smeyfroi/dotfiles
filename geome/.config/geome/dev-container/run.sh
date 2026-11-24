#!/bin/bash
# Local tools for Geo.me project dev containers. dockerbe copies this folder
# into the build from ~/.config/geome/dev-container, and deployment's
# build-dev.sh runs this script.
# Installs the Neovim release build and the tools the dotfiles' plugins call,
# then links the dotfiles. Nothing is compiled.
set -euo pipefail

# A release tag, such as v0.12.6. "stable" is the newest release.
NVIM_VERSION=${NVIM_VERSION:-stable}

case "$(uname -m)" in
  aarch64 | arm64) NVIM_ARCH=arm64 TREE_SITTER_ARCH=arm64 ;;
  x86_64) NVIM_ARCH=x86_64 TREE_SITTER_ARCH=x64 ;;
  *) echo "No Neovim release build for $(uname -m)" >&2; exit 1 ;;
esac

# ripgrep and fd for telescope, python3-venv for mason's pip packages such as
# cfn-lint, stow for the dotfiles
apt-get install -y ripgrep fd-find python3-venv stow
ln -sfn "$(command -v fdfind)" /usr/local/bin/fd

curl -fsSL "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-${NVIM_ARCH}.tar.gz" |
  tar -xz -C /opt
ln -sfn "/opt/nvim-linux-${NVIM_ARCH}/bin/nvim" /usr/local/bin/nvim

# nvim-treesitter builds its parsers with the tree-sitter CLI
curl -fsSL "https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-${TREE_SITTER_ARCH}.gz" |
  gunzip > /usr/local/bin/tree-sitter
chmod +x /usr/local/bin/tree-sitter

# ruby_lsp starts `ruby-lsp` from PATH, before mason has installed its copy.
# gem puts executables in the Ruby's own bin, which is not on PATH.
gem install ruby-lsp --no-document --bindir /usr/local/bin

# The plugins install on the first run of nvim
cd /root
git clone https://github.com/smeyfroi/dotfiles
cd dotfiles
make
