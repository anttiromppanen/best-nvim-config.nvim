-- Diagnostics error settings
vim.diagnostic.config({
  virtual_text = false,     -- show inline text
  underline = true,         -- underline doesn't work on every os and terminal
  update_in_insert = false, -- don’t update while typing
  severity_sort = true,     -- sort by severity

  float = {
    border = "rounded", -- or "single", "double", "solid", "shadow"
    focusable = true,
    -- style = "minimal",
    source = "always", -- show source in diagnostics
    header = "💡 Issues",
    prefix = "→ ",
  },

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
    },
  },
})
