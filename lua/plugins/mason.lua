-- Portable package manager for Neovim that runs everywhere Neovim runs.
-- Easily install and manage LSP servers, DAP servers, linters, and formatters.

return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "prettierd",
      "eslint_d",
    },
  },
}
