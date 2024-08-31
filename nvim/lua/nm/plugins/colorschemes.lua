return {

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("kanagawa").setup({
				transparent = true,
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},

	-- {
	--   "folke/tokyonight.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	--   config = function()
	--     vim.cmd([[colorscheme tokyonight]])
	--   end,
	-- },
}
