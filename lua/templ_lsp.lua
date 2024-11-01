local lspconfig = require('lspconfig')
local my_lsp_config = require('my_lsp_config')

local custom_format = function()
    if vim.bo.filetype == "templ" then
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local cmd = "templ fmt " .. vim.fn.shellescape(filename)

        vim.fn.jobstart(cmd, {
            on_exit = function()
                -- Reload the buffer only if it's still the current buffer
                if vim.api.nvim_get_current_buf() == bufnr then
                    vim.cmd('e!')
                end
            end,
        })
    else
        vim.lsp.buf.format()
    end
end

vim.filetype.add({ extension = { templ = "templ" } })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = custom_format })

local M = {}
M.setup = function()
	lspconfig.templ.setup({
		on_attach = function(client, bufnr)
			my_lsp_config.on_attach(client, bufnr, { show_diagnostics = true })
		end,
		capabilities = capabilities,
	})
	end
return M
