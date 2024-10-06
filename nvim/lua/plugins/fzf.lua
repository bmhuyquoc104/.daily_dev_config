return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			vim.keymap.set("n", "<leader>gfs", require("fzf-lua").git_files, { desc = "Fzf Git Files" }),
			vim.keymap.set("n", "<leader>gbs", require("fzf-lua").git_branches, { desc = "Fzf Git Branches" }),
		})
	end,
}
