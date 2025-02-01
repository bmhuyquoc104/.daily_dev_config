return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		keys = {
			{
				"<leader>gfo",
				function()
					require("grug-far").open()
				end,
				desc = "Grug far open",
				mode = { "n" },
			},
			{
				"<leader>gfo",
				function()
					require("grug-far").with_visual_selection()
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
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("ibl").setup()
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
