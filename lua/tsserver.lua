local lspconfig = require('lspconfig')
local lsp_setup = require('my_lsp_config')
local mason_registry = require('mason-registry')
local vue_language_server_path  = "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"

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
	init_options = {
        	plugins = {
        		{
        			name = '@vue/typescript-plugin',
				location = vue_language_server_path,
                		languages = { 'vue' },
            		},
        	},
	},
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }
}

lspconfig.volar.setup {
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
	filetypes = { "vue" }
}
