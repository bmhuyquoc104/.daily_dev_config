return {
	{
		"WhoIsSethDaniel/mason-tool-installer",

		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					-- LSP servers
					"yamlls",
					"jsonls",
					"typescript-language-server",
					"lua-language-server",
          "sqlls",
          "pyright",
					"ruff",
          "taplo",
					-- Formatters/Linters
					-- "rubocop",
					"stylua",
          "sqruff",
					"prettier",
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig",
		lazy = false,
		opts = {},
	},
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
}
