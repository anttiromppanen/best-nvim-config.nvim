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
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.completion.spell,
				require("none-ls.diagnostics.eslint_d"),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								async = false,
								bufnr = bufnr,
								filter = function(c)
									return c.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
