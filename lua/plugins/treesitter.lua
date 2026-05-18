return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.install({
        "python",
        "typescript",
        "tsx",
        "javascript",
        "cpp",
        "lua",
        "vim",
        "vimdoc"
    })
    -- Tell Neovim to use its built-in Tree-sitter engine for highlighting
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
