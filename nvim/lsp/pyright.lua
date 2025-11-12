return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				reportUnusedImport = "warning",
				reportUnusedClass = "warning",
				reportUnusedFunction = "warning",
				reportUnusedVariable = "warning",
				reportUnusedParameter = "warning",
				typeCheckingMode = "strict"
			},
		},
	},
}
