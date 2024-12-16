return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  keys = {
    { "<leader>rc", ":TestNearest<CR>", desc = "Run nearest test" },
    { "<leader>rf", ":TestFile<CR>",    desc = "Run tests in file" },
    { "<leader>rs", ":TestSuite<CR>",   desc = "Run test suite" },
    { "<leader>rl", ":TestLast<CR>",    desc = "Run last test" },
    { "<leader>rv", ":TestVisit<CR>",   desc = "Visit test file" },
  },
  config = function()
    vim.cmd("let test#strategy = 'vimux'")
  end,
}
