return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")

    local function search_in_directory_or_root()
      local input = vim.fn.input("Directory (leave empty for root): ")
      local search_dir = input ~= "" and input or vim.loop.cwd()
      fzf.live_grep({ cwd = search_dir })
    end

    require("fzf-lua").setup({
      vim.keymap.set("n", "<leader>sgf", fzf.git_files, { desc = "Fzf Git Files" }),
      vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "Fzf Files" }),
      vim.keymap.set("n", "<leader>sgb", fzf.git_branches, { desc = "Fzf Git Branches" }),
      vim.keymap.set("n", "<leader>scp", fzf.live_grep, { desc = "Fzf Current Project" }),
      vim.keymap.set(
        "n",
        "<leader>sws",
        fzf.lsp_live_workspace_symbols,
        { desc = "Fzf Live Workspace Symbols" }
      ),
      vim.keymap.set("n", "<leader>sif", fzf.blines, { desc = "Fzf In files" }),
      vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "Fzf buffers" }),
      vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "Fzf Help tags" }),
      vim.keymap.set("n", "<leader>sr", fzf.registers, { desc = "Fzf registers" }),
      vim.keymap.set(
        "n",
        "<leader>sd",
        search_in_directory_or_root,
        { desc = "Fzf Search in Directory or Root" }
      ),
    })
  end,
}
