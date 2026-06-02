return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    require("kanagawa").setup({
      theme = "lotus",
      background = {
        dark = "dragon",
        light = "lotus",
      },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    })
    vim.cmd.colorscheme("kanagawa")

    vim.keymap.set("n", "<leader>bg", function()
      vim.o.background = vim.o.background == "dark" and "light" or "dark"
      vim.cmd.colorscheme("kanagawa")
    end, { desc = "Toggle light/dark background" })
  end,
}
