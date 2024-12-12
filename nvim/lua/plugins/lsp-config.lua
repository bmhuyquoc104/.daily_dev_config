return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      -- lspconfig.solargraph.setup({
      -- 	capabilities = capabilities,
      -- })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        init_options = {
          formatter = "standard",
          linters = { "standard" },
        },
        cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["https://json.schemastore.org/grpc-api-gateway.json"] = "/openapi.yaml/*",
            },
          },
        },
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
    end,
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation LSP" }),
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action LSP" }),
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition LSP" }),
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto References LSP" }),
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format File LSP" }),
    vim.keymap.set("n", "<leader>gc", vim.lsp.buf.implementation, { desc = "Goto Implementation LSP" }),
    vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, { desc = "Rename LSP" }),
  },
}
