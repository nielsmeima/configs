local options = { noremap = true }

vim.keymap.set("n", "n", "nzz", options)
vim.keymap.set("n", "N", "Nzz", options)
vim.keymap.set("n", "{", "{zz", options)
vim.keymap.set("n", "}", "}zz", options)

vim.keymap.set("n", "<up>", "<nop>", options)
vim.keymap.set("n", "<up>", "<nop>", options)
vim.keymap.set("n", "<down>", "<nop>", options)
vim.keymap.set("n", "<left>", "<nop>", options)
vim.keymap.set("n", "<right>", "<nop>", options)
vim.keymap.set("", ";", "l", options)
vim.keymap.set("", "l", "k", options)
vim.keymap.set("", "k", "j", options)
vim.keymap.set("", "j", "h", options)
vim.keymap.set("", "J", "^", options)
vim.keymap.set("", "K", "$", options)
vim.keymap.set("i", "<up>", "<nop>", options)
vim.keymap.set("i", "<down>", "<nop>", options)
vim.keymap.set("i", "<left>", "<nop>", options)
vim.keymap.set("i", "<right>", "<nop>", options)

vim.keymap.set("n", "<leader>cr", [[<Cmd>:CargoReload<CR>]], options)
