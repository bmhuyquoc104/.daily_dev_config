return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		cmd = { "Neogit" },
		keys = {
			{
				"<leader>gov",
				"<cmd>Neogit kind=vsplit<CR>",
				desc = "Neogit open vertical",
			},
			{
				"<leader>gos",
				"<cmd> Neogit kind=split_below<CR>",
				desc = "Neogit open split below",
			},
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({
        integrations = {
          snacks = true,
        }
      })
		end,
	},
	{
		"sindrets/diffview.nvim",
    cmd = { "DiffviewOpen" },
    keys = {
      {
        "<leader>dvo",
        "<cmd>DiffviewOpen<CR>",
        desc = "Diffview open merge tool",
      },
    },
		config = function()
			require("diffview").setup({
				view = {
					default = {
						layout = "diff2_horizontal",
					},
					file_history = {
						layout = "diff2_horizontal",
					},
					diff_view = {
						layout = "diff2_horizontal",
					},
					merge_tool = {
						layout = "diff1_plain",
					},
				},
			})
		end,
	},
}
