require("config.lazy")
require("diagnostics")
require("keymaps")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.fillchars = { eob = ' ' }

-- makes the left sign column to be always in place
vim.opt.signcolumn = "yes"
