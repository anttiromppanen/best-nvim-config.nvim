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
    },
    config = function()
      -- Load friendly-snippets
      require("luasnip.loaders.from_snipmate").lazy_load()
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
        -- Define how snippets expand in the completion menu
        snippet = {
          expand = function(args)
            -- Use LuaSnip to expand snippet bodies
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

          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
        }),

        -- Configure completion sources (priority order matters)
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Language server completions
          { name = "luasnip" },
        }, {
          { name = "buffer" }, -- Words from current buffer
          { name = "path" },   -- File path suggestions
        }),
      })
    end,
  },
}
