return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		config = function()
			require("codecompanion").setup({
				adapters = {
					copilot = function()
						return require("codecompanion.adapters").extend("copilot", {
							schema = {
								model = {
									default = "claude-3.5-sonnet",
								},
							},
						})
					end,
				},
				display = {
					chat = {
						intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
						show_header_separator = false,
						separator = "─",
						show_references = true,
						show_settings = true,
						show_token_count = true,
						start_in_insert_mode = false, -- Open the chat buffer in insert mode?
						window = {
							position = "right",
						},
					},
				},
				strategies = {
					chat = {
						slash_commands = {
							["file"] = {
								callback = "strategies.chat.slash_commands.file",
								description = "Select a file using Fzf lua",
								opts = {
									provider = "fzf_lua",
									contains_code = true,
								},
							},
						},
						roles = {
							user = "Huyne104",
						},
						adapter = "copilot",
					},
					inline = {
						adapter = "copilot",
					},
				},
			})
			vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>co",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
