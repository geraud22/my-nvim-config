require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd' },  -- Install clangd for C/C++
})

-- LSP setup
local lsp = require('lsp-zero').preset('recommended')
lsp.setup()
