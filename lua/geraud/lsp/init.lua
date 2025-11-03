local gopls = require("geraud.lsp.gopls")
vim.lsp.config('gopls', gopls)
vim.lsp.enable('gopls')
local pylsp = require("geraud.lsp.pylsp")
vim.lsp.config('pylsp', pylsp)
vim.lsp.enable('pylsp')
local rustlsp = require("geraud.lsp.rust-analyzer")
vim.lsp.config('rust-analyzer', rustlsp)
vim.lsp.enable('rust-analyzer')

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("LspKeybinds", { clear = true }),
    callback = function(event) 
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end
})

autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
    callback = function(event) 
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = event.buf,
            callback = function() 
                vim.lsp.buf.format({ async = false, id = event.data.client_id })
            end,
        })
    end
})
