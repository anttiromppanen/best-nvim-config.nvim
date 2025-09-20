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
	lazy = false, -- Load immediately
	config = function()
		-- Extend LSP client capabilities with completion support from nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Load lsp_signature
		local lsp_signature = require("lsp_signature")

		-- Common on_attach function
		local on_attach = function(client, bufnr)
			-- Enable signature help popup when inside function calls
			lsp_signature.on_attach({
				bind = true,
				floating_window = true,
				hint_enable = true,
				handler_opts = { border = "rounded" },
			}, bufnr)

			-- Autoformat on save if the server supports it
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
		-- Language server configurations (new vim.lsp.config style)
		-- --------------------------------------------------------------

		vim.lsp.config["tsserver"] = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config["eslint"] = {
			on_attach = function(client)
				client.stop() -- disable duplicate diagnostics (use null-ls instead)
			end,
		}

		vim.lsp.config["html"] = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config["tailwindcss"] = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config["cssls"] = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config["prismals"] = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config["jsonls"] = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config["emmet_ls"] = {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
		}

		vim.lsp.config["lua_ls"] = {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }, -- recognize `vim` global
					},
				},
			},
		}

		-- --------------------------------------------------------------
		-- Autostart servers on matching filetypes
		-- --------------------------------------------------------------

		local filetype_to_servers = {
			typescript = { "tsserver", "eslint" },
			javascript = { "tsserver", "eslint" },
			javascriptreact = { "tsserver", "eslint" },
			typescriptreact = { "tsserver", "eslint" },
			html = { "html", "emmet_ls" },
			css = { "cssls", "emmet_ls", "tailwindcss" },
			scss = { "cssls", "tailwindcss" },
			lua = { "lua_ls" },
			json = { "jsonls" },
			prisma = { "prismals" },
		}

		for ft, servers in pairs(filetype_to_servers) do
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ft,
				callback = function(args)
					for _, server in ipairs(servers) do
						vim.lsp.start(vim.lsp.config[server], { bufnr = args.buf })
					end
				end,
			})
		end
	end,
}
