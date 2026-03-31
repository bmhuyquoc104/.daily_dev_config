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
		-- 'comment',
		"css",
		"csv",
		"diff",
		"dockerfile",
		"gitignore",
		-- 'go',
		"html",
		"javascript",
		-- 'jsdoc',
		"json",
		"lua",
		-- 'luadoc',
		-- 'make',
		"markdown",
		"markdown_inline",
		-- 'nginx',
		-- 'php',
		"python",
		"query",
		"regex",
		-- 'rust',
		-- 'scss',
		-- 'svelte',
		"sql",
		-- 'templ',
		"toml",
		"tsv",
		"typescript",
		"vim",
		"vimdoc",
		-- 'xml',
		"yaml",
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
