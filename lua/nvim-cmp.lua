local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,preview,noselect',
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
	['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },   -- Language Server Protocol
        { name = 'luasnip' },    -- Snippets
        { name = 'buffer' },     -- Text within current buffer
        { name = 'path' },       -- File system paths
    }),
    formatting = {
        format = lspkind.cmp_format({ 
		maxwidth = 50, 
		ellipsis_char = '...',
		with_text = true,
		menu = {
			buffer = "[Buffer]",
			nvim_lsp = "[LSP]",
			path = "[Path]",
			luasnip = "[LuaSnip]"
		},
	}),
    },
})
