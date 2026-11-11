vim.keymap.set("n", "<leader>e", ":Lexplore<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<leader>h", ":split<CR>")
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>l", function()
	for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		vim.lsp.buf_detach_client(0, c.id)
		vim.notify("LSP clients detached from buffer", vim.log.levels.INFO)
	end
end, { desc = "Detach all LSP clients from current buffer" })

-- Cycle forward through native completion suggestions with Tab
vim.keymap.set("i", "<Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, silent = true })

-- Cycle backward through native completion suggestions with Shift+Tab
vim.keymap.set("i", "<S-Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, silent = true })

-- Confirm the selected native completion item with Enter
vim.keymap.set("i", "<CR>", function()
	return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true, silent = true })
