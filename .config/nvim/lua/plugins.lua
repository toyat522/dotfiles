local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Themes
    "sainnhe/sonokai",
    "nvim-lualine/lualine.nvim",

    -- Utility
    "jiangmiao/auto-pairs",
    "romgrk/barbar.nvim",
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",

    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.nvim-cmp")
        end,
    },
    { "hrsh7th/cmp-buffer",   dependencies = { "nvim-cmp" } },
    { "hrsh7th/cmp-path",     dependencies = { "nvim-cmp" } },
})
