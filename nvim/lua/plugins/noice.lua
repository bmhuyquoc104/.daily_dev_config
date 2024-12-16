return {
  "folke/noice.nvim",
  lazy = true,
  vim.keymap.set("n", "<leader>nd", function()
    require("noice").cmd("dismiss")
  end),
  opts = {
    presets = {
      bottom_search = true,      -- use a classic bottom cmdline for search
      command_palette = true,    -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,        -- enables an input dialog for inc-rename.nvim
      routes = {

        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "%d fewer lines" },
            { find = "%d more lines" },
          },
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
