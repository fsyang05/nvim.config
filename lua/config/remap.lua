vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }

        -- navigation
        vim.keymap.set("n", "gd", vim.lsp.buf.definition,     opts)  -- go to definition
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration,    opts)  -- go to declaration
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)  -- go to implementation
        vim.keymap.set("n", "gr", vim.lsp.buf.references,     opts)  -- list references
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition,opts)  -- go to type definition

        -- info
        vim.keymap.set("n", "K",     vim.lsp.buf.hover,          opts) -- hover docs
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts) -- signature while typing

        -- actions
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,      opts) -- rename symbol
        vim.keymap.set({"n","v"}, "<leader>ca", vim.lsp.buf.code_action, opts) -- code action
        vim.keymap.set("n", "<leader>f",  function() vim.lsp.buf.format({ async = true }) end, opts)
    end,
})
