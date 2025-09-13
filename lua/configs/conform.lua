local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
    terraform = { "terraform_fmt" },
    hcl = { "terraform_fmt" },
    json = { "prettier" },
    yaml = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
