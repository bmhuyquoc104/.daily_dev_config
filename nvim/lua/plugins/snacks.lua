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
			"<leader>glf",
			function()
				require("snacks").picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		{
			"<leader>gll",
			function()
				require("snacks").picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>sch",
			function()
				require("snacks").picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>e",
			function()
				require("snacks").explorer()
			end,
			desc = "File explorer",
		},
		{
			"<leader>gbo",
			mode = { "n", "v" },
			function()
				require("snacks").gitbrowse()
			end,
			desc = "Git Browse (open)",
		},

		{
			"<leader>gbc",
			mode = { "n", "v" },
			function()
				require("snacks").gitbrowse({
					open = function(url)
						vim.fn.setreg("+", url)
					end,
					notify = false,
				})
			end,
			{ desc = "Git Browse (copy)" },
		},
		{
			"<leader>gi",
			function()
				require("snacks").picker.gh_issue()
			end,
			desc = "GitHub Issues (open)",
		},
		{
			"<leader>gI",
			function()
				require("snacks").picker.gh_issue({ state = "all" })
			end,
			desc = "GitHub Issues (all)",
		},
		{
			"<leader>gp",
			function()
				require("snacks").picker.gh_pr()
			end,
			desc = "GitHub Pull Requests (open)",
		},
		{
			"<leader>gP",
			function()
				require("snacks").picker.gh_pr({ state = "all" })
			end,
			desc = "GitHub Pull Requests (all)",
		},
		{
			"<leader>stc",
			function()
				require("snacks").picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>sac",
			function()
				require("snacks").picker.todo_comments({
					keywords = { "TODO", "FIX", "FIXME", "WARNING", "WARN", "HACK", "PERF", "NOTE" },
				})
			end,
			desc = "Todo/Fix/Fixme",
		},
		{
			"<leader>do",
			function()
				require("snacks").scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>ds",
			function()
				require("snacks").scratch.select()
			end,
			desc = "Select Scratch Buffer",
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
		gitbrowse = {
			enable = true,
		},
		git = {
			enable = true,
		},
		gh = {
			enable = true,
		},
		scroll = { enabled = true },
		bigfile = { enabled = true },
		scratch = { enabled = true },
		dashboard = {
			enable = true,
			example = "compact_files",
		},
	},
}
