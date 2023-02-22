" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'overcache/NeoSolarized'
Plug 'nvim-lua/plenary.nvim' " lua utils for plugins
Plug 'lewis6991/gitsigns.nvim'
Plug 'phaazon/hop.nvim' " <leader>z (but see https://github.com/phaazon/hop.nvim)
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'numToStr/Comment.nvim'
Plug 'karb94/neoscroll.nvim' " smooth scroll https://github.com/karb94/neoscroll.nvim
Plug 'tversteeg/registers.nvim' " show registers
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '2.3.0'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'bronson/vim-trailing-whitespace' " :FixWhitespace
Plug 'tpope/vim-unimpaired' " https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/switch.vim' " '-' https://github.com/AndrewRadev/switch.vim
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
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'neovim/nvim-lspconfig' " Core LSP https://github.com/neovim/nvim-lspconfig
Plug 'williamboman/mason.nvim' " https://github.com/williamboman/mason.nvim
Plug 'williamboman/mason-lspconfig.nvim' " https://github.com/williamboman/mason-lspconfig.nvim
" Plug 'jose-elias-alvarez/null-ls.nvim' " in-memory LSP for prettier
" Plug 'MunifTanjim/prettier.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " https://github.com/nvim-treesitter/nvim-treesitter
" Plug 'folke/trouble.nvim' # list of LSP diagnostics, references etc

" Plug 'tpope/vim-abolish'
" Plug 'machakann/vim-swap'
" Plug 'mg979/vim-visual-multi'
" Plug 'henrik/vim-qargs'
" Plug 'github/copilot.vim' " Github Copilot
" Plug 'kassio/neoterm' " :Tnew, :Tclear

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

" resize current buffer by +/- 5 {{{
nnoremap <A-l> :vertical resize +5<CR>
nnoremap <A-h> :vertical resize -5<CR>
nnoremap <A-k> :resize -5<CR>
nnoremap <A-j> :resize +5<CR>
" }}}

" tabs and indents {{{
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
set copyindent  " copy the previous indentation on autoindenting
" }}}

" don't lose visual selection on indent in visual mode {{{
vmap > >gv
vmap < <gv
" }}}

" search {{{
set showmatch  " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise
nmap <silent> <leader>/ :nohlsearch<CR>
" }}}

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

" CHADTree {{{
map <leader>f :CHADopen<CR>
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
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
" }}}

set completeopt=menu,menuone,noselect

" nvim-treesitter {{{
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
" folds
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd BufReadPost,FileReadPost * normal zR
" }}}

" vim-cmp {{{
"lua <<EOF
"  -- Setup nvim-cmp. includes SuperTab from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
"  local has_words_before = function()
"    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
"    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
"  end
"  local feedkey = function(key, mode)
"    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
"  end
"
"  local cmp = require'cmp'
"
"  cmp.setup({
"    snippet = {
"      -- REQUIRED - you must specify a snippet engine
"      expand = function(args)
"        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
"      end,
"    },
"    window = {
"    },
"    mapping = cmp.mapping.preset.insert({
"      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
"      ['<C-f>'] = cmp.mapping.scroll_docs(4),
"      ['<C-Space>'] = cmp.mapping.complete(),
"      ['<C-e>'] = cmp.mapping.abort(),
"      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
"      ["<Tab>"] = cmp.mapping(function(fallback)
"        if cmp.visible() then
"          cmp.select_next_item()
"        elseif vim.fn["vsnip#available"](1) == 1 then
"          feedkey("<Plug>(vsnip-expand-or-jump)", "")
"        elseif has_words_before() then
"          cmp.complete()
"        else
"          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
"        end
"      end, { "i", "s" }),
"      ["<S-Tab>"] = cmp.mapping(function()
"        if cmp.visible() then
"          cmp.select_prev_item()
"        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
"          feedkey("<Plug>(vsnip-jump-prev)", "")
"        end
"      end, { "i", "s" }),
"    }),
"    sources = cmp.config.sources({
"      { name = 'nvim_lsp' },
"      { name = 'vsnip' },
"    }, {
"      { name = 'buffer' },
"    })
"  })

" completion
lua <<EOF
  local cmp = require'cmp'
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
EOF

" LSP {{{
lua <<EOF
  local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
  })
  lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr}
    local bind = vim.keymap.set
    bind('n', '<F3>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  end)
  lsp.setup()
EOF

" lua <<EOF
" require("prettier").setup({})
" EOF

" format JSON {{{
com! FormatJSON %!python -m json.tool
" }}}

" vim-vsnip {{{
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)
" }}}

" friendly-snippets {{{
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
let g:vsnip_filetypes.ruby = ['rails']
" }}}


" gitsigns {{{
lua <<LUA
  require('gitsigns').setup {
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  }
LUA
" }}}

" hop {{{
lua require'hop'.setup()
nnoremap <leader>z <cmd>HopWord<cr>
" }}}

" Comment {{{
lua require('Comment').setup()
" }}}

" neoscroll {{{
lua require('neoscroll').setup()
" }}}

" neoterm {{{
let g:neoterm_default_mod='botright'
" }}}

" lualine {{{
lua require('lualine').setup()
" }}}

" indent-blankline {{{
lua require("indent_blankline").setup {}
" }}}

" registers {{{
lua require("registers").setup({})
" }}}

" telescope {{{
lua << END
  require('telescope').setup{
    defaults = {
      preview_cutoff = 60,
      mappings = {
        n = {
          ['<c-d>'] = require('telescope.actions').delete_buffer
        },
        i = {
          ['<c-/>'] = "which_key",
          ['<c-d>'] = require('telescope.actions').delete_buffer
        }
      }
    }
  }
  require('telescope').load_extension('fzf')
  require('neoclip').setup()
  require('telescope').load_extension('neoclip')
  require('telescope').load_extension('file_browser')
END
nnoremap <C-space> <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>
" nnoremap <leader>ff <cmd>lua require('telescope').extensions.file_browser.file_browser(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
" nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>
nnoremap <leader>fy <cmd>lua require('telescope').extensions.neoclip.default()<cr>
nnoremap <leader>fm <cmd>lua require('telescope').extensions.macroscope.default()<cr>
" }}}

" toggleterm {{{
lua << END
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  -- size = 20 | function(term)
  --   if term.direction == "horizontal" then
  --     return 15
  --   elseif term.direction == "vertical" then
  --     return vim.o.columns * 0.4
  --   end
  -- end,
  open_mapping = [[<c-\>]],
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  -- float_opts = {
  --   width = <value>,
  --   height = <value>,
  -- }
}
END
" }}}

set guifont=EssentialPragmataPro\ Nerd\ Font:h13
