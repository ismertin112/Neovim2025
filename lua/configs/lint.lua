local lint = require("lint")

lint.linters_by_ft = {
  go = { "golangci-lint" },
  terraform = { "tflint" },
  hcl = { "tflint" },
  yaml = { "yamllint" },
  ansible = { "ansible-lint" },
  json = { "jsonlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
