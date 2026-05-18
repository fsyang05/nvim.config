return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    "--offset-encoding=utf-16",
                },
            }) 
            vim.lsp.enable({ "lua_ls", "clangd", "basedpyright", "ruff", "vtsls" })
        end,
    }
}
