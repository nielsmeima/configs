local map = require('utils').map

require("telescope").setup{
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
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
    file_sorter =  require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require("telescope.sorters").get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
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

-- Mappings
options = { noremap = true, silent = true }

map("n", "<Leader>ff",  [[<Cmd>lua require("telescope.builtin").find_files()<CR>]], options)
map("n", "<Leader>fg",  [[<Cmd>lua require("telescope.builtin").live_grep()<CR>]], options)
map("n", "<Leader>gf",  [[<Cmd>lua require("telescope.builtin").git_files()<CR>]], options)
map("n", "<Leader>fb",  [[<Cmd>lua require("telescope.builtin").buffers()<CR>]], options)
map("n", "<Leader>fc",  [[<Cmd>:TodoTelescope<CR>]], options)
map("n", "<Leader>qf",  [[<Cmd>:TodoQuickFix<CR>]], options)

-- TODO: find out how to put search results into qflist
--map("i", "<Leader>qf",  [[<Cmd>lua require("telescope.builtin").quickfix()<CR>]], options)

-- Extensions
--require("telescope").load_extension("dap")
