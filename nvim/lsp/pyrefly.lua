return {
	cmd = { "pyrefly", "lsp" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py" },
	settings = {
		python = {
			pyrefly = {
				displayTypeErrors = "force-on",
			},
		},
	},
}