return {
  -- the main colorscheme should be available when starting Neovim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
    },
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  { "navarasu/onedark.nvim", lazy = true },

  { "folke/tokyonight.nvim", lazy = true },

}
