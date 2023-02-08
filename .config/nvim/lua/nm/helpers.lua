local M = {}

M.protected_setup = function(module_name, opts)
  opts = opts or {}
  local success, module = pcall(require, module_name)
  if success then
    module.setup(opts)
  else
    print('Error loading ' .. module_name .. ': ' .. module)
  end
end

M.nnoremap = function(keys, func, desc)
  desc = desc or ''
  vim.keymap.set('n', keys, func, { noremap=true, silent=true, desc = desc })
end

M.vnoremap = function(keys, func, desc)
  desc = desc or ''
  vim.keymap.set('v', keys, func, { noremap=true, silent=true, desc = desc })
end

M.bufnmap = function(keys, func, bufnr, desc)
  desc = desc or ''
  vim.keymap.set('n', keys, func, { noremap=true, silent=true, buffer = bufnr, desc = desc })
end

return M
