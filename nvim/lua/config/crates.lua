local crates = require('crates')
local opts = { silent = true }

crates.setup {}

vim.keymap.set('n', '<leader>ct', crates.toggle, opts)
vim.keymap.set('n', '<leader>cr', crates.reload, opts)

vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)

vim.keymap.set('n', '<leader>cu', crates.update_crate, opts)
vim.keymap.set('v', '<leader>cu', crates.update_crates, opts)
vim.keymap.set('n', '<leader>ca', crates.update_all_crates, opts)

vim.keymap.set('n', '<leader>ch', crates.open_homepage, opts)
vim.keymap.set('n', '<leader>cr', crates.open_repository, opts)
vim.keymap.set('n', '<leader>cd', crates.open_documentation, opts)
vim.keymap.set('n', '<leader>cc', crates.open_crates_io, opts)
