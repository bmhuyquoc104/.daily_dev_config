return {
	cmd = { "sh", "-c", "mise x -- ruby-lsp" },
	filetypes = { "ruby" },
	root_markers = { "Gemfile" },
	init_options = {
		formatter = "standard",
		linters = { "standard" },
	},
}
