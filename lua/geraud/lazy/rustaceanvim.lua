return {
	"https://github.com/mrcjkb/rustaceanvim",
	version = "^9",
	lazy = false,
	init = function()
		-- Update this path
		local extension_path = vim.env.HOME .. "/.local/share/codelldb/extension/"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local liblldb_path = extension_path .. "lldb/lib/liblldb"
		local this_os = vim.uv.os_uname().sysname
		-- The liblldb extension is .so for Linux and .dylib for MacOS
		liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
		local cfg = require("rustaceanvim.config")
		vim.g.rustaceanvim = {
			server = {
                default_settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                        diagnostics = {
                            disabled = { "macro-error", "unresolved-macro-call" },
                        },
                    },
                },
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "K", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, { buffer = bufnr, silent = true, desc = "Rust hover actions" })
				end,
			},
			dap = {
				adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		}
	end,
}
