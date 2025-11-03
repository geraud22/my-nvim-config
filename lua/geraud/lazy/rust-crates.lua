return {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml "},
    config = function()
        require('crates').setup({
            lsp = {
                enabled = true,
                actions = true,
                completion = {
                    cmp = {
                        enabled = true,
                    },
                    crates = {
                        enabled = true,
                        max_results = 8,
                        min_chars = 3,
                    },
                },
                hover = true,
            },
        })
    end,
}
