-- ============================================================================
-- Neovim LSP Configuration (nvim-lspconfig)
-- ============================================================================
-- This file configures Neovim's built-in Language Server Protocol (LSP) client
-- using the `nvim-lspconfig` plugin. It sets up language servers for:
--   • TypeScript / JavaScript (ts_ls)
--   • HTML (html)
--   • Lua (lua_ls)
--
-- Features provided by LSP servers:
--   • Autocompletion (via cmp-nvim-lsp capabilities)
--   • Diagnostics (errors/warnings)
--   • Hover docs, go-to-definition, references, rename, etc.
--
-- Special setup:
--   • Lua LSP is told to recognize the global `vim` object to prevent
--     "undefined global 'vim'" warnings.
--
-- Result: Neovim behaves like a modern IDE with language-aware features.
-- ============================================================================

return {
  "neovim/nvim-lspconfig", -- Main plugin for configuring LSP servers
  lazy = false,            -- Ensure this loads immediately at startup
  config = function()
    -- Extend LSP client capabilities with completion support from nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Load the LSP configuration module
    local lspconfig = require("lspconfig")

    -- --------------------------------------------------------------
    -- Language server setups
    -- --------------------------------------------------------------

    -- TypeScript / JavaScript server
    lspconfig.ts_ls.setup({
      capabilities = capabilities, -- enable autocompletion
    })

    -- HTML server
    lspconfig.html.setup({
      capabilities = capabilities,
    })

    -- Tailwind server
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })

    -- CSS, CSS Modules, SCSS, etc.
    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    --Syntax highlighting, schema validation, autocompletion for schema.prisma
    lspconfig.prismals.setup({
      capabilities = capabilities,
    })

    -- Provides linting, links validation, and outline navigation in Markdown
    lspconfig.marksman.setup({
      capabilities = capabilities,
    })

    -- validate JSON files (config files, package.json, etc.)
    lspconfig.jsonls.setup({
      capabilities = capabilities,
    })

    -- expand HTML-like abbreviations (div.flex > p.text-lg)
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
    })

    -- Lua server (with extra settings)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Tell the Lua language server to recognize `vim` as a global
            -- (avoids "undefined global 'vim'" errors in Neovim configs)
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
