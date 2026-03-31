local function setup_keymaps()
	local mappings = {
		["<leader>ld"] = { vim.lsp.buf.definition, "Goto Definition LSP" },
		["<leader>lf"] = { vim.lsp.buf.format, "Format File LSP" },
		["<leader>ll"] = {
			function()
				vim.cmd.edit(vim.lsp.get_log_path())
			end,
			"Show LSP Log",
		},
		["<leader>lh"] = {
			function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end,
			"Toggle Inlay Hints",
		},
		["<leader>lct"] = {
			function()
				vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
			end,
			"Toggle Code Lens",
		},
		["<leader>lic"] = {
			function()
				vim.lsp.inline_completion.select()
			end,
			"Inline Completion LSP",
		},
		["<leader>lict"] = {
			function()
				vim.lsp.inline_completion.enable(not vim.lsp.inline_completion.is_enabled())
			end,
			"Toggle Inline Completion",
		},
		["<leader>ls"] = {
			function()
				vim.lsp.buf.workspace_symbol()
			end,
			"Workspace Symbols",
		},
	}

	for key, value in pairs(mappings) do
		vim.keymap.set("n", key, value[1], { desc = value[2] })
	end
end

local function setup_lsp_folding()
	vim.o.foldmethod = "expr"
	vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
end

local function setup_lsp_attach()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = false }),
		callback = function(ev)
			local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
			local bufnr = ev.buf

			if client:supports_method("textDocument/foldingRange") then
				vim.opt_local.foldmethod = "expr"
				vim.opt_local.foldexpr = "v:lua.vim.lsp.foldexpr()"
			end

			if client:supports_method("textDocument/codelens") then
				vim.lsp.codelens.enable(true, { bufnr = bufnr })
			end

			if client:supports_method("textDocument/inlineCompletion") then
				vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
			end

			if client:supports_method("textDocument/documentHighlight") then
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = bufnr,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd("CursorMoved", {
					buffer = bufnr,
					callback = vim.lsp.buf.clear_references,
				})
			end

			if client:supports_method("textDocument/linkedEditingRange") then
				vim.opt_local.conceallevel = 0
			end
		end,
	})
end

local function setup_lsp_progress()
	vim.api.nvim_create_autocmd("LspProgress", {
		pattern = { "*" },
		callback = function()
			vim.cmd("redrawstatus")
		end,
	})
end

local function setup_lsp()
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	vim.lsp.config("*", {
		capabilities = capabilities,
		root_markers = { ".git" },
	})

	vim.lsp.codelens.enable(true)
	vim.lsp.inline_completion.enable(true)

	setup_keymaps()
	setup_lsp_folding()
	setup_lsp_attach()
	setup_lsp_progress()

	vim.lsp.enable({
		"lua_ls",
		"ts_ls",
		"pyright",
		"ruff",
		"jsonls",
		"yamlls",
		"ruby_ls",
		"taplo",
		"terraform_ls",
		"fish_lsp",
		"bash_ls",
		"docker_langserver",
	})
end

setup_lsp()
