if has('vim_starting')
  set nocompatible               " Be iMproved
endif

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'overcache/NeoSolarized'
if has('nvim')
  Plug 'nvim-lua/plenary.nvim' " lua utils for plugins
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'phaazon/hop.nvim' " <leader>z (but see https://github.com/phaazon/hop.nvim)
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  Plug 'numToStr/Comment.nvim'
  Plug 'karb94/neoscroll.nvim' " smooth scroll https://github.com/karb94/neoscroll.nvim
  Plug 'tversteeg/registers.nvim' " show registers
  Plug 'kassio/neoterm' " :Tnew
else
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-commentary'
endif
Plug 'bronson/vim-trailing-whitespace' " :FixWhitespace
Plug 'tpope/vim-unimpaired' " https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/switch.vim' " - https://github.com/AndrewRadev/switch.vim
Plug 'AndrewRadev/splitjoin.vim' " gS gJ https://github.com/AndrewRadev/splitjoin.vim
Plug 'AndrewRadev/sideways.vim' "  c-, c-. https://github.com/AndrewRadev/sideways.vim
Plug 'lfv89/vim-interestingwords' " <leader>k <leader>K https://github.com/lfv89/vim-interestingwords
Plug 'mechatroner/rainbow_csv' " :RainbowDelim with cursor on delim https://github.com/mechatroner/rainbow_csv
Plug 'zirrostig/vim-schlepp' " vmap up, down, left, right and with Shift https://github.com/zirrostig/vim-schlepp
Plug 'moll/vim-bbye' " Bdelete Bdeleteall https://github.com/moll/vim-bbye
Plug 'schickling/vim-bufonly' " Bonly https://github.com/schickling/vim-bufonly
Plug 'mhinz/vim-hugefile' " for files>2MB https://github.com/mhinz/vim-hugefile
Plug 'gabesoft/vim-ags'
Plug 'junegunn/vim-easy-align' " ga https://github.com/junegunn/vim-easy-align
if has('nvim')
  Plug 'williamboman/nvim-lsp-installer' " Automate LSP server installation
  Plug 'neovim/nvim-lspconfig' " Core LSP https://github.com/neovim/nvim-lspconfig
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " https://github.com/nvim-treesitter/nvim-treesitter
endif

" Look at nvim-lint, but has no cfn plugin
" Plug 'vim-syntastic/syntastic'
" Plug 'speshak/vim-cfn'
" Plug 'sheerun/vim-polyglot'

" Plug 'vim-scripts/YankRing.vim'
" Plug 'derekwyatt/vim-fswitch'

" Plug 'Valloric/MatchTagAlways'
" Plug 'mileszs/ack.vim'
" Plug 'tpope/vim-abolish'
" Plug 'machakann/vim-swap'
" Plug 'mg979/vim-visual-multi'
" Plug 'mbbill/undotree'
" Plug 'henrik/vim-qargs'

call plug#end()

set number
autocmd TermOpen * setlocal nonumber norelativenumber

set termguicolors
set background=dark
set cursorline
set cursorcolumn
colorscheme NeoSolarized

set mouse=a
set title
set undofile

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
nmap <silent> <leader>/ :nohlsearch<CR>

" word wrap {{{
lua vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
lua vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
" }}}

" switch {{{
nnoremap - :Switch<cr>
" }}}

" sideways {{{
nnoremap <c-,> :SidewaysLeft<cr>
nnoremap <c-.> :SidewaysRight<cr>
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

" format JSON {{{
com! FormatJSON %!python -m json.tool
" }}}

" CHADTree {{{
map <leader>f :CHADopen<CR>
" }}}

" NERDTree {{{
" map <leader>f :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
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

" highlight yank https://neovim.io/doc/user/lua.html#lua-highlight {{{
if has('nvim')
  au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
endif
" }}}

set completeopt=menu,menuone,noselect

" nvim-treesitter {{{
if has('nvim')
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "bash", "lua", "cpp", "css", "dockerfile", "glsl", "html", "javascript", "json", "make", "python", "ruby", "tsx", "typescript", "vim", "yaml" },
    highlight = { enable = true, },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        scope_incremental = "grc",
        node_decremental = "grm",
        -- node_incremental = "grn",
      },
    },
  }
EOF
endif
" }}}

" vim-cmp {{{
lua <<EOF
  -- Setup nvim-cmp. includes SuperTab from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lsp and lspconfig
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  local servers = { 'pyright', 'tsserver', 'jsonls', 'solargraph', 'bashls', 'yamlls', 'vimls', 'cssls', 'dockerls', 'html', 'clangd', 'sumneko_lua', 'sqlls' }
  require('nvim-lsp-installer').setup { ensure_installed = servers }
  for _, server in pairs(servers) do
    require('lspconfig')[server].setup {
      on_attach = on_attach,
      flags = { debounce_text_changes = 150 }, -- default for nvim 0.7+ ???
      capabilities = capabilities,
    }
  end
EOF

lua <<EOF
-- require'navigator'.setup()
EOF

" vim-vsnip {{{
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
" }}}

" friendly-snippets {{{
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
let g:vsnip_filetypes.ruby = ['rails']
" }}}

" Syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_cloudformation_checkers = ['cfn_lint']
" let g:syntastic_ruby_checkers = ['rubocop', 'mri']
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

" gitsigns {{{
if has('nvim')
lua <<LUA
  require('gitsigns').setup {
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  }
LUA
endif
" }}}

" hop {{{
if has('nvim')
  lua require'hop'.setup()
  nnoremap <leader>z <cmd>HopWord<cr>
endif
" }}}

" Comment {{{
if has('nvim')
  lua require('Comment').setup()
endif
" }}}

" neoscroll {{{
if has('nvim')
  lua require('neoscroll').setup()
endif
" }}}

" neoterm {{{
if has('nvim')
  let g:neoterm_default_mod='botright'
endif
" }}}

" lualine {{{
if has('nvim')
lua << END
  require('lualine').setup()
END
endif
" }}}

set guifont=EssentialPragmataPro\ Nerd\ Font:h13
