return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
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
