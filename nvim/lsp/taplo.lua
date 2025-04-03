return {
	cmd = { "taplo", "lsp", "stdio" },
	filetypes = { "toml" },
	root_markers = {
		"pyproject.toml",
	},
	settings = {
		taplo = {
			schema = {
				associations = {
					["pyproject.toml"] = "https://json.schemastore.org/pyproject.json",
				},
			},
			validation = {
				enabled = true,
			},
		},
	},
}
