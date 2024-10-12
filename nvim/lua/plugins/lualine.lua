return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_a = {
					"buffers", -- This shows the buffers in the current session
					show_filename_only = true, -- Only show filename in the buffer list
					icons_enabled = true, -- Enable icons in the buffer list
					mode = 0, -- 0: Shows buffer name + number, 1: Only buffer name
				},
			},
		})
	end,
}
