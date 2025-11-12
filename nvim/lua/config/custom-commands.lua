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
vim.keymap.set("n", "tn", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tc", ":tabclose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<leader>p", '"d"+P', { noremap = false })
vim.keymap.set("n", "<leader>cf", function()
	vim.fn.setreg("+", vim.fn.expand("%:t"))
	vim.notify("Copied file name: " .. vim.fn.expand("%:t"))
end, { noremap = true, silent = true, desc = "Copy file name" })

vim.keymap.set("n", "<leader>cd", function()
	vim.fn.setreg("+", vim.fn.expand("%:p:h"))
	vim.notify("Copied directory: " .. vim.fn.expand("%:p:h"))
end, { noremap = true, silent = true, desc = "Copy directory path" })

vim.keymap.set("n", "<leader>cp", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
	vim.notify("Copied full path: " .. vim.fn.expand("%:p"))
end, { noremap = true, silent = true, desc = "Copy full file path" })
