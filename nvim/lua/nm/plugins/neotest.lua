return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					runner = "pytest",
				}),
			},
		})
	end,
	keys = {
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "toggle the summary window",
		},
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "run the closest test",
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "debug the closest test",
		},
	},
}
-- vim: ts=4 sts=4 sw=4 et
