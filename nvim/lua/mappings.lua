local map = require('utils').map

options = { noremap = true }

map("n", "<up>"   , "<nop>", options)
map("n", "<up>"   , "<nop>", options)
map("n", "<down>" , "<nop>", options)
map("n", "<left>" , "<nop>", options)
map("n", "<right>", "<nop>", options)
map("" , ";"      , "l", options)
map("" , "l", "k", options)
map("" , "k", "j", options)
map("" , "j", "h", options)
map("" , "J", "^", options)
map("" , "K", "$", options)
map("n", "<leader><leader>", "<c-^>", options)
map("i", "<up>"   , "<nop>", options)
map("i", "<down>" , "<nop>", options)
map("i", "<left>" , "<nop>", options)
map("i", "<right>", "<nop>", options)
