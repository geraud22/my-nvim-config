local null_ls = require("null-ls")

local M = {}
M.setup = function()
    null_ls.setup({
        sources = {
            null_ls.builtins.diagnostics.eslint.with({
                command = "htmlhint",
                args = { "--format", "unix", "--stdin", "--stdin-filename", "$FILENAME" },
                filetypes = { "html" },
                format = "line",
            }),
        },
    })
end

return M
