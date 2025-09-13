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

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
map("n", "<leader>dp", "<cmd>TermExec cmd='terraform plan'<cr>", { desc = "Terraform plan" })
map("n", "<leader>da", "<cmd>TermExec cmd='terraform apply'<cr>", { desc = "Terraform apply" })
map("n", "<leader>db", "<cmd>TermExec cmd='ansible-playbook %'<cr>", { desc = "Run Ansible playbook" })
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" })
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
map("n", "<leader>zz", "<cmd>ZenMode<cr>", { desc = "Zen mode" })

map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", { desc = "LSP Hover" })
map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "LSP Code Action" })
map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "LSP Rename" })
map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Line diagnostics" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

map("n", "<leader>ao", "<cmd>AerialToggle<cr>", { desc = "Toggle Aerial" })
map("n", "<leader>td", "<cmd>TodoTrouble<cr>", { desc = "Todo (Trouble)" })
map("n", "<leader>tm", "<cmd>TodoTelescope<cr>", { desc = "Todo (Telescope)" })

map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon add file" })
map("n", "<leader>hh", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon menu" })

map("n", "<leader>dd", function()
  require("dap").continue()
end, { desc = "DAP continue" })
map("n", "<leader>dt", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP breakpoint" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "DAP UI" })

map("n", "<leader>sl", "<cmd>SessionManager load_session<cr>", { desc = "Load session" })
map("n", "<leader>ss", "<cmd>SessionManager save_current_session<cr>", { desc = "Save session" })

map("n", "<leader>nm", "<cmd>Noice<cr>", { desc = "Noice messages" })
