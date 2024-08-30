-- Treesitter
-- highlight, edit, and navigate code

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "bash", "dockerfile", "gitcommit", "lua", "python", "sql", "yaml", "c", "markdown" },
		highlight = { enable = true },
		indent = { enable = true },
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobjects, similar to targets.vim
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

--[[
@assignment.inner
@assignment.lhs
@assignment.outer
@assignment.rhs
@block.inner
@block.outer
@call.inner
@call.outer
@class.inner
@class.outer
@comment.inner
@comment.outer
@conditional.inner
@conditional.outer
@function.inner
@function.outer
@loop.inner
@loop.outer
@number.inner
@parameter.inner
@parameter.outer
@return.inner
@return.outer
@statement.outer
]]
-- vim: ts=4 sts=4 sw=4 et
