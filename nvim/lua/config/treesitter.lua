require("nvim-treesitter.configs").setup {
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
	ensure_installed = {
		"bash",
		"bibtex",
		"c",
		"comment",
		"cpp",
		"dockerfile",
		"go",
		"gomod",
		"javascript",
		"json",
		"julia",
		"latex",
		"lua",
		"python",
		"rust",
		"typescript",
		"yaml",
		"toml",
	}
}

require("nvim-treesitter.parsers").get_parser_configs().just = {
	install_info = {
		url = "https://github.com/IndianBoy42/tree-sitter-just",         -- local path or git repo
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
	maintainers = { "@IndianBoy42" },
}
