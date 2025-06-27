-- $ npm install -g yaml-language-server

return {
	cmd = { "yaml-language-server", "--stdio" },

	filetypes = {
		"yaml",
		"yaml.docker-compose",
		"yaml.gitlab",
		"yaml.helm-values",
	},

	root_markers = { ".git" },
}
