return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      local mason_registry = require 'mason-registry'
      local codelldb = mason_registry.get_package 'codelldb'
      local extension_path = codelldb:get_install_path() .. '/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
      local cfg = require 'rustaceanvim.config'
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {},
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            vim.keymap.set('n', '<leader>a', function()
              vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
              -- or vim.lsp.buf.codeAction() if you don't want grouping.
            end, { silent = true, buffer = bufnr })
            vim.keymap.set(
              'n',
              'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
              function()
                vim.cmd.RustLsp { 'hover', 'actions' }
              end,
              { silent = true, buffer = bufnr }
            )
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true, -- Optional: Enable all cargo features
              },
              procMacro = {
                enable = true, -- Enable procedural macros
              },
              formatting = {
                enable = true, -- Enable formatting
                defaultBinding = true,
              },
            },
          },
          -- DAP configuration
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
          },
        },
      }
    end,
  },
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    'saecki/crates.nvim',
    ft = { 'toml' },
    config = function()
      require('crates').setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require('cmp').setup.buffer {
        sources = { { name = 'crates' } },
      }
    end,
  },
}
