" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ray-x/go.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'scottmckendry/cyberdream.nvim', { 'as': 'cyberdream' }
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'sindrets/diffview.nvim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-autoformat/vim-autoformat'
Plug 'tpope/vim-vinegar'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" C/C++ Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'jayp0521/mason-nvim-dap.nvim'
Plug 'VonHeikemen/lsp-zero.nvim', { 'branch': 'v1.x' }
Plug 'nvim-lua/plenary.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-neotest/nvim-nio'
call plug#end()
lua require('nvim-cmp')
lua require('tsserver')
lua require('treesitter')
lua require('mason-lsp')
lua require('dap-debug')
lua require('jsonls')
lua require('themes/nightfly_init')
lua require('themes/cyberdream_init')
lua require('omnisharp').setup()
lua << EOF
require('fzf-config').setup()
require('notify').setup({
  stages = "fade_in_slide_out",
  timeout = 3000,
})
vim.notify = require("notify")
EOF

let g:formatdef_jq = '"jq ."'
let g:formatters_json = ['jq']

let g:gruvbox_bold = '1'
let g:gruvbox_transparent_bg = '1'
let g:gruvbox_italic = '1'
let g:gruvbox_underline = '1'
let g:gruvbox_improved_warnings = '1'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italicize_strings = '0'
let g:gruvbox_improved_strings = '0'

let g:go_template_autocreate = 0

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

colorscheme cyberdream
set clipboard=unnamedplus
set number relativenumber
set cursorline
nnoremap <leader>y +y
nnoremap <C-Q> <C-V>
vnoremap <C-Q> <C-V>
inoremap <C-Q> <C-V>
cnoremap <C-Q> <C-V>
nnoremap <silent> <Esc> :nohlsearch<CR>
autocmd BufWritePost * let save_pos = getpos(".") | silent! write | call setpos('.', save_pos)
