return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux"
  },
  config = function()
    vim.keymap.set("n", "<leader>rc", ":TestNearest<CR>", {})
    vim.keymap.set("n", "<leader>rf", ":TestFile<CR>", {})
    vim.keymap.set("n", "<leader>rs", ":TestSuite<CR>", {})
    vim.keymap.set("n", "<leader>rl", ":TestLast<CR>", {})
    vim.keymap.set("n", "<leader>rv", ":TestVisit<CR>", {})
    vim.cmd("let test#strategy = 'vimux'")
  end,
}
