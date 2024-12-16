return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				cmp = true,
        mason = true,
				diffview = true,
				noice = true,
				notify = true,
        octo = true,
        lsp_trouble = true,
        nvim_surround = true,
        which_key = true,
        grug_far = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
