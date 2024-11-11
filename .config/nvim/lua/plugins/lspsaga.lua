return {
	"glepnir/lspsaga.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		local lspsaga = require("lspsaga")
		lspsaga.setup({
			lightbulb = {
				enable = false,
			},
			debug = false,
			use_saga_diagnostic_sign = true,
			code_action_prompt = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
			max_preview_lines = 10,

			finder_action_keys = {
				open = "o",
				vsplit = "s",
				split = "i",
				quit = "q",
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},

			hover = {
				max_width = 0.5,
			},

			code_action_keys = { quit = "q", exec = "<CR>" },
			rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
			border_style = "single",
			server_filetype_map = {},
			diagnostic_prefix_format = "%d. ",
		})
	end,
}
