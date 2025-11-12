return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "codecompanion" },
	opts = {},
	keys = {
		{
			"<leader>rp",
			function()
				require("render-markdown").preview()
			end,
			desc = "Preview Markdown",
		},
	},
}
