return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		keys = {
			{
				"<leader>gfa",
				function()
					require("grug-far").open({ transient = true })
				end,
				desc = "Grug far search all",
				mode = { "n" },
			},
			{
				"<leader>gfc",
				function()
					require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
				end,
				desc = "Grug far search current file",
				mode = { "n" },
			},
			{
				"<leader>gfa",
				function()
					require("grug-far").with_visual_selection({
						prefills = { paths = vim.fn.expand("%") },
						transient = true,
					})
				end,
				desc = "Grug far visual search all",
				mode = { "v" },
			},
		},
		config = function()
			local grug_far = require("grug-far")
			grug_far.setup({})
		end,
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		config = function()
			local tiny_diag = require("tiny-inline-diagnostic")

			tiny_diag.setup({
				preset = "ghost",
				transparent_bg = true,
				options = {
					show_source = true,
					multilines = {
						enabled = true,
						always_show = true,
					},
				},
			})

			vim.diagnostic.config({ virtual_text = false })

			local function copy_diagnostic_under_cursor()
				local bufnr = vim.api.nvim_get_current_buf()
				local cursor = vim.api.nvim_win_get_cursor(0)
				local cursor_line = cursor[1] - 1
				local cursor_col = cursor[2]
				local diagnostics = vim.diagnostic.get(bufnr)

				local found = nil
				for _, d in ipairs(diagnostics) do
					if
						cursor_line >= d.lnum
						and cursor_line <= (d.end_lnum or d.lnum)
						and cursor_col >= (d.col or 0)
						and cursor_col <= (d.end_col or d.col or 0)
					then
						found = d
						break
					end
				end

				if found and found.message then
					vim.fn.setreg("+", found.message)
					vim.notify("Copied diagnostic: " .. found.message, vim.log.levels.INFO)
				else
					vim.notify("No diagnostic at cursor position", vim.log.levels.WARN)
				end
			end

			vim.keymap.set(
				"n",
				"<leader>teo",
				copy_diagnostic_under_cursor,
				{ desc = "Copy diagnostic message under cursor" }
			)
		end,
	},
	{
		"folke/flash.nvim",
		opts = {},
		keys = {
			{
				"<leader>fj",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"<leader>ftj",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"<leader>fts",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<leader>ft",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
		specs = {
			{
				"folke/snacks.nvim",
				opts = {
					picker = {
						win = {
							input = {
								keys = {
									["<a-s>"] = { "flash", mode = { "n", "i" } },
									["s"] = { "flash" },
								},
							},
						},
						actions = {
							flash = function(picker)
								require("flash").jump({
									pattern = "^",
									label = { after = { 0, 0 } },
									search = {
										mode = "search",
										exclude = {
											function(win)
												return vim.bo[vim.api.nvim_win_get_buf(win)].filetype
													~= "snacks_picker_list"
											end,
										},
									},
									action = function(match)
										local idx = picker.list:row2idx(match.pos[1])
										picker.list:_move(idx, true, true)
									end,
								})
							end,
						},
					},
				},
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
