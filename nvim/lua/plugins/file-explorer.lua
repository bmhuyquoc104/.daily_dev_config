return {
  {
    "echasnovski/mini.files",
    version = false,
    keys = {
      {
        "<C-n>",
        function()
          local MiniFiles = require("mini.files")
          MiniFiles.open()
        end,
        desc = "Open MiniFiles",
      },
    },
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({})

      local files_grug_far_replace = function()
        -- Works only if cursor is on a valid file system entry
        local cur_entry_path = MiniFiles.get_fs_entry().path
        local prefills = { paths = vim.fs.dirname(cur_entry_path) }

        local grug_far = require("grug-far")

        -- Instance check
        if not grug_far.has_instance("explorer") then
          grug_far.open({
            instanceName = "explorer",
            prefills = prefills,
            staticTitle = "Find and Replace from Explorer",
          })
        else
          grug_far.open_instance("explorer")
          -- Updating the prefills without clearing the search and other fields
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
