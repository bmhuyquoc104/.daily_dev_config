return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC sof", "󰈢  > Recent Files", "<cmd>lua Snacks.picker.recent()<CR>"),
			dashboard.button("C-n", "  > Toggle file explorer", "<cmd>lua Snacks.picker.explorer()<CR>"),
			dashboard.button("SPC sf", "󰱼  > Find File", "<cmd>lua Snacks.picker.files() <CR>"),
			dashboard.button("SPC scp", "  > Find Word", "<cmd>lua Snacks.picker.grep() <CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		dashboard.section.footer.opts.hl = "AlphaFooter"
		return dashboard
	end,
	config = function(_, dashboard)
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local datetime = os.date(" %Y-%m-%d  %H:%M:%S")
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
          .. " - "
          .. datetime
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
