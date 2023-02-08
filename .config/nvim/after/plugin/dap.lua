local nnoremap = require('nm.helpers').nnoremap
local protected_setup = require('nm.helpers').protected_setup

local success, dap = pcall(require, 'dap')
if not success then
  print('Error loading dap: ' .. dap)
  return
end

local success, dapui = pcall(require, 'dapui')
if not success then
  print('Error loading dapui: ' .. dapui)
  return
end
dapui.setup()

protected_setup('nvim-dap-virtual-text')

-- Open/close dapui automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Add the Python adapter
local success, dap_python = pcall(require, 'dap-python')
if success then
  dap_python.setup()
  table.insert(dap.configurations.python, {
    type = "python",
    request = "attach",
    name = "LogMeal-API Debug",
    connect = {
      port = 5678,
      host = "0.0.0.0",
    },
    mode = "remote",
    cwd = vim.fn.getcwd(),
    pathMappings = {
      {
        localRoot = vim.fn.getcwd(),
        remoteRoot = "/code"
      },
    },
    -- preLaunchTask = {
    --   command = "docker-compose exec api python -m debugpy --listen 0.0.0.0:5678 --pid $(docker-compose exec api pgrep -nf python) --configure-subProcess true",
    --   type = "shell",
    -- },
  })
else
  print('Error loading dap-python: ' .. dap_python)
end

nnoremap('<leader>dc', dap.continue, '[DAP] Continue')
nnoremap('<F10>', dap.step_over, '[DAP] Step over')
nnoremap('<F11>', dap.step_into, '[DAP] Step into')
nnoremap('<F12>', dap.step_out, '[DAP] Step out')
nnoremap('<Leader>b', dap.toggle_breakpoint, '[DAP] Toggle [B]reakpoint')
nnoremap('<Leader>B', dap.set_breakpoint, '[DAP] Set [B]reakpoint')
nnoremap('<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
nnoremap('<Leader>dr', dap.repl.open, '[DAP] [R]epl open')
nnoremap('<Leader>dl', dap.run_last, '[DAP] Run [L]ast')

local widgets = require('dap.ui.widgets')
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', widgets.hover, { desc = '[DAP] Widgets: [H]over' })
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', widgets.preview, { desc = '[DAP] Widgets: [P]review' })
nnoremap('<Leader>df', function() widgets.centered_float(widgets.frames) end, '[DAP] Widgets: [F]rames')
nnoremap('<Leader>ds', function() widgets.centered_float(widgets.scopes) end, '[DAP] Widgets: [S]copes')
