return {
  {
    'mxsdev/nvim-dap-vscode-js',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
  },
  {
    -- Core DAP plugin
    'mfussenegger/nvim-dap',
    lazy = true,
    config = function()
      local dap = require 'dap'
      -- Example configuration for Go debugging
      dap.adapters.go = {
        type = 'server',
        host = '127.0.0.1',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = { 'dap', '-l', '127.0.0.1:${port}' },
        },
      }
      dap.configurations.go = {
        {
          type = 'go',
          name = 'Debug',
          request = 'launch',
          program = '${file}',
        },
        {
          type = 'go',
          name = 'Debug Package',
          request = 'launch',
          program = './',
        },
        {
          type = 'go',
          name = 'Attach to Process',
          request = 'attach',
          processId = require('dap.utils').pick_process,
        },
        {
          type = 'go',
          name = 'Attach to Remote',
          mode = 'remote',
          request = 'attach',
          remotePath = './', -- Remote binary path if needed
        },
      }
      dap.adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'codelldb',
          args = { '--port', '${port}' },
        },
      }
      dap.configurations.cpp = {
        {
          name = 'Launch',
          type = 'codelldb',
          request = 'launch',
          program = '${workspaceFolder}/${fileBasenameNoExtension}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }
    end,
  },
  {
    'nvim-java/nvim-java',
    dependencies = { 'mfussenegger/nvim-dap' },
    ft = { 'java' }, -- load on java files
    config = function()
      require('java').setup {
        dap = { enabled = true, hotcodereplace = 'auto' },
      }

      -- force it to (re-)register the Java DAP adapter & configs
      require('java').dap.config_dap()
    end,
  },
  {
    -- DAP UI plugin for Neovim
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'
      dapui.setup {
        layouts = {
          {
            elements = {
              'scopes',
              'breakpoints',
              'stacks',
              'watches',
            },
            size = 40, -- Width of the layout
            position = 'left', -- Position of the layout
          },
          {
            elements = {
              'repl',
              'console',
            },
            size = 10, -- Height of the layout
            position = 'bottom', -- Position of the layout
          },
        },
        floating = {
          border = 'rounded', -- Rounded border for floating windows
          mappings = {
            close = { 'q', '<Esc>' },
          },
        },
      }
      -- Automatically open and close DAP UI during debug sessions
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
  {
    -- Go-specific DAP plugin
    'leoluz/nvim-dap-go',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dap-go').setup {
        delve = {
          initialize_timeout_sec = 20,
          path = 'dlv', -- Ensure `dlv` is in your PATH
        },
      }
    end,
    keys = {
      {
        '<leader>dt',
        function()
          require('dap-go').debug_test()
        end,
        desc = 'Debug test',
      },
    },
  },
}
