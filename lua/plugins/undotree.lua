return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undotree" },
  },

  init = function()
    vim.g.undotree_WindowLayout = 2          -- diff on top, tree + history on bottom
    vim.g.undotree_SetFocusWhenToggle = 1    -- jump into the undotree window when opened
    vim.g.undotree_ShortIndicators = 1       -- compact timestamps (e.g. "2m" vs "2 minutes ago")
  end,
}
