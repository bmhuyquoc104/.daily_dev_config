return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({})

    vim.keymap.set("n", "<leader>gov", function()
      neogit.open({ kind = "vsplit" })
    end, { desc = "Neogit open vertical" })
    vim.keymap.set("n", "<leader>goh", function()
      neogit.open({ kind = "split_below" })
    end, { desc = "Neogit open split below" })
  end,
}
