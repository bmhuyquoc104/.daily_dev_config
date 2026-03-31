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
					"pyright",
					"ruff",
					"taplo",
					"terraform-ls",
					"fish-lsp",
					"bash-language-server",
					"dockerfile-language-server",
					-- Formatters/Linters
					"stylua",
					"prettier",
					"dotenv-linter",
					"sqlfluff",
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
