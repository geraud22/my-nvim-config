local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function() 
        local params = vim.lsp.util.make_range_params(0,"utf-16")
        params.context = { only = {"source.organizeImports"}}
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do 
                if r.edit then 
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({async = false})
    end
})

--@type vim.lsp.Config
local config = {
    name = 'gopls',
    cmd = {'gopls'},
    root_markers = {'.git', {'go.mod', 'go.sum'}},
    filetypes = {'go', 'gotmpl', 'gomod', 'gowork'},
    settings = {
        gopls = {
            semanticTokens = true,
        },
    },
}
vim.lsp.config('gopls', config)
vim.lsp.enable('gopls')
