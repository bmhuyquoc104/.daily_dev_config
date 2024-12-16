return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>sgf",
      "<cmd>lua require('fzf-lua').git_files()<CR>",
      desc = "Fzf Git Files",
    },
    {
      "<leader>sf",
      "<cmd>lua require('fzf-lua').files()<CR>",
      desc = "Fzf Files",
    },
    {
      "<leader>sgb",
      "<cmd>lua require('fzf-lua').git_branches()<CR>",
      desc = "Fzf Git Branches",
    },
    {
      "<leader>scp",
      "<cmd>lua require('fzf-lua').live_grep()<CR>",
      desc = "Fzf Current Project",
    },
    {
      "<leader>sws",
      "<cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<CR>",
      desc = "Fzf Live Workspace Symbols",
    },
    {
      "<leader>sif",
      "<cmd>lua require('fzf-lua').blines()<CR>",
      desc = "Fzf In files",
    },
    {
      "<leader>sb",
      "<cmd>lua require('fzf-lua').buffers()<CR>",
      desc = "Fzf buffers",
    },
    {
      "<leader>sh",
      "<cmd>lua require('fzf-lua').helptags()<CR>",
      desc = "Fzf Help tags",
    },
    {
      "<leader>sr",
      "<cmd>lua require('fzf-lua').registers()<CR>",
      desc = "Fzf registers",
    },
    {
      "<leader>sd",
      "<cmd>lua require('fzf-lua').live_grep({ cwd = vim.fn.input('Directory (leave empty for root): ') or vim.loop.cwd() })<CR>",
      desc = "Fzf Search in Directory or Root",
    },
  },
  config = function()
    require("fzf-lua").setup({})
  end,
}
