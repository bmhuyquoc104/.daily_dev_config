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
		opts = {
			enable_close = true,
			enable_rename = true,
			enable_close_on_slash = false,
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		keys = {
			{
				"<leader>gfo",
				function()
					require("grug-far").open({ transient = true })
				end,
				desc = "Grug far open",
				mode = { "n" },
			},
			{
				"<leader>gfo",
				function()
					require("grug-far").with_visual_selection({
						prefills = { paths = vim.fn.expand("%") },
						transient = true,
					})
				end,
				desc = "Grug far visual open",
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
			require("tiny-inline-diagnostic").setup({
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
