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
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			-- lspconfig.solargraph.setup({
			-- 	capabilities = capabilities,
			-- })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        cmd = { "/Users/bmhuyquoc104/.rbenv/shims/ruby-lsp" }
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
		end,
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation LSP" }),
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action LSP" }),
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition LSP" }),
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto References LSP" }),
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format File LSP" }),
		vim.keymap.set("n", "<leader>gc", vim.lsp.buf.implementation, { desc = "Goto Implementation LSP" }),
		vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, { desc = "Rename LSP" }),
	},
}
