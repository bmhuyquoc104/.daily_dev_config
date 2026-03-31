return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "InsertLeave" },
	config = function()
		local lint = require("lint")

		vim.filetype.add({
			pattern = {
				["%.env"] = "dotenv",
				["%.env%.[%w_.-]+"] = "dotenv",
			},
		})

		lint.linters.sqlfluff.args = {
			"lint",
			"--format",
			"json",
			"--dialect",
			"ansi", -- Change to "postgres" or "mysql" if needed
		}

		lint.linters_by_ft = {
			ruby = { "rubocop" },
			sql = { "sqlfluff" },
			mysql = { "sqlfluff" },
			pgsql = { "sqlfluff" },
			dotenv = { "dotenv_linter" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
