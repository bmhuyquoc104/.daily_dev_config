return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>sgf",
			function()
				require("snacks").picker.git_files()
			end,
			desc = "Git Files",
		},
    {
      "<leader>snh",
      function()
        require("snacks").picker.notifications()
      end,
      desc = "Notification history",
    },
		{
			"<leader>sf",
			function()
				require("snacks").picker.smart()
			end,
			desc = "Files",
		},
		{
			"<leader>sgb",
			function()
				require("snacks").picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>scp",
			function()
				require("snacks").picker.grep()
			end,
			desc = "Live Grep Current Project",
		},
		{
			"<leader>sws",
			function()
				require("snacks").picker.lsp_workspace_symbols()
			end,
			desc = "Live Workspace Symbols",
		},
		{
			"<leader>sif",
			function()
				require("snacks").picker.lines()
			end,
			desc = "In files",
		},
		{
			"<leader>sb",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sh",
			function()
				require("snacks").picker.help()
			end,
			desc = "Help tags",
		},
		{
			"<leader>sr",
			function()
				require("snacks").picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>sp",
			function()
				local dir = vim.fn.input("Directory (leave empty for root): ")
				require("snacks").picker.grep({ cwd = dir ~= "" and dir or vim.loop.cwd() })
			end,
			desc = "Search in Directory or Root",
		},
		{
			"<leader>nd",
			function()
				require("snacks").notifier.hide()
			end,
			desc = "Hide notification",
		},
		{
			"<leader>e",
			function()
				require("snacks").explorer()
			end,
			desc = "File explorer",
		},
	},
	opts = {
		picker = {
			enabled = true,
		},
		notifier = {
			enabled = true,
		},
		notify = {
			enabled = true,
		},
    explorer = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    dashboard = {
      enable = true,
      example = "compact_files"
    },
	},
}
