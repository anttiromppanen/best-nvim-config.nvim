-- set leader key to space
vim.g.mapleader = " "

-- unmap default s for normal-, visual modes
vim.keymap.set("n", "s", "<Nop>")
vim.keymap.set("v", "s", "<Nop>")

-- neotree
vim.keymap.set("n", "<C-E>", ":Neotree toggle left<CR>", { desc = "Toggle Neotree" })

-- diagnostics jumping
vim.keymap.set("n", "ö", vim.diagnostic.goto_next)
vim.keymap.set("n", "ä", vim.diagnostic.goto_prev)

-- lsp maps
vim.keymap.set("n", "<leader>cs", vim.lsp.buf.hover, { desc = "Show information about the symbol" })
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })

-- Telescope - telescope.nvim is a highly extendable fuzzy finder over lists
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files - Telescope" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep - Telescope" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers - Telescope" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Current word - Telescope" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = 'Recent files ("." for repeat) - Telescope' })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags - Telescope" })
vim.keymap.set("n", "<leader>fs", builtin.keymaps, { desc = "Search keymaps - Telescope" })
