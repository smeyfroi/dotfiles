# Finder's .DS_Store files and Neovim logs are not config
STOW = stow --verbose --target=$$HOME --ignore='\.DS_Store' --ignore='\.?nvim\.?log'

all:
	$(STOW) --restow */

delete:
	$(STOW) --delete */
