return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 10000,
    -- config = function()
    --   vim.cmd("colorscheme onedark")
    -- end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin-frappe")
    end,
  },
}
