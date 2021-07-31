
local paq = require("paq")
paq {
	"avq/paq-nvim";
	"morhetz/gruvbox";
	{"iamcco/markdown-preview.nvim", run = function() vim.fn("mkdp#util#install()") end};
	"junegunn/vim-easy-align";
	"tpope/vim-obsession";
	{"nvim-treesitter/nvim-treesitter", run = function() vim.cmd(":TSUpdate") end};
	{"neovim/nvim-lspconfig"};
	"nvim-lua/popup.nvim";
	"nvim-lua/plenary.nvim";
	"nvim-telescope/telescope.nvim";
	{"nvim-telescope/telescope-fzf-native.nvim", run = "make"};
	"windwp/nvim-autopairs";
	"hrsh7th/nvim-compe";
	"hoob3rt/lualine.nvim";
	{"kyazdani42/nvim-web-devicons", opt = true};
}
