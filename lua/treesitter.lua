require('nvim-treesitter.configs').setup {
	ensure_installed = {"lua",
			"python",
			"go",
			"markdown",
			"yaml",
			"c", "cpp",
			"vue",
			"javascript", "typescript", "css", "html"},
			 highlight = {
			 	enabled = true,
				additional_vim_regex_highlighting = false,
			 },
			 indent = {
				enabled = true
			 },
			 textobjects = {
				 select = {
					 enable = true,
					 lookahead = true,
					 keymaps = {
						 ["af"] = "@function.outer",
						 ["if"] = "@function.inner",
						 ["ac"] = "@class.outer",
						 ["ic"] = "@class.inner",
					 },
				 },
			 },
}
