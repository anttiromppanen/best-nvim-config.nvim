-- ============================================================================
-- Neovim LSP: null-ls (nvimtools/none-ls.nvim) Configuration
-- ============================================================================
-- This file integrates external formatters, linters, and other tools into the
-- Neovim LSP client using null-ls (a bridge between Neovim LSP and CLI tools).
--
-- What this setup does:
--   • Loads null-ls and registers formatting/diagnostics sources
--   • Enables format-on-save (if the attached LSP client supports formatting)
--   • Adds popular tools:
--       - stylua      → Lua code formatter
--       - prettierd   → Fast Prettier formatter via daemon
--       - spell       → Simple spell-check completion
--       - eslint_d    → ESLint (daemon mode) diagnostics
--
-- Result: You get LSP-style formatting and diagnostics from external tools,
-- seamlessly integrated with Neovim.
-- ============================================================================

return {
  "nvimtools/none-ls.nvim",          -- Main null-ls plugin
  dependencies = {
    "nvimtools/none-ls-extras.nvim", -- Provides extra built-in sources
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      -- Define the tools (sources) to hook into LSP
      sources = {
        null_ls.builtins.formatting.stylua,      -- Lua code formatting
        null_ls.builtins.formatting.prettierd,   -- Prettier for JS/TS/HTML/CSS/etc.
        null_ls.builtins.completion.spell,       -- Spell checker for completion
        require("none-ls.diagnostics.eslint_d"), -- ESLint diagnostics via daemon
      },

      -- on_attach runs when an LSP client attaches to a buffer
      on_attach = function(client, bufnr)
        -- Create (or reuse) an augroup for autoformatting
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- Check if the client supports formatting
        if client.supports_method("textDocument/formatting") then
          -- Clear any old autocmds for this buffer
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })

          -- Autoformat on save (BufWritePre)
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
