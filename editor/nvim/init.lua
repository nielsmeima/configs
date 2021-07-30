local vim = vim

-- Plugins
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

----------
-- Settings
vim.cmd("colorscheme gruvbox")
vim.cmd("set clipboard^=unnamed,unnamedplus")
vim.cmd("syntax on")
 
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

-- Required for nvim-compe autocopmletion
vim.o.completeopt = "menuone,noselect"
 
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
vim.api.nvim_set_keymap("", "J", "^", options)
vim.api.nvim_set_keymap("", "K", "$", options)
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
require"nvim-treesitter.configs".setup {
	highlight = {
 		enable = true
 	},
 	indent = {
 		enable = true
 	}
}


-- LSP
local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
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

require("telescope").setup{
  defaults = {
    vimgrep_arguments = {
      "grg",
      "g--color=never",
      "g--no-heading",
      "g--with-filename",
      "g--line-number",
      "g--column",
      "g--smart-case"
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
    file_sorter =  require"telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require"telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require"telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require"telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require"telescope.previewers".vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require"telescope.previewers".buffer_previewer_maker
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
vim.api.nvim_set_keymap("n", "<Leader>ff",  [[<Cmd>lua require("telescope.builtin").find_files()<CR>]], options)
vim.api.nvim_set_keymap("n", "<Leader>fg",  [[<Cmd>lua require("telescope.builtin").live_grep()<CR>]], options)
vim.api.nvim_set_keymap("n", "<Leader>gf",  [[<Cmd>lua require("telescope.builtin").git_files()<CR>]], options)
vim.api.nvim_set_keymap("n", "<Leader>fb",  [[<Cmd>lua require("telescope.builtin").buffers()<CR>]], options)

-- Compe
require"compe".setup {
  enabled = true;
  map_cr = true;
  debug = false;
  min_length = 1;
  preselect = "enable";
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { "", "" ,"", " ", "", "", "", " " }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = false;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = false;
    luasnip = false;
  };
}

local options = {silent = true, expr = true}
-- TODO: fix such that it works with autopairs
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))", options)
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", options)
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", options)
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", options)
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", options)

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
 
 -- Autopairs
require("nvim-autopairs.completion.compe").setup({
   map_complete = true -- it will auto insert `(` after select function or method item
 })

-- Icons
require"nvim-web-devicons".setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}


-- Lualine
require"lualine".setup {
  options = {
    icons_enabled = true,
    theme = "powerline",
    component_separators = {'', ''},
    section_separators = {"", ""},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
 
 -- TODO: DAP
 -- TODO: something with git
  
