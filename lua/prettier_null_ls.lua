local null_ls = require("null-ls")

local M = {}
M.setup = function()
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.prettier.with({
				filetypes = { "html", "css", "javascript" },
			}),
		},
		on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.cmd([[
				  augroup LspFormatting
          			  autocmd! * <buffer>
            			  autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })
          			  augroup END
        			]])
			end
		end,
	})
end
return M
