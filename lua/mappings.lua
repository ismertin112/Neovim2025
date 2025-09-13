require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map({ "n", "i", "v" }, "<D-s>", "<cmd>w<cr>", { desc = "Save file" })

map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal" })

map("n", "<leader>tn", "<cmd>TestNearest<cr>", { desc = "Run nearest test" })
map("n", "<leader>tf", "<cmd>TestFile<cr>", { desc = "Run file tests" })
map("n", "<leader>ts", "<cmd>TestSuite<cr>", { desc = "Run test suite" })
