return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>glc", "<cmd>GitLink<cr>",  mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>glo", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
}
