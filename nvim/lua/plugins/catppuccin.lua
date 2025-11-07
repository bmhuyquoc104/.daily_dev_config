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
				aerial = true,
				octo = true,
				lsp_trouble = true,
				flash = true,
				render_markdown = true,
				neogit = true,
				nvim_surround = true,
				which_key = true,
				grug_far = true,
				blink_cmp = {
					style = "bordered",
				},
				snacks = {
					enabled = true,
					indent_scope_color = "catppuccin-mocha",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
