-- Java tooling: nvim-jdtls (test runner, refactorings, debug glue for jdtls)
-- and nvim-dap with its UI (debugger). jdtls itself is started per Java
-- buffer from ftplugin/java.lua. The which-key groups live in init.lua.

vim.pack.add {
  'https://github.com/mfussenegger/nvim-jdtls',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/nvim-neotest/nvim-nio', -- required by nvim-dap-ui
  'https://github.com/rcarriga/nvim-dap-ui',
}

local dap = require 'dap'
local dapui = require 'dapui'

dapui.setup()

-- Open the UI panels when a debug session starts, close them when it ends
dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

-- Attach to a Quarkus dev-mode JVM (`./mvnw quarkus:dev` listens on 5005).
-- Main-class launch configs are added per project by ftplugin/java.lua.
dap.configurations.java = {
  {
    type = 'java',
    request = 'attach',
    name = 'Attach to Quarkus dev (port 5005)',
    hostName = '127.0.0.1',
    port = 5005,
  },
}

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: toggle [B]reakpoint' })
vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, { desc = 'Debug: conditional [B]reakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: start / [C]ontinue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: step [I]nto' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: step [O]ver' })
vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Debug: step [O]ut' })
vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = 'Debug: [Q]uit session' })
vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: toggle [U]I panels' })
vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Debug: toggle [R]EPL' })
