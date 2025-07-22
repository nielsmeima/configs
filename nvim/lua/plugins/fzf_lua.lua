return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'echasnovski/mini.icons' },
    keys = {
      { '<leader>ff', ':FzfLua files<CR>', desc = '[F]ind [F]iles' },
      { '<leader>fg', ':FzfLua live_grep<CR>', desc = '[F]ind [G]rep' },
    },
  },
}

-- vim.keymap.set("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
-- vim.keymap.set("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
-- vim.keymap.set("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
-- vim.keymap.set("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
