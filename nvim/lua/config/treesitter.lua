local map = require('utils').map

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
	}
}

