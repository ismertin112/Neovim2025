local lsp = require("config.lsp")
local python = require("lang.python")

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = { ui = { border = "rounded" } },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = { "pyright", "terraformls", "lua_ls" },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim", "mason-lspconfig.nvim", "folke/neodev.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })
      local lspconfig = require("lspconfig")
      local servers = {
        pyright = {
          settings = python.pyright_settings(),
        },
        terraformls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
      }

      require("mason-lspconfig").setup_handlers({
        function(server)
          local opts = vim.tbl_deep_extend("force", {
            capabilities = lsp.capabilities,
            on_attach = lsp.on_attach,
          }, servers[server] or {})
          lspconfig[server].setup(opts)
        end,
      })
    end,
  },
{
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local sources = {
      null_ls.builtins.formatting.terraform_fmt,
      null_ls.builtins.diagnostics.tflint,
    }

    -- Пробуем аккуратно подключить Ruff как линтер
    local ok_ruff_diag, ruff_diag = pcall(function()
      return null_ls.builtins.diagnostics.ruff
    end)
    if ok_ruff_diag and ruff_diag then
      table.insert(sources, ruff_diag.with({ command = "ruff" }))
    end

    -- Пробуем аккуратно подключить Ruff как форматер
    local ok_ruff_fmt, ruff_fmt = pcall(function()
      return null_ls.builtins.formatting.ruff_format
    end)
    if ok_ruff_fmt and ruff_fmt then
      table.insert(sources, ruff_fmt)
    end

    null_ls.setup({
      sources = sources,
      on_attach = lsp.on_attach,
    })
  end,
},
}
