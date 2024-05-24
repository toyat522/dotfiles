-- Ctrl+n to open nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Move to prev/next buffer
vim.keymap.set("n", "<A-,>", ":BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", ":BufferNext<CR>")

-- Close buffer
vim.keymap.set("n", "<A-w>", ":BufferClose<CR>")
