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
vim.api.nvim_set_keymap('t', '<leader>q', '<C-\\><C-n>', { noremap = true, silent = true })

-- Switch windows directly from normal or terminal mode
vim.keymap.set("n", "<A-h>", "<C-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { silent = true, desc = "Move to lower window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { silent = true, desc = "Move to upper window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { silent = true, desc = "Move to right window" })
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j", { silent = true, desc = "Move to lower window" })
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", { silent = true, desc = "Move to upper window" })
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l", { silent = true, desc = "Move to right window" })

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
