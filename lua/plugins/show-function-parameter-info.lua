-- Shows function parameter info in a window when function is used

return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_signature").setup({
      bind = true,
      floating_window = true, -- show signature help in a floating window
      hint_enable = true,     -- also show inline hints while typing
      handler_opts = {
        border = "rounded",   -- nice rounded borders
      },
      max_height = 12,        -- max height of the signature window
      max_width = 80,         -- max width of the signature window
      padding = " ",
      transparency = nil,     -- keep opaque
      toggle_key = "<C-k>",   -- manual toggle (insert mode)
    })
  end,
}
