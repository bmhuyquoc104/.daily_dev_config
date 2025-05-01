return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  keys = {
    { "<leader>dbo", "<cmd>DBUI<CR>", desc = "Open Database UI" }
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
