return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- Show dotfiles
      }
    }
  },
  vim.keymap.set('n', '<C-n>', ':Neotree toggle left<CR>', {})
}
