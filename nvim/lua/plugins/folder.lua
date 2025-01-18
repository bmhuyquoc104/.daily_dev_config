return {
	"stevearc/aerial.nvim",
	opts = {},
	keys = {
		{
			"<leader>at",
			mode = { "n", "x", "o" },
			"<cmd>AerialToggle left<CR>",
			desc = "Toggle Aerial left",
		},
	},
	config = function()
		require("aerial").setup({
			layout = {
				max_width = { 40, 0.4 },
				min_width = { 20 },
				default_direction = "left",
			},
			manage_folds = true,
		})
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("AerialWrap", { clear = true }),
			pattern = "aerial",
			callback = function()
				vim.opt_local.wrap = true
			end,
		})
	end,
}
