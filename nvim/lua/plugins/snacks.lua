return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>si",
			function()
				require("snacks").picker.files({
					ft = { "jpg", "jpeg", "png", "webp" },
					confirm = function(self, item, _)
						self:close()
						require("img-clip").paste_image({}, "./" .. item.file)
					end,
				})
			end,
			desc = "Image files",
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
				require("snacks").picker.files()
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
			"<leader>sm",
			function()
				require("snacks").picker.smart()
			end,
			desc = "Search Smart",
		},
		{
			"<leader>sap",
			function()
				require("snacks").picker.projects()
			end,
			desc = "Search Projects",
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
			"<leader>gbh",
			mode = "v",
			function()
				vim.cmd('noau normal! "zy')
				local txt = vim.fn.getreg("z")
				pcall(vim.fn.setreg, "z", {})
				if not txt or txt == "" then
					vim.notify("No valid selection", vim.log.levels.WARN)
					return
				end
				local commit = txt:match("[%w%d]+")
				if not commit or #commit < 7 then
					vim.notify("No valid commit SHA selected", vim.log.levels.WARN)
					return
				end
				require("snacks").gitbrowse({ what = "commit", commit = commit })
			end,
			desc = "Git Browse selected commit",
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
			desc = "Git Browse (copy)",
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
			url_patterns = {
				["dev%.azure%.com"] = {
					repo = "",
					branch = "?version=GB{branch}&_a=contents",
					file = function(fields)
						return "?path=/"
							.. fields.file
							.. "&version=GB"
							.. fields.branch
							.. (
								fields.line_start
									and ("&line=" .. fields.line_start .. "&lineEnd=" .. (fields.line_end or fields.line_start) .. "&lineStartColumn=1" .. "&lineEndColumn=1" .. "&lineStyle=plain" .. "&_a=contents")
								or "&_a=contents"
							)
					end,
					permalink = function(fields)
						return "?path=/"
							.. fields.file
							.. "&version=GC"
							.. fields.commit
							.. (
								fields.line_start
									and ("&line=" .. fields.line_start .. "&lineEnd=" .. (fields.line_end or fields.line_start) .. "&lineStartColumn=1" .. "&lineEndColumn=1" .. "&lineStyle=plain" .. "&_a=contents")
								or "&_a=contents"
							)
					end,
					commit = "?_a=history&version=GC{commit}",
					blame = function(fields)
						return "?path=/"
							.. fields.file
							.. "&version=GB"
							.. fields.branch
							.. (
								fields.line_start
									and ("&line=" .. fields.line_start .. "&lineEnd=" .. (fields.line_end or fields.line_start) .. "&lineStartColumn=1" .. "&lineEndColumn=1" .. "&lineStyle=plain" .. "&_a=blame")
								or "&_a=blame"
							)
					end,
				},
			},
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
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					padding = 1,
					cwd = true,
				},
				{
					pane = 2,
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 2,
					padding = 1,
				},
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local remote_type = nil
					if in_git then
						local handle = io.popen("git remote get-url origin 2>/dev/null")
						if handle then
							local remote_url = handle:read("*all")
							handle:close()
							if remote_url:match("github%.com") or remote_url:match("github%.") then
								remote_type = "github"
							elseif remote_url:match("dev%.azure%.com") or remote_url:match("visualstudio%.com") then
								remote_type = "azure"
							end
						end
					end
					return {
						pane = 2,
						icon = " ",
						desc = "Browse Repo",
						padding = 1,
						key = "b",
						action = function()
							Snacks.gitbrowse()
						end,
						enabled = in_git,
						remote_type = remote_type,
					}
				end,
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local remote_type = nil
					if in_git then
						local handle = io.popen("git remote get-url origin 2>/dev/null")
						if handle then
							local remote_url = handle:read("*all")
							handle:close()
							if remote_url:match("github%.com") or remote_url:match("github%.") then
								remote_type = "github"
							elseif remote_url:match("dev%.azure%.com") or remote_url:match("visualstudio%.com") then
								remote_type = "azure"
							end
						end
					end
					return {
						pane = 2,
						icon = " ",
						title = "Pull Requests",
						section = "terminal",
						enabled = in_git and remote_type ~= nil,
						cmd = remote_type == "github" and "gh pr list -L 5"
							or 'az repos pr list --top 5 --query "[].{ID:id, Title:title, Status:status}" -o table',
						height = 5,
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					}
				end,
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
	},
}
