local function setup_keymaps()
	local mappings = {
		["K"] = { vim.lsp.buf.hover, "Hover documentation LSP" },
		["<leader>la"] = { vim.lsp.buf.code_action, "Code Action LSP" },
		["<leader>ld"] = { vim.lsp.buf.definition, "Goto Definition LSP" },
		["<leader>lr"] = { vim.lsp.buf.references, "Goto References LSP" },
		["<leader>lf"] = { vim.lsp.buf.format, "Format File LSP" },
		["<leader>li"] = { vim.lsp.buf.implementation, "Goto Implementation LSP" },
		["<leader>lrn"] = { vim.lsp.buf.rename, "Rename LSP" },
		["<leader>ll"] = { ":LspLog<CR>", "Log LSP" },
	}

	for key, value in pairs(mappings) do
		vim.keymap.set("n", key, value[1], { desc = value[2] })
	end
end

local function get_server_configs(capabilities)
	return {
		ruby_lsp = {
			capabilities = capabilities,
			init_options = {
				formatter = "standard",
				linters = { "standard" },
			},
			cmd = { "sh", "-c", "mise x -- ruby-lsp" },
		},
		ts_ls = { capabilities = capabilities },
		pyright = { capabilities = capabilities },
		jsonls = {
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		},
		yamlls = {
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
		},
		lua_ls = { capabilities = capabilities },
	}
end

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
			ensure_installed = { "yamlls", "jsonls", "ts_ls", "lua_ls", "pyright" },
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
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			local server_configs = get_server_configs(capabilities)
			for server, config in pairs(server_configs) do
				lspconfig[server].setup(config)
			end

			setup_keymaps()
		end,
	},
}
