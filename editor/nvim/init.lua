-- TODO: all functionality and mappings currently in my init.vim (set, inoremap, functions, etc.)
local vim = vim


vim.cmd('colorscheme gruvbox')
vim.cmd('syntax on')

vim.g.mapleader = " "
vim.g.shellcommandflag = "-ic"

vim.o.showmode = false
vim.o.hidden = true

-- Make no backup before overwriting a file
vim.o.backup = false
vim.o.writebackup = false

-- Number of screen lines to use for the command-line
vim.o.cmdheight = 2

-- Decrease update time
vim.o.updatetime = 250

vim.o.shortmess = vim.o.shortmess .. "c"

-- Make line numbers default
vim.wo.number = true

-- Show the line number relative to the line with cursor in front of each line
vim.wo.relativenumber = true

vim.wo.signcolumn = "yes"

-- Copy indent from current line when starting new line
vim.bo.autoindent = true

local paq = require("paq")
paq {
	"avq/paq-nvim";
	"jiangmiao/auto-pairs";
	"morhetz/gruvbox";
	{"iamcco/markdown-preview.nvim", run="cd app && yarn install"};
	"junegunn/vim-easy-align";
	"tpope/vim-obsession";
	"hoob3rt/lualine.nvim";
	{"kyazdani42/nvim-web-devicons", opt = true}
}

options = { noremap = true }
vim.api.nvim_set_keymap("n", "<up>"   , "<nop>", options)
vim.api.nvim_set_keymap("n", "<up>"   , "<nop>", options)
vim.api.nvim_set_keymap("n", "<down>" , "<nop>", options)
vim.api.nvim_set_keymap("n", "<left>" , "<nop>", options)
vim.api.nvim_set_keymap("n", "<right>", "<nop>", options)
vim.api.nvim_set_keymap("n", "<C-p>"  , ":Files<Cr>", options)
vim.api.nvim_set_keymap("n", ";", "l", options)
vim.api.nvim_set_keymap("n", "l", "k", options)
vim.api.nvim_set_keymap("n", "k", "j", options)
vim.api.nvim_set_keymap("n", "j", "h", options)
vim.api.nvim_set_keymap("n", "J", "^", options)
vim.api.nvim_set_keymap("n", "K", "$", options)
vim.api.nvim_set_keymap("n", "<leader><leader>", "<c-^>", options)
vim.api.nvim_set_keymap("i", "<up>"   , "<nop>", options)
vim.api.nvim_set_keymap("i", "<down>" , "<nop>", options)
vim.api.nvim_set_keymap("i", "<left>" , "<nop>", options)
vim.api.nvim_set_keymap("i", "<right>", "<nop>", options)

vim.api.nvim_command([[
autocmd vimenter * colorscheme gruvbox
]])

require('lualine').setup()


-- TODO: treesitter


-- TODO: LSP
-- TODO: telescope
-- TODO: DAP
-- TODO better support for bracketing / auto-closing
-- TODO: something with git
 
