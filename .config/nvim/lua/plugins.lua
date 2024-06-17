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

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    -- Vimtex
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },

    -- Conquer of Completion
    {
        "neoclide/coc.nvim",
        branch = "release"
    }
})
require("config.coc")
