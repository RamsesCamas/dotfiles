local opts = { noremap = true, silent = true}

vim.keymap.set("i","jj", "<ESC>", opts)
vim.keymap.set("n","<leader>V", ":vsplit<CR>", opts)

--Clear search highlights

vim.keymap.set("n", "<esc>", ":noh<return><esc>",opts)
