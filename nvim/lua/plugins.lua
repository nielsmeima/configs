-- Bootstrap plugins by checking whether paq-nvim is already installed.
-- If not, clone and packadd
return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
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
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "onsails/lspkind-nvim"
    -- use { "alopatindev/cargo-limit", run = "cargo install cargo-limit nvim-send" }
    use { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/nvim-cmp"
    use "saadparwaiz1/cmp_luasnip"
    use "numToStr/Comment.nvim"
end)
