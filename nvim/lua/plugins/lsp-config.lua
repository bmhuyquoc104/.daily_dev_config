return {
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
		opts = {
			ensure_installed = { "yamlls", "jsonls", "ts_ls", "lua_ls" },
		},
	},
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
				init_options = {
					formatter = "standard",
					linters = { "standard" },
				},
				cmd = { "sh", "-c", "mise x -- ruby-lsp" },
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
		end,
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation LSP" }),
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action LSP" }),
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Goto Definition LSP" }),
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "Goto References LSP" }),
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format File LSP" }),
		vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Goto Implementation LSP" }),
		vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, { desc = "Rename LSP" }),
		vim.keymap.set("n", "<leader>ll", ":LspLog<CR>", { desc = "Log LSP" }),
	},
}
