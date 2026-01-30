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
    "romgrk/barbar.nvim",
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },

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

    -- Autocompletion
    {
        "saghen/blink.cmp",

        -- Snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- Use a release tag to download pre-built binaries
        version = "1.*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "enter",
                -- Select completions
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                -- Scroll documentation
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "lua" },
            completion = {
                -- The keyword should only match against the text before
                keyword = { range = "prefix" },
                menu = {
                    -- Use treesitter to highlight the label text for the given list of sources
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                -- Show completions after typing a trigger character, defined by the source
                trigger = { show_on_trigger_character = true },
                documentation = {
                    -- Show documentation automatically
                    auto_show = true,
                },
            },

            -- Signature help when typing
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },

    -- LSP manager
    { "mason-org/mason.nvim", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = { "pylsp", "clangd" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config('pylsp', {
                cmd = { 'pylsp' },
                filetypes = { 'python' },
                root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile' },
                settings = {
                    pylsp = {
                        plugins = {
                            black = {
                                enabled = true,
                            },
                            pycodestyle = {
                                enabled = true,
                                maxLineLength = 88,
                            },
                        }
                    }
                }
            })
            vim.lsp.config('clangd', {
                cmd = { 'clangd' },
                filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
                root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac' },
            })

            vim.lsp.enable({'pylsp', 'clangd'})
        end,
    },
})
require("lsp")
