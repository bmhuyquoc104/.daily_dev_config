return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local function lsp_progress()
			local messages = vim.lsp.status()
			if #messages > 0 then
				return table.concat(messages, " ")
			end
			return ""
		end

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
						lsp_progress,
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
