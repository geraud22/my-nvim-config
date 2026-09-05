require("geraud.lsp.lua_ls")
require("geraud.lsp.gopls")
require("geraud.lsp.html")
local pylsp = require("geraud.lsp.pylsp")
vim.lsp.config('pylsp', pylsp)
vim.lsp.enable('pylsp')
local rustlsp = require("geraud.lsp.rust-analyzer")
vim.lsp.config('rust-analyzer', rustlsp)
vim.lsp.enable('rust-analyzer')
local jsonls = require("geraud.lsp.jsonls")
vim.lsp.config('jsonls', jsonls)
vim.lsp.enable('jsonls')
local eslint = require('geraud.lsp.eslint')
vim.lsp.config('eslint', eslint)
vim.lsp.enable('eslint')

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
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client:supports_method("textDocument/formatting") then 
                    vim.lsp.buf.format({ 
                        async = false, 
                        id = event.data.client_id,
                        position_encoding = client.offset_encoding or "utf-16",
                    })
                end
            end,
        })
    end
})

vim.opt.completeopt = "menu,menuone,noselect,popup" -- Ensures the menu appears even for a single match and uses the native popup window.
vim.o.autocomplete = true -- Enables the overall completion feature.

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspCompletion", { clear = true }),
  callback = function(args)
    local client_id = args.data.client_id
    if not client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)
    if client and client:supports_method("textDocument/completion") then
      -- Enable native LSP completion for this client + buffer
      vim.lsp.completion.enable(true, client_id, args.buf, {
        autotrigger = true,   -- auto-show menu as you type (recommended)
        -- You can also set { autotrigger = false } and trigger manually with <C-x><C-o>
      })
    end
  end,
})
