return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local lazy_status = require("lazy.status")
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_a = {
					"buffers",
				},
			},
		})
	end,
}
