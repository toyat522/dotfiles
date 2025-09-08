-- Ctrl+n to open nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Move to prev/next buffer
vim.keymap.set("n", "<A-,>", ":BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", ":BufferNext<CR>")

-- Close buffer
vim.keymap.set("n", "<A-w>", ":BufferClose<CR>")

-- Format file
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "cpp", "cu" },
    callback = function()
        vim.keymap.set("n", "=G", function()
            vim.lsp.buf.format()
        end, { buffer = true })
    end,
})
