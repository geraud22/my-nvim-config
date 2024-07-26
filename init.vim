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
Plug 'vim-scripts/netrw'
call plug#end()
lua require('nvim-cmp')
lua require('tsserver')
lua << EOF
require('fzf-config').setup()
require('gopls').setup()
EOF

autocmd BufWrite *.json :Autoformat

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

colorscheme gruvbox
set clipboard=unnamedplus
set number relativenumber
nnoremap <leader>y +y
nnoremap <C-Q> <C-V>
vnoremap <C-Q> <C-V>
inoremap <C-Q> <C-V>
cnoremap <C-Q> <C-V>
nnoremap <silent> <Esc> :nohlsearch<CR>
