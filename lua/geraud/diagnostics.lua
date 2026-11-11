vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    virtual_text = { spacing = 2, prefix = "●" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
        },
    },
    float = {
        border = "rounded",
        source = true,
        focusable = false,
    },
    jump = {
        on_jump = function(_, bufnr) 
            vim.diagnostic.open_float({bufnr = bufnr, scope = "cursor", focus = false})
        end,
    },
})

vim.keymap.set("n", "]d",
    function() vim.diagnostic.jump({count = 1}) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d",
    function() vim.diagnostic.jump({count = -1}) end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
