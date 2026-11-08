vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.mousehide = true
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.opt.clipboard = "unnamedplus"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Make use of native completions since v0.12
vim.o.autocomplete = true -- Enables Neovim 0.12 auto-triggering
vim.o.autocompletedelay = 250 -- Milliseconds delay before popping up

-- menuone: show menu even if there is only 1 match
-- noselect: don't automatically insert text until you press Tab or select it
-- fuzzy: use 0.12's new native fuzzy matching engine
vim.opt.completeopt = "menu,menuone,noselect,fuzzy"
