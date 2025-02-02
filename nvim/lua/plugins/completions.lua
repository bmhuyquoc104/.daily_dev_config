return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "fang2hou/blink-copilot" },
			{ "rafamadriz/friendly-snippets" },
		},
		version = "*",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				nerd_font_variant = "mono",
				kind_icons = {
					Copilot = "",
				},
			},
			sources = {
				default = { "copilot", "lsp", "path", "snippets", "buffer" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
						opts = {
							max_completions = 3,
							max_attempts = 4,
						},
					},
				},
			},
		},
	},
}
