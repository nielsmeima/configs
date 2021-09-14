map = require("utils").map

require("zk").setup({
	debug = false,
	log = true,
	default_keymaps = true,
	default_notebook_path = vim.env.ZK_NOTEBOOK_DIR or "",
	fuzzy_finder = "telescope",
	link_format = "markdown"
})

options = { silent = true }
map("n", "<leader>n",  "<cmd>lua require('telescope').extensions.zk.zk_notes()<cr>", options)
map("n", "<leader>zg", "<cmd>lua require('telescope').extensions.zk.zk_grep()<cr>", options)
map("n", "<leader>zb", "<cmd>lua require('telescope').extensions.zk.zk_backlinks()<cr>", options)

