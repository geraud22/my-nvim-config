return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() 
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>ss", builtin.grep_string, {})
    end
}
