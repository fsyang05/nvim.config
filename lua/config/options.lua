-- basic
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Lua (init.lua)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- UI stuff
vim.opt.termguicolors = true  -- required for most colorschemes
vim.opt.signcolumn = "yes"    -- always show sign column (avoids text shifting)
vim.opt.showmode = false
-- vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.wrap = false

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- lsp stuff
vim.diagnostic.config({
    virtual_text = true,       -- inline message at end of line
    signs = false,              -- the W/E in the gutter
    underline = false,          -- underline the problem in code
    update_in_insert = false,  -- don't spam while typing
    severity_sort = true,      -- show errors above warnings
    float = {
        border = "rounded",
        source = true,           -- show which LSP produced the message
    },
})
