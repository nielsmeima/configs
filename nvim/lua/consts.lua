-- based around LSP
local language_servers = {
	{
		name = "bashls",
		settings = {}
	},
	{
		name = "clangd",
		settings = {}
	},
	{
		name = "dockerls",
		settings = {}
	},
	{
		name = "fortls",
		settings = {}
	},
	{
		name = "gopls",
		settings = {}
	},
	{
		name = "jsonls",
		settings = {}
	},
	{
		name = "rnix",
		settings = {}
	},
	{
		name = "marksman",
		settings = {}
	},
	{
		name = "pyright",
		settings = {}
	},
	{
		name = "rust_analyzer",
		cmd = { "/usr/local/bin/ra-multiplex", "client" },
		settings = {
			["rust-analyzer"] = {
				server = {
					path = "/Users/nielsmeima/.local/share/nvim/mason/bin/rust-analyzer"
				},
				completion = {
					autoimport = {
						enable = true
					},
				},
				checkOnSave = true,
				check = {
					command = "clippy",
				},
				cargo = {
					autoreload = true,
					buildScripts = {
						enable = true,
					}
				}
			}
		}
	},
	{
		name = "sqlls",
		settings = {}
	},
	{
		name = "lua_ls",
		settings = {}
	},
	{
		name = "taplo",
		settings = {}
	},
	{
		name = "texlab",
		settings = {}
	},
	{
		name = "tsserver",
		settings = {}
	},
	{
		name = "yamlls",
		settings = {
			yaml = {
				schemas = {
					kubernetes = "kubernetes/*.yaml"
				},
			}
		}
	},
}

return {
	language_servers = language_servers,
	debug_servers = {}
}
