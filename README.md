# Steve's dotfiles

## MacOS

- `brew install stow`
- `git clone git@github.com:smeyfroi/dotfiles.git`
- `make` (links configs to those in dotfiles)

## Geo.me dev containers

`geome/.config/geome/dev-container/run.sh` installs Neovim and the tools its
plugins need in a Geo.me project's dev container, then clones this repo there
and runs `make`. `make` links it to `~/.config/geome/dev-container/`, where
dockerbe's `make build` finds it. A change to the script takes effect at the
next `make clean build`. A change to the configs takes effect once it is
pushed, because the container clones this repo from GitHub.
