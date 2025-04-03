local function setup_keymaps()
	local mappings = {
		["K"] = { vim.lsp.buf.hover, "Hover documentation LSP" },
		["<leader>la"] = { vim.lsp.buf.code_action, "Code Action LSP" },
		["<leader>ld"] = { vim.lsp.buf.definition, "Goto Definition LSP" },
		["<leader>lr"] = { vim.lsp.buf.references, "Goto References LSP" },
		["<leader>lf"] = { vim.lsp.buf.format, "Format File LSP" },
		["<leader>li"] = { vim.lsp.buf.implementation, "Goto Implementation LSP" },
		["<leader>lrn"] = { vim.lsp.buf.rename, "Rename LSP" },
		["<leader>ll"] = {
			function()
				vim.cmd.edit(vim.lsp.get_log_path())
			end,
			"Show LSP Log",
		},
	}

	for key, value in pairs(mappings) do
		vim.keymap.set("n", key, value[1], { desc = value[2] })
	end
end

local function setup_lsp()
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	vim.lsp.config("*", {
		capabilities = capabilities,
		root_markers = { ".git" },
	})

	setup_keymaps()

	vim.lsp.enable({
		"lua_ls",
		"ts_ls",
		"basedpyright",
		"ruff",
		"jsonls",
		"yamlls",
		"ruby_ls",
    "taplo",
	})
end

setup_lsp()
