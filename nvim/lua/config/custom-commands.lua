-- Highlight yanked text
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Custom buffer keyboard shortcuts
vim.api.nvim_set_keymap("n", "bl", ":blast<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bf", ":bfirst<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bp", ":bprev<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bn", ":bnext<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "bd", ":bdelete<enter>", { noremap = false })

