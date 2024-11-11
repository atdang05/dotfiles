return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "BurntSushi/ripgrep", "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function(lazy, opts)
			local telescope = require("telescope")
			telescope.load_extension("fzf")
			telescope.setup({
				defaults = {
					wrap_result = true,
					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
							-- search history
							["<C-Down>"] = require("telescope.actions").cycle_history_next,
							["<C-Up>"] = require("telescope.actions").cycle_history_prev,
						},
					},
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							width = 0.9,
							preview_cutoff = 10,
						},
					},
				},
				pickers = {
					-- note: remove the 'builtin.' prefix.
					["lsp_references"] = { wrap_results = true },
					["lsp_definitions"] = { wrap_results = true },
					["diagnostics"] = { wrap_results = true },
					["find_files"] = { wrap_results = true },
					["buffers"] = { sort_mru = true, ignore_current_buffer = true },
				},
			})
		end,

		keys = {
			-- See :help telescope.builtin
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "telescope diagnostics" },
			{
				"<leader>fw",
				function()
					require("telescope.builtin").live_grep({
						prompt_title = "grep open files",
						grep_open_files = true,
					})
				end,
				desc = "telescope live grep open files",
			},
			{
				"<leader>:",
				function()
					require("telescope.builtin").command_history({ prompt_title = "command history" })
				end,
				desc = "telescope command history",
			},
			{
				"<leader>fs",
				function()
					local aerial_avail, _ = pcall(require, "aerial")
					if aerial_avail then
						require("telescope").extensions.aerial.aerial()
					else
						require("telescope.builtin").lsp_document_symbols()
					end
				end,
				desc = "telescope search symbols",
			},
		},
	},
}
