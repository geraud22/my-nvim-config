vim.keymap.set("n", "<leader>e", ":Lexplore<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<leader>l", function()
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    vim.lsp.buf_detach_client(0, c.id)
    vim.notify("LSP clients detached from buffer", vim.log.levels.INFO)
  end
end, { desc = "Detach all LSP clients from current buffer" })
