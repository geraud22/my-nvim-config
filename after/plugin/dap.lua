vim.keymap.set('n', '<F5>', require('dap').continue)
vim.keymap.set('n', '<F10>', require('dap').step_over)
vim.keymap.set('n', '<F11>', require('dap').step_into)
vim.keymap.set('n', '<F12>', require('dap').step_out)
vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<Leader>dt', "<cmd>lua vim.cmd('RustLsp testables')<CR>")
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
--local dap, dapui = require("dap"),require("dapui")
--dap.listeners.after.event_initialized["dapui_config"]=function()
--    dapui.open()
--end
--dap.listeners.before.event_terminated["dapui_config"]=function()
--  dapui.close()
--end
--dap.listeners.before.event_exited["dapui_config"]=function()
--  dapui.close()
--end
