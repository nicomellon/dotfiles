local bufnmap = require('nm.helpers').bufnmap
local nnoremap = require('nm.helpers').nnoremap
local protected_setup = require('nm.helpers').protected_setup

local success, lspconfig = pcall(require, 'lspconfig')
if not success then
  print("Error loading lspconfig: " .. lspconfig)
  return
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
nnoremap('<leader>e', vim.diagnostic.open_float, 'Show diagnostics in a floating window')
nnoremap('[d', vim.diagnostic.goto_prev, 'Move to previous [d]iagnostic in the current buffer')
nnoremap(']d', vim.diagnostic.goto_next, 'Move to next [d]iagnostic in the current buffer')
nnoremap('<leader>q', vim.diagnostic.setloclist, 'Add buffer diagnostics to the location list')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  bufnmap('gD', vim.lsp.buf.declaration, bufnr, '[G]oto [D]eclaration')
  bufnmap('gd', vim.lsp.buf.definition, bufnr, '[G]oto [D]efinition')
  bufnmap('K', vim.lsp.buf.hover, bufnr, 'Hover Documentation')
  bufnmap('gi', vim.lsp.buf.implementation, bufnr, '[G]oto [I]mplementation')
  bufnmap('<C-k>', vim.lsp.buf.signature_help, bufnr, 'Signature Documentation')
  bufnmap('<leader>wa', vim.lsp.buf.add_workspace_folder, bufnr, '[W]orkspace [A]dd Folder')
  bufnmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, bufnr, '[W]orkspace [R]emove Folder')
  bufnmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufnr, '[W]orkspace [L]ist Folders')
  bufnmap('<leader>D', vim.lsp.buf.type_definition, bufnr, 'Type [D]efinition')
  bufnmap('<leader>rn', vim.lsp.buf.rename,  bufnr, '[R]e[n]ame')
  bufnmap('<leader>ca', vim.lsp.buf.code_action,  bufnr, '[C]ode [A]ction')
  bufnmap('<leader>F', function() vim.lsp.buf.format { async = true } end, bufnr, '[F]ormat buffer')

    -- highlight symbol under cursor
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
      hi! LspReferenceRead guifg=none guibg=#364a82
      hi! LspReferenceText guifg=none guibg=none
      hi! LspReferenceWrite guifg=none guibg=#364a82
    ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- Enable the following language servers
-- They will automatically be installed.
local servers = {
  tsserver = {},
  pyright = {
    cmd = {'pyright-langserver', '--tcp-host', '0.0.0.0', '--tcp-port', '5000'},
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      },
    },
  },
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  rust_analyzer = {},
}

-- Setup neovim lua configuration
protected_setup('neodev')

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
local success, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if success then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
else
    print('Error loading cmp_nvim_lsp: ' .. cmp_nvim_lsp)
end

-- Setup mason so it can manage external tooling
protected_setup('mason')

-- Turn on lsp status information
protected_setup('fidget')


-- Ensure the servers above are installed
local success, mason_lspconfig = pcall(require, 'mason-lspconfig')
if success then
  mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
  })
  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
      })
    end,
  })
else
  print('Error loading mason_lspconfig: ' .. mason_lspconfig)
  return
end

