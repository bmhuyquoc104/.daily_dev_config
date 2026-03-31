return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},

		formatters_by_ft = {
			lua = { "stylua" },

			python = { "ruff_organize_imports", "ruff_format" },

			ruby = { "rubocop" },

			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },

			sql = { "sqlfluff" },
			mysql = { "sqlfluff" },
			pgsql = { "sqlfluff" },

			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },
		},

		formatters = {
			sqlfluff = {
				command = "sqlfluff",
				args = {
					"fix",
					"--dialect",
					"ansi",
					"$FILENAME",
				},
				stdin = false,
			},
		},
	},
}
