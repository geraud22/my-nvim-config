local lspconfig = require('lspconfig')
local lsp_setup = require('my_lsp_config')

lspconfig.ts_ls.setup{
	on_attach = function(client, bufnr)
		lsp_setup.on_attach(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_command [[augroup Format]]
			vim.api.nvim_command [[autocmd! * <buffer>]]
			vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
			vim.api.nvim_command [[augroup END]]
		end

		require('lsp_signature').on_attach({
			bind = true,
			handler_opts = {
				border = "single"
			}
		}, bufnr)
	end,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }
}
