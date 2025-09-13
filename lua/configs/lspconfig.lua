require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "tsserver",
  "jsonls",
  "yamlls",
  "gopls",
  "terraformls",
  "ansiblels",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
