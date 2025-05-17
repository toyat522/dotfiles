vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.mouse = "a" 		      -- allow the mouse to be used in vim

-- Disable netrw file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tab
vim.opt.tabstop = 4	      -- number of visual spaces per TAB
vim.opt.softtabstop = 4   -- number of spaces in TAB when editing
vim.opt.shiftwidth = 4	  -- insert 4 spaces on a TAB
vim.opt.expandtab = true  -- tabs are spaces

-- UI config
vim.opt.number = true	  -- show absolute number
vim.opt.cursorline = true -- highlight cursor line underneath the cursor

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but case sensitive if uppercase is entered

-- ASM syntax highlight
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.asm",
    command = "set filetype=masm"
})
