local lspconfig = require('lspconfig')

lspconfig.jsonls.setup {
	settings = {
		json = {
			schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
          url = "https://json.schemastore.org/prettierrc"
        }
      },
      validate = { enable = true }
    }
  }
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.json",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})
