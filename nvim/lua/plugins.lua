
-- Bootstrap plugins by checking whether paq-nvim is already installed.
-- If not, clone and packadd
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/paqs/start/paq-nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path})
  execute("packadd paq-nvim")
  -- Assume that if paq cannot be found, we also have not installed packages yet
  -- Attempt to install packages automatically (NB: :PaqSync does :PaqInstall, :PaqUpdate and :PaqClean)
  execute(":PaqSync")
end


local paq = require("paq")
paq {
	"avq/paq-nvim";
	"folke/tokyonight.nvim";
	{"iamcco/markdown-preview.nvim", run = function() vim.fn("mkdp#util#install()") end};
	"junegunn/vim-easy-align";
	"tpope/vim-obsession";
	{"nvim-treesitter/nvim-treesitter", run = function() vim.cmd(":TSUpdate") end};
	"neovim/nvim-lspconfig";
	"nvim-lua/popup.nvim";
	"nvim-lua/plenary.nvim";
	"nvim-telescope/telescope.nvim";
	{"nvim-telescope/telescope-fzf-native.nvim", run = "make"};
	"windwp/nvim-autopairs";
	"hrsh7th/nvim-compe";
	"hoob3rt/lualine.nvim";
	--{"kyazdani42/nvim-web-devicons", opt = true};
	"mfussenegger/nvim-dap";
	"nvim-telescope/telescope-dap.nvim";
	"theHamsta/nvim-dap-virtual-text";
	"sudormrfbin/cheatsheet.nvim";
	"tami5/sql.nvim";
	"nvim-telescope/telescope-frecency.nvim";
	"folke/todo-comments.nvim";
	"megalithic/zk.nvim";
}
