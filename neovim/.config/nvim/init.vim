lua require('settings')
lua require('keymaps')
lua require('commands')
lua require('plugins')

" " auto-install vim-plug
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif
"
" " Required:
" call plug#begin(expand('~/.config/nvim/plugged'))
"
" Plug 'nvim-lua/plenary.nvim' " lua utils for plugins
"
" Plug 'AndrewRadev/switch.vim' " '-' https://github.com/AndrewRadev/switch.vim
" Plug 'AndrewRadev/sideways.vim' "  c-, c-. https://github.com/AndrewRadev/sideways.vim
" Plug 'zirrostig/vim-schlepp' " vmap up, down, left, right and with Shift https://github.com/zirrostig/vim-schlepp
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
" Plug 'junegunn/vim-easy-align' " ga https://github.com/junegunn/vim-easy-align
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " https://github.com/nvim-treesitter/nvim-treesitter
" Plug 'akinsho/toggleterm.nvim', {'tag' : '2.3.0'}
" Plug 'phaazon/hop.nvim' " <leader>z (but see https://github.com/phaazon/hop.nvim)
" Plug 'lewis6991/gitsigns.nvim'
" Plug 'numToStr/Comment.nvim'
" Plug 'karb94/neoscroll.nvim' " smooth scroll https://github.com/karb94/neoscroll.nvim
" Plug 'nvim-lualine/lualine.nvim'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'tversteeg/registers.nvim' " show registers
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-nvim-lua'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'moll/vim-bbye' " Bdelete Bdeleteall https://github.com/moll/vim-bbye
" " Plug 'bronson/vim-trailing-whitespace' " :FixWhitespace
" Plug 'ishan9299/nvim-solarized-lua'
" Plug 'schickling/vim-bufonly' " Bonly https://github.com/schickling/vim-bufonly
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-unimpaired' " https://github.com/tpope/vim-unimpaired
" Plug 'tpope/vim-surround'
" Plug 'mhinz/vim-hugefile' " for files>2MB https://github.com/mhinz/vim-hugefile
" Plug 'AndrewRadev/splitjoin.vim' " gS gJ https://github.com/AndrewRadev/splitjoin.vim
" Plug 'mechatroner/rainbow_csv' " :RainbowDelim with cursor on delim https://github.com/mechatroner/rainbow_csv
" Plug 'wellle/targets.vim'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'lfv89/vim-interestingwords' " <leader>k <leader>K https://github.com/lfv89/vim-interestingwords
" Plug 'gabesoft/vim-ags'
"
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'AckslD/nvim-neoclip.lua'
"
"
"
"
" Plug 'VonHeikemen/lsp-zero.nvim'
"
" Plug 'neovim/nvim-lspconfig' " Core LSP https://github.com/neovim/nvim-lspconfig
" Plug 'williamboman/mason.nvim' " https://github.com/williamboman/mason.nvim
" Plug 'williamboman/mason-lspconfig.nvim' " https://github.com/williamboman/mason-lspconfig.nvim
" Plug 'hrsh7th/cmp-nvim-lsp'
"
" Plug 'jose-elias-alvarez/null-ls.nvim' " in-memory LSP for standalone language servers
" Plug 'jay-babu/mason-null-ls.nvim' " null-ls server management
" " Plug 'mrjones2014/nvim-ts-rainbow'
"
" call plug#end()
"
"
"
"
"
"
"
"
"
"
"
"
" " {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" colorscheme solarized
" " }}}
"
" " {{{ apply macro to visual selection
" xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" function! ExecuteMacroOverVisualRange()
"   echo "@".getcmdline()
"   execute ":'<,'>normal @".nr2char(getchar())
" endfunction
" " }}}
"
" " highlight yank https://neovim.io/doc/user/lua.html#lua-highlight {{{
" XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
" " }}}
"
" " switch {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" nnoremap - :Switch<cr>
" " }}}
"
" " sideways {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" nnoremap <c-,> :SidewaysLeft<cr>
" nnoremap <c-.> :SidewaysRight<cr>
" " }}}
"
" " schlepp {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" vmap <up>     <Plug>SchleppUp
" vmap <down>   <Plug>SchleppDown
" vmap <left>   <Plug>SchleppLeft
" vmap <right>  <Plug>SchleppRight
" vmap <S-up>   <Plug>SchleppIndentUp
" vmap <S-down> <Plug>SchleppIndentDown
" vmap <C-D>    <Plug>SchleppDupDown
" " }}}
"
" " CHADTree {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" map <leader>f :CHADopen<CR>
" " }}}
"
" " easyalign {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" nmap ga <Plug>(EasyAlign)
" xmap ga <Plug>(EasyAlign)
" " }}}
"
" " nvim-treesitter {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua <<EOF
"   require'nvim-treesitter.configs'.setup {
"     -- A list of parser names, or "all"
"     ensure_installed = { "bash", "lua", "cpp", "css", "dockerfile", "glsl", "html", "javascript", "json", "make", "python", "ruby", "tsx", "typescript", "vim", "yaml" },
"     highlight = { enable = true, },
"     indent = { enable = true },
"     incremental_selection = {
"       enable = true,
"       keymaps = {
"         init_selection = "gnn",
"         scope_incremental = "grc",
"         node_decremental = "grm",
"         -- node_incremental = "grn",
"       },
"     },
"     rainbow = {
"       enable = true,
"       -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
"       extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
"       max_file_lines = nil, -- Do not enable for files with more than n lines, int
"       -- colors = {}, -- table of hex strings
"       -- termcolors = {} -- table of colour name strings
"     },
"   }
" EOF
"
" " toggleterm {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua << END
" require("toggleterm").setup{
"   -- size can be a number or function which is passed the current terminal
"   -- size = 20 | function(term)
"   --   if term.direction == "horizontal" then
"   --     return 15
"   --   elseif term.direction == "vertical" then
"   --     return vim.o.columns * 0.4
"   --   end
"   -- end,
"   open_mapping = [[<c-\>]],
"   insert_mappings = true, -- whether or not the open mapping applies in insert mode
"   terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
"   direction = 'float',
"   close_on_exit = true, -- close the terminal window when the process exits
"   -- float_opts = {
"   --   width = <value>,
"   --   height = <value>,
"   -- }
" }
" END
" " }}}
"
" " folds XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" set foldmethod=manual " or expr to use TS
" " set foldexpr=nvim_treesitter#foldexpr()
" " autocmd BufReadPost,FileReadPost * normal zR
" " }}}
"
" " hop {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua require'hop'.setup()
" nnoremap <leader>z <cmd>HopWord<cr>
" " }}}
"
" " gitsigns {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua <<LUA
"   require('gitsigns').setup {
"     current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
"   }
" LUA
" " }}}
"
" " Comment {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua require('Comment').setup()
" " }}}
"
" " neoscroll {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua require('neoscroll').setup()
" " }}}
"
" " lualine {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua require('lualine').setup()
" " }}}
"
" " indent-blankline {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua require("indent_blankline").setup {}
" " }}}
"
" " registers {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua require("registers").setup({})
" " }}}
"
" " completion {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua <<EOF
"   local cmp = require('cmp')
"   -- Complete nvim's internal API
"   -- cmp.setup {
"   --   sources = {
"   --     { name = 'nvim_lua' }
"   --   }
"   -- }
"   -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline('/', {
"     mapping = cmp.mapping.preset.cmdline(),
"     sources = {
"       { name = 'buffer' }
"     }
"   })
"
"   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline(':', {
"     mapping = cmp.mapping.preset.cmdline(),
"     sources = cmp.config.sources({
"       { name = 'path' }
"     }, {
"       { name = 'cmdline' }
"     })
"   })
" EOF
" " }}}
"
" " bye bye buffer {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" :nnoremap <Leader>q :Bdelete<CR>
" com! Bdeleteall :bufdo :Bdelete
" " }}}
"
" " XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua <<EOF
"   vim.diagnostic.config({ virtual_text = true })
" EOF
"
" " Ags {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" autocmd BufNewFile,BufRead,BufEnter *.agsv set filetype=agsv
" " }}}
"
"
"
"
"
"
" " LSP {{{
" lua <<EOF
"   local lsp = require('lsp-zero').preset({
"     name = 'minimal',
"     set_lsp_keymaps = true,
"     manage_nvim_cmp = true,
"     suggest_lsp_servers = false,
"   })
"   lsp.on_attach(function(client, bufnr)
"     local opts = {buffer = bufnr}
"     local bind = vim.keymap.set
"     bind('n', '<F3>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
"   end)
"   lsp.setup_nvim_cmp({
"     preselect = 'none',
"     completion = {
"       completeopt = 'menu,menuone,noinsert,noselect'
"     },
"   })
"   lsp.setup()
" EOF
"
" lua <<EOF
"   local null_ls = require("null-ls")
"   local sources = {
"       null_ls.builtins.formatting.prettier,
"       null_ls.builtins.diagnostics.write_good,
"       null_ls.builtins.code_actions.gitsigns,
"       null_ls.builtins.diagnostics.actionlint,
"       null_ls.builtins.diagnostics.cfn_lint.with({
"         filetypes = { "yaml", "yml", "json", "template" },
"       }),
"       null_ls.builtins.diagnostics.checkmake,
"       null_ls.builtins.diagnostics.eslint,
"       null_ls.builtins.diagnostics.glslc.with({
"         extra_args = { "--target-env=opengl" }, -- use opengl instead of vulkan1.0
"       }),
"       null_ls.builtins.diagnostics.hadolint,
"       null_ls.builtins.diagnostics.markdownlint,
"       null_ls.builtins.diagnostics.rubocop,
"       null_ls.builtins.diagnostics.yamllint,
"       null_ls.builtins.formatting.jq,
"       -- null_ls.builtins.formatting.json_tool,
"       null_ls.builtins.formatting.mdformat,
"       null_ls.builtins.formatting.prettier,
"       null_ls.builtins.formatting.rubocop,
"   }
"   null_ls.setup({ sources = sources })
"   require("mason-null-ls").setup()
" EOF
"
" " vim-vsnip {{{
" " Jump forward or backward
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" " See https://github.com/hrsh7th/vim-vsnip/pull/50
" " nmap        s   <Plug>(vsnip-select-text)
" " xmap        s   <Plug>(vsnip-select-text)
" " nmap        S   <Plug>(vsnip-cut-text)
" " xmap        S   <Plug>(vsnip-cut-text)
" " }}}
"
" " friendly-snippets {{{
" let g:vsnip_filetypes = {}
" let g:vsnip_filetypes.javascriptreact = ['javascript']
" let g:vsnip_filetypes.typescriptreact = ['typescript']
" let g:vsnip_filetypes.ruby = ['rails']
" " }}}
"
"
"
"
"
" " telescope {{{ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" lua << END
"   require('telescope').setup{
"     defaults = {
"       preview_cutoff = 60,
"       mappings = {
"         n = {
"           ['<c-d>'] = require('telescope.actions').delete_buffer
"         },
"         i = {
"           ['<c-/>'] = "which_key",
"           ['<c-d>'] = require('telescope.actions').delete_buffer
"         }
"       }
"     }
"   }
"   require('telescope').load_extension('fzf')
"   require('neoclip').setup()
"   require('telescope').load_extension('neoclip')
"   require('telescope').load_extension('file_browser')
" END
" nnoremap <C-space> <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>ff <cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
" nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
" " nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>
" nnoremap <leader>fy <cmd>lua require('telescope').extensions.neoclip.default()<cr>
" nnoremap <leader>fm <cmd>lua require('telescope').extensions.macroscope.default()<cr>
" " }}}
"
