require("config.lazy")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.fillchars = { eob = ' ' }

-- makes the left sign column to be always in place
vim.opt.signcolumn = "yes"

-- unmap default s for normal-, visual modes
vim.keymap.set("n", "s", "<Nop>")
vim.keymap.set("v", "s", "<Nop>")


vim.keymap.set("n", "<C-E>", ":Neotree toggle left<CR>", { desc = "Toggle Neotree" })

vim.keymap.set("n", "Ö", vim.diagnostic.goto_next)
vim.keymap.set("n", "Ä", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<leader>cs", vim.lsp.buf.hover, { desc = "Show information about the symbol" })
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })

-- Telescope - telescope.nvim is a highly extendable fuzzy finder over lists
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files - Telescope' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep - Telescope' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers - Telescope' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Current word - Telescope' })
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Recent files ("." for repeat) - Telescope' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags - Telescope' })
vim.keymap.set('n', '<leader>fs', builtin.keymaps, { desc = 'Search keymaps - Telescope' })

-- Enable diagnostic display
vim.diagnostic.config({
  -- virtual_text = true,      -- show inline text
  underline = true,         -- underline doesn't work on every os and terminal
  update_in_insert = false, -- don’t update while typing
  severity_sort = true,     -- sort by severity

  float = {
    border = "rounded", -- or "single", "double", "solid", "shadow"
    focusable = false,
    style = "minimal",
    source = "always", -- show source in diagnostics
    header = "",
    prefix = " ",
  },

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "Error",
      [vim.diagnostic.severity.WARN] = "Warn",
      [vim.diagnostic.severity.INFO] = "Info",
      [vim.diagnostic.severity.HINT] = "Hint",
    },
  },
})

-- Disable full-line highlights
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = "#1e1e2e", fg = "#f38ba8" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { bg = "#1e1e2e", fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { bg = "#1e1e2e", fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { bg = "#1e1e2e", fg = "#a6e3a1" })
