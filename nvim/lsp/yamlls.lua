return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose" },
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
