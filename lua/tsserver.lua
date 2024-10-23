local lspconfig = require('lspconfig')
local lsp_setup = require('my_lsp_config')
local vue_language_server_path  = "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"

lspconfig.ts_ls.setup{
	on_attach = lsp_setup.on_attach,
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
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx', 'vue' }
}

lspconfig.volar.setup ({
	on_attach = lsp_setup.on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
