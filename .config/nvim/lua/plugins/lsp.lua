local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[LSP] [R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[LSP] [C]ode [A]ction")

  nmap("gd", vim.lsp.buf.definition, "[LSP] [G]oto [D]efinition")
  nmap("gI", vim.lsp.buf.implementation, "[LSP] [G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "[LSP] Type [D]efinition")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "[LSP] Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "[LSP] Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[LSP] [G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[LSP] [W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[LSP] [W]orkspace [R]emove Folder")
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "[d", vim.diagnostic.goto_prev, desc = "Move to previous [d]iagnostic in the current buffer" },
    { "]d", vim.diagnostic.goto_next, desc = "Move to next [d]iagnostic in the current buffer" },
  },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    },
    -- Automatically format on save
    autoformat = true,
    -- options for vim.lsp.buf.format
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    -- LSP Server Settings
    servers = {
      jsonls = {},
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
  config = function(plugin, opts)
    -- setup autoformat
    -- require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
    -- setup formatting and keymaps
    -- require("lazyvim.util").on_attach(function(client, buffer)
      -- require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
      -- require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
    -- end)

    local servers = opts.servers
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    -- temp fix for lspconfig rename
    -- https://github.com/neovim/nvim-lspconfig/pull/2439
    local mappings = require("mason-lspconfig.mappings.server")
    if not mappings.lspconfig_to_package.lua_ls then
      mappings.lspconfig_to_package.lua_ls = "lua-language-server"
      mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
    end

    local mlsp = require("mason-lspconfig")
    local available = mlsp.get_available_servers()

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
        if server_opts.mason == false or not vim.tbl_contains(available, server) then
          setup(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end

    require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup_handlers({ setup })
  end,
}

-- ---------------
--[[
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

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim", -- LSP, DAP, Linter & Formatter manager
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim", -- Useful status updates for LSP
    "folke/neodev.nvim", -- Additional lua configuration
  },
},
]]--
