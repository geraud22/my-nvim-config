local autocmd = vim.api.nvim_create_autocmd
autocmd({'LspAttach', 'BufReadPost', 'FileReadPost'}, {
    group = vim.api.nvim_create_augroup("Folds", { clear = true }),
    callback = function(event) 
        vim.cmd("normal! zR")
    end
})

return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
       require("nvim-treesitter.configs").setup({
            ensure_installed = { "go", "gotmpl", "html", "javascript" },
            auto_install = true,
            sync_install = false,
            highlight = { 
                enable = true,
                disable = function(lang, buf)
                    if lang == "html" then 
                        print("disabled")
                        return true
                    end
                    local max_filesize = 100 * 1024
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then 
                        vim.notify(
                            "File larger than 100kb disabling treesitter",
                            vim.log.levels.WARN,
                            {title = "Treesitter"}
                        )
                        return true
                    end
                end,
            },
            indent = { enable = true },
        })
    end
}
