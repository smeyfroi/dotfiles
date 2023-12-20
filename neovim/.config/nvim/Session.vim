let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dotfiles/neovim/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/dotfiles/neovim/.config/nvim/lua/plugins-enabled/neodev.lua
badd +1 ~/dotfiles/neovim/.config/nvim/lua/plugins-disabled/treesitter.lua
badd +17 ~/dotfiles/neovim/.config/nvim/lua/plugins-enabled/nvim-treesitter.lua
badd +6 lua/plugins-enabled/nvim-lspconfig.lua
badd +0 ~/dotfiles/neovim/.config/nvim/lua/plugins-enabled/nvim-treesitter-context.lua
argglobal
%argdel
edit lua/plugins-enabled/nvim-lspconfig.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 119) / 238)
exe 'vert 2resize ' . ((&columns * 103 + 119) / 238)
exe 'vert 3resize ' . ((&columns * 103 + 119) / 238)
argglobal
enew
file NvimTree_1
balt ~/dotfiles/neovim/.config/nvim/lua/plugins-enabled/nvim-treesitter.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 44 - ((43 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 44
normal! 013|
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/neovim/.config/nvim/lua/plugins-enabled/nvim-treesitter-context.lua", ":p")) | buffer ~/dotfiles/neovim/.config/nvim/lua/plugins-enabled/nvim-treesitter-context.lua | else | edit ~/dotfiles/neovim/.config/nvim/lua/plugins-enabled/nvim-treesitter-context.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/neovim/.config/nvim/lua/plugins-enabled/nvim-treesitter-context.lua
endif
balt ~/dotfiles/neovim/.config/nvim/lua/plugins-disabled/treesitter.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 060|
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 119) / 238)
exe 'vert 2resize ' . ((&columns * 103 + 119) / 238)
exe 'vert 3resize ' . ((&columns * 103 + 119) / 238)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
