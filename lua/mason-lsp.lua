local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local custom_on_attach = require('my_lsp_config').on_attach
local gopls_custom = require('my_gopls_setup')
local prettier_null_ls_setup = require("prettier_null_ls")

mason.setup()

mason_lspconfig.setup({
    ensure_installed = { 'clangd', 'jsonls', 'gopls', 'html' },
})

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = custom_on_attach,
        })
    end,

    ['gopls'] = function()
        gopls_custom.setup()
    end,
})

lspconfig.html.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
