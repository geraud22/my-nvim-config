local lspconfig = require('lspconfig')

local M = {}
M.setup = function()
	lspconfig.htmx.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "templ", "html" },
	})
	end
return M
