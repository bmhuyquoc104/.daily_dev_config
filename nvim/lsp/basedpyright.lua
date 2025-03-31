return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py" },
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			analysis = {
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
			},
		},
	},
}
