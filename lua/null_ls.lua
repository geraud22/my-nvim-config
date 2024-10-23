local null_ls = require("null-ls")
local lsp_setup = require("my_lsp_config")
local M = {}
M.setup = function()
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.prettierd.with({
				filetypes = { 'javascript', 'typescript', 'css', 'html', 'vue' }
			}),
			null_ls.builtins.formatting.eslint_d.with({
				filetypes = { 'javascript', 'typescript', 'vue' }
			}),
			null_ls.builtins.code_actions.eslint_d,
			null_ls.builtins.diagnostics.eslint_d.with({
				underline = true,
				virtual_text = false,
				signs = true,
				update_in_insert = false,
				severity_sort = true,
			}),
		},
		on_attach = function(client, bufnr)
			lsp_setup.on_attach(client, bufnr)
			if client.supports_method("textDocument/formatting") then
            			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            			vim.api.nvim_create_autocmd("BufWritePre", {
                			group = augroup,
                			buffer = bufnr,
                			callback = function()
                    			vim.lsp.buf.format({ async = false })
                			end
				})
			end
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
				'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
				{ noremap = true, silent = true })
		end,
	})
end
return M
