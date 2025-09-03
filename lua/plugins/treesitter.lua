return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    indent = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- Add Prisma parser
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.prisma = {
      install_info = {
        url = "https://github.com/Prisma/tree-sitter-prisma",
        files = { "src/parser.c" },
        branch = "main",
      },
    }
  end,
}
