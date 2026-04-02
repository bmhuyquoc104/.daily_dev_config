return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml" },
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
}
