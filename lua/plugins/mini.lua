-- Library of 40+ independent Lua modules improving overall Neovim (version 0.9 and higher) experience with minimal effort.
-- They all share same configuration approaches and general design principles.

return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    require("mini.move").setup()
    require('mini.surround').setup()
  end
}
