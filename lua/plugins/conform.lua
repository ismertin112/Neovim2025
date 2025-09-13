-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      json = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      terraform = { "terraform_fmt" },
      hcl = { "terraform_fmt" },
    },
    formatters = {
      terraform_fmt = {
        command = "terraform",
        args = { "fmt", "-" },
        stdin = true,
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
