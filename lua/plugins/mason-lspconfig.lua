-- Automatic install and enable of LSP's via vim.lsp.enable()

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
  },
}
