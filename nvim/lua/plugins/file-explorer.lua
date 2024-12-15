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
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        vim.keymap.set("n", "<C-n>", ":lua MiniFiles.open()<CR>", {}),
      })
      local files_grug_far_replace = function(path)
        -- works only if cursor is on the valid file system entry
        local cur_entry_path = MiniFiles.get_fs_entry().path
        local prefills = { paths = vim.fs.dirname(cur_entry_path) }

        local grug_far = require("grug-far")

        -- instance check
        if not grug_far.has_instance("explorer") then
          grug_far.open({
            instanceName = "explorer",
            prefills = prefills,
            staticTitle = "Find and Replace from Explorer",
          })
        else
          grug_far.open_instance("explorer")
          -- updating the prefills without crealing the search and other fields
          grug_far.update_instance_prefills("explorer", prefills, false)
        end
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.keymap.set(
            "n",
            "gs",
            files_grug_far_replace,
            { buffer = args.data.buf_id, desc = "Search in directory" }
          )
        end,
      })
    end,
  },
}
