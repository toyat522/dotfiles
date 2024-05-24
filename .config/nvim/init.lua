require("options")
require("plugins")
require("colorscheme")
require("keymaps")
require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
})
