local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Use <CR>(Enter) to confirm selection
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- A super tab
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- Hint: if the completion menu is visible select next one
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }), -- i - insert mode; s - select mode
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    -- Simple formatting style
    formatting = { 
        fields = { 'abbr' }
    },

    -- Set source precedence
    sources = cmp.config.sources({
        { name = 'buffer' },
        { name = 'path' },
    })
})
