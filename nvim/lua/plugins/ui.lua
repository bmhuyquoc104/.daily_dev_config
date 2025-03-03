return {
	{
		"rcarriga/nvim-notify",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("notify").setup({
				stages = "static",
				render = "wrapped-compact",
				timeout = 5000,
				icons = {
					error = "",
					warn = "",
					info = "",
					debug = "",
					trace = "✎",
				},
			})
			vim.notify = require("notify")
		end,
	},
}
