return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.sqruff,
				null_ls.builtins.diagnostics.sqruff,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.rubocop,
			},
		})
	end,
}
