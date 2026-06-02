return {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                enable = false
            },
            symbol_in_winbar = {
                enable = true,        -- breadcrumbs
                separator = ' › ',
                hide_keyword = false,
                show_file = true,
                folder_level = 1,
                color_mode = true,
            },
        })

        local opts = { silent = true }
        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts) -- press K again to focus the float; scroll with j/k, q to close
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- required for breadcrumbs (hide_keyword/symbols)
        'nvim-tree/nvim-web-devicons',
    }
}
