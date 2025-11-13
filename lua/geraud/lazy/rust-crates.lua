return {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml" },
    config = function()
        require('crates').setup({
            completion = {
                cmp = {
                    enabled = true,
                },
                crates = {
                    enabled = true,
                },
            },
            lsp = {
                enabled = true,
                actions = true,
                hover = true,
            },
        })
    end,
}
