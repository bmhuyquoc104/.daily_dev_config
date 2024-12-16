return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
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
      desc = "Neogit open split below"
    }
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({})
	end,
}
