return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      vim.keymap.set("n", "<leader>sgf", require("fzf-lua").git_files, { desc = "Fzf Git Files" }),
      vim.keymap.set("n", "<leader>sgb", require("fzf-lua").git_branches, { desc = "Fzf Git Branches" }),
      vim.keymap.set("n", "<leader>scp", require("fzf-lua").live_grep, { desc = "Fzf Current Project" }),
      vim.keymap.set(
        "n",
        "<leader>sws",
        require("fzf-lua").lsp_live_workspace_symbols,
        { desc = "Fzf Live Workspace Symbols" }
      ),
      vim.keymap.set("n", "<leader>sif", require("fzf-lua").blines, { desc = "Fzf In files" }),
      vim.keymap.set("n", "<leader>sb", require("fzf-lua").buffers, { desc = "Fzf buffers" }),
      vim.keymap.set("n", "<leader>sh", require("fzf-lua").helptags, { desc = "Fzf Help tags" }),
      vim.keymap.set("n", "<leader>sr", require("fzf-lua").registers, { desc = "Fzf registers" }),
    })
  end,
}
