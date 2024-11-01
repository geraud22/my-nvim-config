-- Load the theme and setup the default highlight configuration
require("cyberdream").setup({
    transparent = true,
    italic_comments = false,
    hide_fillchars = true,
    borderless_telescope = true,
    terminal_colors = true,
    cache = false,
    theme = {
        variant = "default",
    },
})

-- Function to apply custom highlights for Go files
local function apply_go_highlights()
    vim.cmd [[
        highlight Comment guifg=#FF8000 guibg=NONE gui=italic
        highlight FloatBorder guifg=#5EFF6C guibg=NONE
        highlight Visual guibg=#16181A
        highlight Keyword guifg=#5EF1FF
        highlight Statement guifg=#5EA1FF
    ]]
end

-- Function to reset to the theme's default highlights
local function reset_highlights()
    vim.cmd [[
        highlight clear Comment
        highlight clear FloatBorder
        highlight clear Visual
        highlight clear Keyword
        highlight clear Statement
        " Optionally reload the theme to reset everything
        colorscheme cyberdream
	highlight Special guifg=#FC4C02
	highlight typescriptBlock guifg=#079FFF
    ]]
end

-- Auto command to apply highlights for Go files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = apply_go_highlights,
})

-- Auto command to reset to theme defaults for non-Go files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        local filetype = vim.bo.filetype
        if filetype ~= "go" then
            reset_highlights()
        end
    end,
})

