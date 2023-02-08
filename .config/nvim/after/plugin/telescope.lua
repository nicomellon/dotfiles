local nnoremap = require('nm.helpers').nnoremap

local success, telescope = pcall(require, 'telescope')
if not success then
  print('Error loading telescope: ' .. telescope)
  return
end
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

pcall(telescope.load_extension, 'fzf') -- telescope fzf native
pcall(telescope.load_extension, 'dap') -- Debugger

local success, builtin = pcall(require, 'telescope.builtin')
if not success then
  print('Error loading telescope.builtin: ' .. builtin)
  return
end
nnoremap('<leader>?', builtin.oldfiles, '[?] Find recently opened files')
nnoremap('<leader><space>', builtin.buffers, '[ ] Find existing buffers')
nnoremap('<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, '[/] Fuzzily search in current buffer]')

nnoremap('<leader>sf', builtin.find_files, '[S]earch [F]iles')
nnoremap('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
nnoremap('<leader>sw', builtin.grep_string, '[S]earch current [W]ord')
nnoremap('<leader>sk', builtin.keymaps, '[S]earch [K]eymaps')
nnoremap('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')

-- LSP functionality
nnoremap('gr', builtin.lsp_references, '[G]oto [R]eferences')
nnoremap('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
nnoremap('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

-- Diagnostics
nnoremap('<leader>dd', function() builtin.diagnostics({ bufnr = 0 }) end, '[D]ocument [D]iagnostics')
nnoremap('<leader>wd', builtin.diagnostics, '[W]orkspace [D]iagnostics')

-- Debugging
-- nnoremap('<leader>dc', telescope.extensions.dap.configurations, '[DAP] [C]onfigurations')

