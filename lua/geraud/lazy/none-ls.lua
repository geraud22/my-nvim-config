return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local none_ls = require("null-ls")
        none_ls.setup({
            sources = {
                none_ls.builtins.formatting.stylua,
                none_ls.builtins.formatting.prettier.with({
                    filetypes = vim.list_extend(
                        none_ls.builtins.formatting.prettier.filetypes,
                        {"svelte"}
                    ),
                }),
            },
        })
    end,
}
