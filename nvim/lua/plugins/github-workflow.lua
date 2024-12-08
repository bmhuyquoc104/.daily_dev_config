return {
	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	config = function()
	-- 		require("gitsigns").setup()
	--
	-- 		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
	-- 		vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", {})
	-- 		vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
	-- 	end,
	-- },
	{
		"linrongbin16/gitlinker.nvim",
		cmd = "GitLink",
		opts = {},
		keys = {
			{ "<leader>glc", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
			{ "<leader>glo", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
		},
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"ibhagwan/fzf-lua",
		},
		config = function()
			require("octo").setup({
				enable_builtin = true,
				picker = "fzf-lua",
				picker_config = {
					use_emojis = true,
				},
				default_to_projects_v2 = true,
			})

			vim.keymap.set("n", "<leader>ops", ":Octo pr search <CR>", { desc = "Octo PR search" })
			vim.keymap.set("n", "<leader>opl", ":Octo pr list <CR>", { desc = "Octo PR list" })
			vim.keymap.set("n", "<leader>opc", ":Octo pr create <CR>", { desc = "Octo PR create" })
			vim.keymap.set(
				"n",
				"<leader>otr",
				":Octo thread resolve <CR>",
				{ desc = "Mark a review thread as resolved" }
			)
			vim.keymap.set(
				"n",
				"<leader>otu",
				":Octo thread unresolve <CR>",
				{ desc = "Mark a review thread as unresolved" }
			)
			vim.keymap.set("n", "<leader>opr", ":Octo pr ready <CR>", { desc = "Mark a draft PR as ready for review" })
			vim.keymap.set("n", "<leader>opd", ":Octo pr draft <CR>", { desc = "Send a ready PR back to draft" })
		end,
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = { "AdvancedGitSearch" },
		keys = {
			{
				"<leader>gsa",
				"<cmd>AdvancedGitSearch search_log_content<CR>",
				mode = { "n" },
				desc = "Advanced Git Search Log Content",
			},
			{
				"<leader>gsf",
				"<cmd>AdvancedGitSearch diff_commit_file<CR>",
				mode = { "n" },
				desc = "Advanced Git Diff Commit File",
			},
			{
				"<leader>gsl",
				"<cmd>AdvancedGitSearch diff_commit_line<CR>",
				mode = { "x" },
				desc = "Advanced Git Diff Commit Line",
			},
		},
		config = function()
			require("advanced_git_search.fzf").setup({
				browse_command = "GitLink! rev={commit_hash}",
				diff_plugin = "diffview",
				git_flags = {},
				git_diff_flags = {},
				show_builtin_git_pickers = false,
				entry_default_author_or_date = "author",
				keymaps = {
					toggle_date_author = "<C-w>",
					open_commit_in_browser = "<C-o>",
					copy_commit_hash = "<C-y>",
					show_entire_commit = "<C-e>",
				},
			})
		end,
	},
}
