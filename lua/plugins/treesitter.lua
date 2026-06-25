--[[
Treesitter Configuration
------------------------
This file configures the `nvim-treesitter` plugin, which provides advanced syntax
highlighting, indentation, and parsing for multiple programming languages.

Key points:
- Uses the master branch and runs `:TSUpdate` after install to keep parsers up to date.
- Automatically installs missing parsers.
- Enables both Treesitter-based highlighting and traditional regex highlighting.
- Registers a custom parser for Prisma by pulling it from the official Prisma tree-sitter repo.
]]

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",                              -- always track the latest master branch
  lazy = false,                                 -- load immediately (not lazily)
  build = ":TSUpdate",                          -- update installed parsers after install/update
  opts = {
    auto_install = true,                        -- automatically install missing language parsers
    indent = true,                              -- enable Treesitter-based indentation
    highlight = {
      enable = true,                            -- enable Treesitter syntax highlighting
      additional_vim_regex_highlighting = true, -- also keep regex-based highlighting
    },
  },
}
