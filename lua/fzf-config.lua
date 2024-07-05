local M = {}
M.setup = function()
	vim.g.fzf_layout = { down = '25%' }
	vim.api.nvim_set_keymap('n', '<leader>ff', ':FZF<CR>', { noremap = true, silent = true })
end
return M
