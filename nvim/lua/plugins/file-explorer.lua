return {
  -- "nvim-neo-tree/neo-tree.nvim",
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   "nvim-tree/nvim-web-devicons",
  --   "muniftanjim/nui.nvim",
  -- },
  -- lazy = false,
  -- opts = {
  --   filesystem = {
  --     filtered_items = {
  --       hide_dotfiles = false, -- show dotfiles
  --     }
  --   }
  -- },
  -- vim.keymap.set('n', '<C-n>', ':Neotree toggle left<CR>', {})
  {
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("mini.files").setup({
        vim.keymap.set('n', '<C-n>', ':lua MiniFiles.open()<CR>',{})
      })
    end,
  },
}
