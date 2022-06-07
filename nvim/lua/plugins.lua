
-- Bootstrap plugins by checking whether paq-nvim is already installed.
-- If not, clone and packadd
local execute = vim.api.nvim_command
local fn = vim.fn


return require("packer").startup(function ()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "folke/tokyonight.nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "windwp/nvim-autopairs"
    use "hrsh7th/nvim-compe"
    use "hoob3rt/lualine.nvim"
    use "tami5/sql.nvim"
    use "nvim-telescope/telescope-frecency.nvim"
    use "folke/todo-comments.nvim"
    use "ggandor/lightspeed.nvim"
end)
