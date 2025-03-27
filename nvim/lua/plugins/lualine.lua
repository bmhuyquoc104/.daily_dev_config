return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local lazy_status = require("lazy.status")

		local CodeCompanionSpinner = require("lualine.component"):extend()
		CodeCompanionSpinner.spinner_index = 1
		CodeCompanionSpinner.processing = false

		local spinner_symbols = {
			"⠋",
			"⠙",
			"⠹",
			"⠸",
			"⠼",
			"⠴",
			"⠦",
			"⠧",
			"⠇",
			"⠏",
		}
		local spinner_symbols_len = #spinner_symbols

		function CodeCompanionSpinner:init(options)
			CodeCompanionSpinner.super.init(self, options)

			local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "CodeCompanionRequest*",
				group = group,
				callback = function(request)
					if request.match == "CodeCompanionRequestStarted" then
						self.processing = true
					elseif request.match == "CodeCompanionRequestFinished" then
						self.processing = false
					end
				end,
			})
		end

		function CodeCompanionSpinner:update_status()
			if self.processing then
				self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
				return spinner_symbols[self.spinner_index]
			else
				return nil
			end
		end

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
					{
						CodeCompanionSpinner,
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
