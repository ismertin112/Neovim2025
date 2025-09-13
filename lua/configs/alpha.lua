local ok, alpha = pcall(require, "alpha")
if not ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
  "        .--.",
  "       |o_o |",
  "       |:_/ |",
  "      //   \\ \",
  "     (|     | )",
  "    /'\\_   _/`\\",
  "    \\___)=(___/",
  "",
  "      Happy Hacking!",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", "<cmd>ene <BAR> startinsert <cr>"),
  dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
  dashboard.button("r", "  Recent", "<cmd>Telescope oldfiles<cr>"),
  dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
}

alpha.setup(dashboard.config)
