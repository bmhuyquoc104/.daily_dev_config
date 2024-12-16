return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				indent = { enable = true },
				highlight = { enable = true, additional_vim_regex_highlighting = false },
			})

			vim.treesitter.language.register("markdown", "octo")
		end,
	},
}
