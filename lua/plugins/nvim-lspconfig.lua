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
	lazy = false, -- Ensure this loads immediately at startup
	config = function()
		-- Extend LSP client capabilities with completion support from nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Load the LSP configuration module
		local lspconfig = require("lspconfig")

		-- Load lsp_signature
		local lsp_signature = require("lsp_signature")

		-- Common on_attach function
		local on_attach = function(client, bufnr)
			-- enable signature help popup when inside function calls
			lsp_signature.on_attach({
				bind = true,
				floating_window = true,
				hint_enable = true,
				handler_opts = { border = "rounded" },
			}, bufnr)

			-- autoformat on save if the server supports it
			if client.supports_method("textDocument/formatting") then
				local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end

		-- --------------------------------------------------------------
		-- Language server setups
		-- --------------------------------------------------------------

		-- TypeScript / JavaScript server
		lspconfig.ts_ls.setup({
			capabilities = capabilities, -- enable autocompletion
			on_attach = on_attach, -- enable function parameter info
		})

		-- Disable duplicate warnings (using eslint_d from null_ls)
		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				-- immediately stop the client
				client.stop()
			end,
		})

		-- HTML server
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Tailwind server
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- CSS, CSS Modules, SCSS, etc.
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--Syntax highlighting, schema validation, autocompletion for schema.prisma
		lspconfig.prismals.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- validate JSON files (config files, package.json, etc.)
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- expand HTML-like abbreviations (div.flex > p.text-lg)
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
		})

		-- Lua server (with extra settings)
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						-- Tell the Lua language server to recognize vim as a global
						-- (avoids "undefined global 'vim'" errors in Neovim configs)
						globals = { "vim" },
					},
				},
			},
		})
	end,
}
