require("telescope").setup {

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
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
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
        },
        --frecency = {
        --    show_scores = true,
        --    ignore_patterns = { "*.git/*", "*/tmp/*" },
        --    workspaces = {
        --        ["conf"] = "/home/nielsmeima/configs",
        --    }
        --}
    }
}

-- Mappings
options = { noremap = true, silent = true }
--local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, options)
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, options)
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, options)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, options)
vim.keymap.set("n", "<leader>bs", require("telescope.builtin").lsp_document_symbols, options)
vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, options)
vim.keymap.set("n", "<leader>td", require("telescope.builtin").diagnostics, options)

vim.keymap.set("n", "<leader>tt", [[<Cmd>:TodoTelescope<CR>]], options)


-- TODO: find out how to put search results into qflist
--map("i", "<Leader>qf",  [[<Cmd>lua require("telescope.builtin").quickfix()<CR>]], options)

-- Extensions
--require("telescope").load_extension("dap")

-- frecency
--require("telescope").load_extension("frecency")
--map("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
--    { noremap = true, silent = true })
