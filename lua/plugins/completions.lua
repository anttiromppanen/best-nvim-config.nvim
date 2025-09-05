-- ============================================================================
-- Neovim Autocompletion Setup
-- ============================================================================
-- This file configures autocompletion in Neovim using:
--
--   • hrsh7th/nvim-cmp → the main completion engine
--   • hrsh7th/cmp-nvim-lsp → provides LSP completion items
--   • L3MON4D3/LuaSnip → snippet engine (expandable code snippets)
--   • cmp_luasnip → bridge between nvim-cmp and LuaSnip
--   • friendly-snippets → a collection of ready-to-use snippets
--   • cmp-buffer / cmp-path → completion sources for words in buffer and file paths
--
-- The setup works like this:
--   1. Load snippet support (LuaSnip + friendly-snippets)
--   2. Configure nvim-cmp with completion sources (LSP, snippets, buffer, path)
--   3. Define how the completion menu and documentation look
--   4. Set up key mappings for navigating, confirming, and aborting completion
--
-- This makes Neovim behave more like a modern IDE (VSCode-style autocomplete).
-- ============================================================================
--

return {
  {
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp (language server completions)
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",     -- Connects LuaSnip with nvim-cmp
      "rafamadriz/friendly-snippets", -- Prebuilt community snippets
      "mlaursen/vim-react-snippets",  -- React snippets for LuaSnip
    },
    config = function()
      local luasnip = require("luasnip")

      -- Load friendly-snippets
      require("luasnip.loaders.from_snipmate").lazy_load()

      -- Load vim-react-snippets only for React filetypes
      require("vim-react-snippets").lazy_load({
        filetypes = { "javascriptreact", "typescriptreact" },
      })

      -- Optional configuration for vim-react-snippets
      local config = require("vim-react-snippets.config")
      config.readonly_props = false              -- Do not wrap props in Readonly<T>
      config.test_framework = "vitest"           -- Use Vitest instead of Jest
      config.test_renderer_path = "@/test-utils" -- Custom test renderer path
    end,
  },
  {
    "hrsh7th/nvim-cmp",     -- Main completion plugin
    dependencies = {
      "hrsh7th/cmp-buffer", -- Completion from open buffers
      "hrsh7th/cmp-path",   -- Completion for file paths
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
        }),

        -- Define completion sources with priority
        sources = cmp.config.sources({
          { name = "path",     priority = 1000 }, -- Filesystem paths
          { name = "luasnip",  priority = 900 },  -- Snippets (friendly-snippets + vim-react-snippets)
          { name = "nvim_lsp", priority = 800 },  -- LSP completions
          { name = "buffer",   priority = 500 },  -- Words from current buffer
          { name = "emmet_ls", priority = 200 },  -- Emmet (deprioritized)
        }),

        -- Show where each completion item came from
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip  = "[Snippet]",
              buffer   = "[Buffer]",
              path     = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
      })
    end,
  },
}
