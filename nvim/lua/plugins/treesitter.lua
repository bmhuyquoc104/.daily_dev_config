local M = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
}

M.config = function()
	local ts = require("nvim-treesitter")

	local parsers = {
		"bash",
		-- 'c',
		"comment",
		"css",
		"csv",
		"diff",
		"dockerfile",
		"dot",
		"diff",
		"gitignore",
		"gitcommit",
		"go",
		"html",
		"javascript",
		-- 'jsdoc',
		"json",
		"lua",
		-- 'luadoc',
		-- 'make',
		"markdown",
		"hcl",
		"terraform",
		"fish",
		"markdown_inline",
		-- 'nginx',
		-- 'php',
		"python",
		"query",
		"regex",
		"pem",
		"mermaid",
		-- 'rust',
		-- 'scss',
		-- 'svelte',
		"sql",
		-- 'templ',
		"toml",
		"tsv",
		"typescript",
		"zsh",
		-- "vim",
		-- "vimdoc",
		-- 'xml',
		"yaml",
		"tmux",
		-- 'zig',
	}

	if ts.install then
		ts.install(parsers)
	end

	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local buf = args.buf

			local language = vim.treesitter.language.get_lang(args.match)
			if not language then
				return
			end

			if not pcall(vim.treesitter.language.add, language) then
				return
			end

			pcall(vim.treesitter.start, buf)

			pcall(function()
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end)
		end,
	})
end

return M
