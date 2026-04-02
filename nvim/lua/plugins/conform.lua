return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = function(bufnr)
				if vim.b[bufnr].disable_autoformat then
					return
				end

				return {
					timeout_ms = 1000,
					lsp_fallback = true,
				}
			end,

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
		})

		-- default: enabled
		vim.b.disable_autoformat = false

		-- toggle command (buffer-local)
		vim.api.nvim_create_user_command("FormatToggle", function()
			vim.b.disable_autoformat = not vim.b.disable_autoformat

			if vim.b.disable_autoformat then
				vim.notify("Autoformat (buffer): OFF")
			else
				vim.notify("Autoformat (buffer): ON")
			end
		end, {})

		vim.keymap.set("n", "<leader>tc", "<cmd>FormatToggle<CR>", {
			desc = "Toggle autoformat (buffer)",
		})
	end,
}
