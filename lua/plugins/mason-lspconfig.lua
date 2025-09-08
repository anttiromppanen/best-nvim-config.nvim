-- Automatic install and enable of LSP's via vim.lsp.enable()

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "jsonls",        -- from json-lsp
      "cssls",         -- from css-lsp
      "css_variables", -- from css-variables-language-server
      "cssmodules_ls", -- from cssmodules-language-server
      "emmet_ls",      -- from emmet-ls
      "eslint",        -- from eslint-lsp
      "html",          -- from html-lsp
      "lua_ls",        -- from lua-language-server
      "prismals",      -- from prisma-language-server
      "tailwindcss",   -- from tailwindcss-language-server
      "ts_ls",         -- from typescript-language-server
    },
    automatic_installation = true,
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
