return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      auto_integrations = true,
    })
  end,

  init = function()
    -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    vim.cmd("colorscheme catppuccin-mocha")
  end
}
