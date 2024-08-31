return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
	},
	keys = {
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "continue/start debugger",
		},
		{
			"<leader>dq",
			function()
				require("dap.breakpoints").clear()
				require("dap").terminate()
				require("dap").close()
			end,
			desc = "close debugger",
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<leader>d>",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<leader>d<",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<leader>dp",
			function()
				require("dap").step_back() -- previous
			end,
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input({ "Breakpoint condition: " }))
			end,
		},
		{
			"<leader>de",
			function()
				require("dap").set_exception_breakpoints()
			end,
		},
		{
			"<leader>dl",
			function()
				require("dap").list_breakpoints()
			end,
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()

		-- adapters
		dap.adapters.python = {
			type = "executable",
			command = "python",
			args = { "-m", "debugpy.adapter" },
		}

		-- configurations
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "FastAPI",
				module = "uvicorn",
				args = {
					"src.main:api",
					"--port",
					"8005",
				},
				pythonPath = "python",
			},
		}

		-- open and close the ui windows automatically
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- keymaps
		vim.keymap.set("n", "<F10>", function()
			require("dap").step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			require("dap").step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			require("dap").step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			require("dap").toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			require("dap").set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>lp", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			require("dap").repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			require("dap").run_last()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end)
		vim.keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)
		vim.keymap.set("n", "<Leader>du", function()
			dapui.toggle()
		end)

		require("dap-python").setup(
			"~/.virtualenvs/debugpy/bin/python",
			{ include_configs = true, console = "externalTerminal" }
		)
	end,
}
-- vim: ts=4 sts=4 sw=4 et
