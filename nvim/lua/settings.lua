
vim.cmd("colorscheme tokyonight")
vim.cmd("set clipboard^=unnamed,unnamedplus")
vim.cmd("syntax on")
vim.cmd("set shiftwidth=4")

vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

vim.bo.expandtab = true

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

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --crlf",
    ["*"] = "win32yank.exe -o --crlf"
  },
  cache_enable = 0,
}


