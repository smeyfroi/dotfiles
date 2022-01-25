if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'overcache/NeoSolarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'lfv89/vim-interestingwords'
Plug 'mechatroner/rainbow_csv'
Plug 'zirrostig/vim-schlepp'
Plug 'moll/vim-bbye'
Plug 'schickling/vim-bufonly'
Plug 'mhinz/vim-hugefile'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'gabesoft/vim-ags'
Plug 'junegunn/vim-easy-align'
Plug 'neovim/nvim-lspconfig'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'

" Plug 'vim-scripts/YankRing.vim'
" Plug 'derekwyatt/vim-fswitch'

" Plug 'Valloric/MatchTagAlways'
" Plug 'mileszs/ack.vim'
" Plug 'tpope/vim-abolish'
" Plug 'machakann/vim-swap'
" Plug 'szw/vim-ctrlspace'
" Plug 'mg979/vim-visual-multi'
" Plug 'mbbill/undotree'
" Plug 'henrik/vim-qargs'
" Plug 'Lokaltog/vim-easymotion'

call plug#end()

set number

set termguicolors
set background=dark
set cursorline
colorscheme NeoSolarized

set mouse=a

set title

" edit vimrc {{{
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" }}}

" copy to system clipboard in visual mode with Ctrl-C {{{
vnoremap <C-c> "*y
" }}}

" window navigation {{{
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" }}}

" resize current buffer by +/- 5
if has('nvim')
  nnoremap <A-l> :vertical resize +5<CR>
  nnoremap <A-h> :vertical resize -5<CR>
  nnoremap <A-k> :resize -5<CR>
  nnoremap <A-j> :resize +5<CR>
endif

" tabs and indents {{{
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
set copyindent  " copy the previous indentation on autoindenting
vmap > >gv
vmap < <gv
" }}}

" search {{{
set showmatch  " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
nmap <silent> <leader>/ :nohlsearch<CR>

" NERDTree {{{
map <leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" switch {{{
nnoremap - :Switch<cr>
" }}}

" schlepp {{{
vmap <up>     <Plug>SchleppUp
vmap <down>   <Plug>SchleppDown
vmap <left>   <Plug>SchleppLeft
vmap <right>  <Plug>SchleppRight
vmap <S-up>   <Plug>SchleppIndentUp
vmap <S-down> <Plug>SchleppIndentDown
vmap <C-D>    <Plug>SchleppDupDown
" }}}

" gutentags {{{
let g:gutentags_ctags_exclude=["node_modules", "static"]
" }}}

" format JSON {{{
com! FormatJSON %!python -m json.tool
" }}}

" NERDTree {{{
map <leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" bye bye buffer {{{
:nnoremap <Leader>q :Bdelete<CR>
com! Bdeleteall :bufdo :Bdelete
" }}}

" close quickfix {{{
:nnoremap <Leader>c :cclose<CR>
" }}}

" {{{ apply macro to visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
" }}}

" Supercharged dot formula {{{
nnoremap <leader>; *``cgn
nnoremap <leader>, #``cgN
" }}}

" Ags {{{
autocmd BufNewFile,BufRead,BufEnter *.agsv set filetype=agsv
" }}}

" easyalign {{{
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
" }}}

" Open current line on GitHub
nnoremap <Leader>g :.Gbrowse<CR>

" highlight yank https://neovim.io/doc/user/lua.html#lua-highlight {{{
if has('nvim')
  au TextYankPost * silent! lua vim.highlight.on_yank()
endif
" }}}

" LSP {{{
" https://github.com/bash-lsp/bash-language-server
lua require'lspconfig'.bashls.setup{}
" https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph
lua require'lspconfig'.solargraph.setup{}
" https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
lua require'lspconfig'.tsserver.setup{}
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" {{{ ctrlspace
" https://github.com/vim-ctrlspace/vim-ctrlspace/issues/292
let g:CtrlSpaceEnableFilesCache = 0
" let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|ref|front_end|vendor|coverage|node_modules|bin)[\/]'
if has('nvim')
  let g:CtrlSpaceDefaultMappingKey = "<C-space> "
  let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
  let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
  let g:CtrlSpaceSaveWorkspaceOnExit = 1
endif
" }}}

