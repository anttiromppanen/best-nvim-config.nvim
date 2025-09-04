return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.ts_ls.setup({
      capabilities = capabilities
    })
    lspconfig.html.setup({
      capabilities = capabilities
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
