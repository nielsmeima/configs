local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function()
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	use "folke/tokyonight.nvim"
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"

	use "nvim-telescope/telescope.nvim"
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

	use "windwp/nvim-autopairs"
	use "hoob3rt/lualine.nvim"
	use { "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } }

	use "folke/todo-comments.nvim"

	-- this is deprecated
	use "williamboman/nvim-lsp-installer"

	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"

	use "hrsh7th/nvim-cmp"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lsp-signature-help"

	use "onsails/lspkind-nvim"
	use { "alopatindev/cargo-limit", commit = "df5eebc", run = "cargo install cargo-limit nvim-send" }
	use { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }
	use "rafamadriz/friendly-snippets"
	use "numToStr/Comment.nvim"
	use {
		'saecki/crates.nvim',
		tag = 'stable',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use { "NeogitOrg/neogit", requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" } }
end)
