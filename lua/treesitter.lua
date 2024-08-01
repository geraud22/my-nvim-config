require('nvim-treesitter.configs').setup {
	ensure_installed = {"lua", "javascript", "typescript", "python", "go", "markdown"},
			 highlight = {	 
			 	enabled = true,
				additional_vim_regex_highlighting = false,
			 },
			 indent = {
				enabled = true
			 },
}
