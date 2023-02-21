return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = false,
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = false },
    { "nvim-treesitter/nvim-treesitter", lazy = false},
    { "nvim-tree/nvim-web-devicons", lazy = false },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable "make" == 1 ,
    },
    { "nvim-telescope/telescope-dap.nvim" },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "dap")
  end,
  keys = {
    { "<leader>?", function() require("telescope.builtin").oldfiles() end, desc = "[TELESCOPE] Find recently opened files"},
    { "gr", function() require("telescope.builtin").lsp_references() end, desc = "[TELESCOPE] [G]oto [R]eferences"},
    { "<leader>dd", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, desc = "[TELESCOPE] [D]ocument [D]iagnostics"},
    { "<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end, desc = "[TELESCOPE] [D]ocument [S]ymbols"},
    { "<leader>sb", function() require("telescope.builtin").buffers() end, desc = "[TELESCOPE] [S]earch existing [B]uffers"},
    { "<leader>sc", function() require("telescope.builtin").colorscheme() end, desc = "[TELESCOPE] [S]earch [C]olorscheme"},
    { "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "[TELESCOPE] [S]earch [F]iles"},
    { "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "[TELESCOPE] [S]earch by [G]rep"},
    { "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "[TELESCOPE] [S]earch [H]elp"},
    { "<leader>sk", function() require("telescope.builtin").keymaps() end, desc = "[TELESCOPE] [S]earch [K]eymaps"},
    { "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "[TELESCOPE] [S]earch current [W]ord"},
    { "<leader>ws", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "[TELESCOPE] [W]orkspace [S]ymbols"},
    { "<leader>wd", function() require("telescope.builtin").diagnostics() end, desc = "[TELESCOPE] [W]orkspace [D]iagnostics"},
  },
}
