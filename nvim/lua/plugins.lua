-- Bootstrap plugins by checking whether paq-nvim is already installed.
-- If not, clone and packadd
return require("packer").startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "folke/tokyonight.nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "windwp/nvim-autopairs"
    use "hoob3rt/lualine.nvim"
    use { "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } }
    use "folke/todo-comments.nvim"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use "hrsh7th/nvim-cmp"
    use "onsails/lspkind-nvim"
end)
