return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    preset = "modern",
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "s",      mode = { "n", "v" } },
    },
    layout = {
    },
    win = {
      wo = {
        winblend = 30,
      }
    },
    spec = {
      { "<leader>f", group = "Telescope search" },
      { "<leader>x", group = "Trouble diagnostics" },
      { "<leader>c", group = "LSP buffer actions" },
      { "s",         group = "mini.surround" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
