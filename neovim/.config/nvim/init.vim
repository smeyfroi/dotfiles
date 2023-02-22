" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'ishan9299/nvim-solarized-lua'
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
Plug 'jose-elias-alvarez/null-ls.nvim' " in-memory LSP for standalone language servers
Plug 'jay-babu/mason-null-ls.nvim' " null-ls server management
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
Plug 'mrjones2014/nvim-ts-rainbow'

" Plug 'tpope/vim-abolish'
" Plug 'machakann/vim-swap'
" Plug 'mg979/vim-visual-multi'
" Plug 'henrik/vim-qargs'
" Plug 'kassio/neoterm' " :Tnew, :Tclear

call plug#end()

set number
autocmd TermOpen * setlocal nonumber norelativenumber

set termguicolors
set background=dark
set cursorline
set cursorcolumn
colorscheme solarized

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
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
  }
EOF
" folds
set foldmethod=manual " or expr to use TS
" set foldexpr=nvim_treesitter#foldexpr()
" autocmd BufReadPost,FileReadPost * normal zR
" }}}

" completion {{{
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
" }}}

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

lua <<EOF
  vim.diagnostic.config({ virtual_text = true })
EOF

lua <<EOF
  local null_ls = require("null-ls")
  local sources = {
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.write_good,
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.diagnostics.actionlint,
      null_ls.builtins.diagnostics.cfn_lint.with({
        filetypes = { "yaml", "yml", "json", "template" },
      }),
      null_ls.builtins.diagnostics.checkmake,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.diagnostics.glslc.with({
        extra_args = { "--target-env=opengl" }, -- use opengl instead of vulkan1.0
      }),
      null_ls.builtins.diagnostics.hadolint,
      null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.diagnostics.rubocop,
      null_ls.builtins.diagnostics.yamllint,
      null_ls.builtins.formatting.jq,
      -- null_ls.builtins.formatting.json_tool,
      null_ls.builtins.formatting.mdformat,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.rubocop,
  }
  null_ls.setup({ sources = sources })
  require("mason-null-ls").setup()
EOF

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
