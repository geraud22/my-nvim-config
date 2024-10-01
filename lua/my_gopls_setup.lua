local lspconfig = require('lspconfig')
local lsp_setup = require('my_lsp_config')
local M = {}
M.setup = function()
	lspconfig.gopls.setup({
		on_attach = lsp_setup.on_attach,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
		},
		flags = {
			debounce_text_changes = 150,
			},
		})
	end
return M
