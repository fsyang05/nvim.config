return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",  -- only load when you start typing
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",   -- LSP source
        "hrsh7th/cmp-buffer",     -- words from current buffer
        "hrsh7th/cmp-path",       -- filesystem paths
        "L3MON4D3/LuaSnip",       -- snippet engine (required by cmp)
        "saadparwaiz1/cmp_luasnip", -- snippet completion source
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            window = {
                completion    = cmp.config.window.bordered(),  -- rounded border on suggestion menu
                documentation = cmp.config.window.bordered(),  -- rounded border on docs panel
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-n>"]     = cmp.mapping.select_next_item(),
                ["<C-p>"]     = cmp.mapping.select_prev_item(),
                ["<C-d>"]     = cmp.mapping.scroll_docs(-4),
                ["<C-f>"]     = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),          -- manually trigger menu
                ["<CR>"]      = cmp.mapping.confirm({ select = false }),  -- enter accepts only if you've explicitly selected
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip"  },
            }, {
                { name = "buffer" },
                { name = "path"   },
            }),
        })
    end,
}
