	return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_z = {
					{
						require("opencode").statusline,
					},
				},
				lualine_x = {
					{
						color = { fg = "#7dcfff" },
					},
				},
				lualine_a = {
					"buffers",
				},
			},
		})
	end,
}
