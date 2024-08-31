local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
	s(
		{
			trig = "def",
			name = "function definition",
			desc = "function definition",
		},
		fmt(
			[[
			def {identifier}({params}){return_type}:
			    {body}
            ]],
			{
				identifier = i(1, "identifier"),
				params = d(2, function(args)
					local node = vim.treesitter.get_node()
					while node ~= nil do
						if node:type() == "class_definition" then
							return sn(nil, {
								t("self"),
								i(1),
							})
						end

						node = node:parent()
					end

					return sn(nil, {
						i(1, ""),
					})
				end),
				return_type = c(3, {
					t(""),
					sn(nil, {
						t(" -> "),
						i(1, "None"),
					}),
				}),
				body = i(0, "pass"),
			}
		)
	),

	s(
		{
			trig = "class",
			name = "class definition",
			desc = "class definition",
		},
		fmt(
			[[
            class {identifier}:
                {body}
            ]],
			{
				identifier = i(1, "identifier"),
				body = i(0, "pass"),
			}
		)
	),

	s(
		{
			trig = "@classmethod",
			name = "classmethod function definition",
			desc = "classmethod function definition",
		},
		fmt(
			[[
            @classmethod
            def {identifier}(cls{params}) -> {return_type}:
                {body}
            ]],
			{
				identifier = i(1, "identifier"),
				params = i(2),
				return_type = i(3, "None"),
				body = i(0, "pass"),
			}
		)
	),

	s(
		{
			trig = "__post_init__",
			name = "__post_init__ function definition",
			desc = "__post_init__ function definition",
		},
		fmt(
			[[
            __post_init__(self) -> None:
                {body}
            ]],
			{
				body = i(0, "pass"),
			}
		)
	),

	s(
		{
			trig = "for",
			name = "for loop",
			desc = "for loop",
		},
		fmt(
			[[
            for {assignment} in {iterable}:
                {body}
            ]],
			{
				assignment = i(1, "assignment"),
				iterable = i(2, "iterable"),
				body = i(0, "pass"),
			}
		)
	),

	s(
		"main",
		fmt(
			[[
            if __name__ == "__main__":
                {body}
            ]],
			{
				body = i(0, "pass"),
			}
		)
	),
}

-- vim: ts=4 sts=4 sw=4 et
