local vim = vim

-- Plugins
local paq = require("paq")
paq {
	"avq/paq-nvim";
	"jiangmiao/auto-pairs";
	"morhetz/gruvbox";
	{"iamcco/markdown-preview.nvim", run = "cd app && yarn install"};
	"junegunn/vim-easy-align";
	"tpope/vim-obsession";
	"glepnir/galaxyline.nvim";
	{"kyazdani42/nvim-web-devicons", opt = true};
	{"nvim-treesitter/nvim-treesitter", run = function() vim.cmd(":TSUpdate") end};
	{"neovim/nvim-lspconfig"};
	"nvim-lua/popup.nvim";
	"nvim-lua/plenary.nvim";
	"nvim-telescope/telescope.nvim";
	{"nvim-telescope/telescope-fzf-native.nvim", run = "make"};
}

-- Settings
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

-- Mappings
options = { noremap = true }
vim.api.nvim_set_keymap("n", "<up>"   , "<nop>", options)
vim.api.nvim_set_keymap("n", "<up>"   , "<nop>", options)
vim.api.nvim_set_keymap("n", "<down>" , "<nop>", options)
vim.api.nvim_set_keymap("n", "<left>" , "<nop>", options)
vim.api.nvim_set_keymap("n", "<right>", "<nop>", options)
vim.api.nvim_set_keymap("", ";", "l", options)
vim.api.nvim_set_keymap("", "l", "k", options)
vim.api.nvim_set_keymap("", "k", "j", options)
vim.api.nvim_set_keymap("", "j", "h", options)
vim.api.nvim_set_keymap("n", "J", "^", options)
vim.api.nvim_set_keymap("n", "K", "$", options)
vim.api.nvim_set_keymap("n", "<leader><leader>", "<c-^>", options)
vim.api.nvim_set_keymap("i", "<up>"   , "<nop>", options)
vim.api.nvim_set_keymap("i", "<down>" , "<nop>", options)
vim.api.nvim_set_keymap("i", "<left>" , "<nop>", options)
vim.api.nvim_set_keymap("i", "<right>", "<nop>", options)

-- Color theme
vim.api.nvim_command([[
autocmd vimenter * colorscheme gruvbox
]])

-- Treesitter
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	}
}


-- LSP
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "gopls", "julials" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


-- Telescope

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
	  fzf = {
		  fuzzy = true,
		  override_generic_sorter = true,
		  override_file_sorter = true,
		  case_mode = "smart_case"
	  }
  }
}

options = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ff',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], options)
vim.api.nvim_set_keymap('n', '<Leader>fg',  [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], options)
vim.api.nvim_set_keymap('n', '<Leader>gf',  [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], options)
vim.api.nvim_set_keymap('n', '<Leader>fb',  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], options)




-- TODO: DAP
-- TODO better support for bracketing / auto-closing
-- TODO: something with git
 
