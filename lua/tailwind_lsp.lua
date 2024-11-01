local lspconfig = require('lspconfig')

local M = {}
M.setup = function()
	lspconfig.tailwindcss.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "templ", "javascript", "typescript", "react" },
		settings = {
			tailwindCSS = {
				includeLanguages = {
					templ = "html",
				},
			},
		},
	})
	end
return M

