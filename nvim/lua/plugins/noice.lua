return {
	{
		"rcarriga/nvim-notify",
    lazy = true,
		opts = {
			stages = "static",

			on_open = nil,

			on_close = nil,

			render = "wrapped-compact",

			timeout = 5000,

			minimum_width = 50,

			-- Icons for the different levels
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
		},
	},

	{
		"folke/noice.nvim",
    lazy = true,
		vim.keymap.set("n", "<leader>nd", function()
			require("noice").cmd("dismiss")
		end),
		opts = {
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				routes = {

					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					opts = { skip = true },
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
