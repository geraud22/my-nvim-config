local nvim_lsp = require('lspconfig')
local nvim_lsp_setup = require('my_lsp_config')
local M = {}
M.setup = function()
	nvim_lsp.omnisharp.setup({
		cmd = { "dotnet", "/mnt/d/csharp-projects/omnisharp/OmniSharp.dll" },
		on_attach = nvim_lsp_setup.on_attach,
		root_dir = nvim_lsp.util.root_pattern("*.sln", "*.csproj", ".git"),
	})
end
return M
