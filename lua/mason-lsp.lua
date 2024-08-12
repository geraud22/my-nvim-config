local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local custom_on_attach = require('my_lsp_config').on_attach

mason.setup()
mason_lspconfig.setup({
	ensure_installed = { 'clangd' },
})
mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = custom_on_attach,
		})
	end
})
