return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"yaml",
					"html",
					"markdown",
					"query",
					"json",
					"lua",
					"typescript",
					"markdown_inline",
				},
				auto_install = true,
				indent = { enable = true },
				highlight = { enable = true, additional_vim_regex_highlighting = false },
			})
		end,
	},
}
