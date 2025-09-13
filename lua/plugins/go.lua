return {
  -- Настройка LSP для Go
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
                nilness = true,
                unusedwrite = true,
                fieldalignment = false, -- может быть шумным
              },
              staticcheck = true,
              gofumpt = true,
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              codelenses = {
                generate = true, -- показывает код-лензы для генерации методов
                gc_details = true, -- показывает детали сборки мусора
                test = true, -- показывает код-лензы для тестов
                tidy = true, -- показывает код-лензы для go mod tidy
              },
            },
          },
          on_attach = function(client, bufnr)
            -- Дополнительные привязки клавиш для Go
            local map = function(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            -- Перезагрузка gopls (полезно при проблемах)
            map("n", "<leader>lr", "<cmd>LspRestart<cr>", "Restart LSP")

            -- Быстрое исправление
            map("n", "<leader>lf", vim.lsp.buf.code_action, "Code action")

            -- Переименование
            map("n", "<leader>lR", vim.lsp.buf.rename, "Rename symbol")
          end,
        },
      },
    },
  },

  -- Форматирование с помощью goimports
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports" }, -- gofmt уже включен в goimports
      },
      formatters = {
        goimports = {
          prepend_args = { "-local", "github.com/your-org/your-project" }, -- замените на ваш модуль
        },
      },
    },
  },

  -- Дополнительные treesitter-настройки
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "go", "gomod", "gowork" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
  },

  -- nvim-dap (без вызова setup)
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- Базовая настройка DAP (без вызова setup)
      local dap = require("dap")

      -- Настройка адаптера для Go
      dap.adapters.go = {
        type = "executable",
        command = "node",
        args = {
          os.getenv("HOME") .. "/.local/share/nvim/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js",
        },
      }

      -- Конфигурации отладки для Go
      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug with args",
          request = "launch",
          program = "${file}",
          args = function()
            return vim.split(vim.fn.input("Program arguments: "), " ")
          end,
        },
        {
          type = "go",
          name = "Debug test",
          request = "launch",
          mode = "test",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug package",
          request = "launch",
          program = "${fileDirname}",
        },
      }
    end,
  },

  -- nvim-dap-go
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup({
        -- Дополнительные настройки для dap-go
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          args = {},
        },
      })

      -- Клавиши для отладки
      vim.keymap.set("n", "<leader>dt", ":lua require('dap-go').debug_test()<CR>", { desc = "Debug test" })
      vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<CR>", { desc = "Debug last" })
    end,
  },

  -- go.nvim для тестов
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        -- Дополнительные настройки для go.nvim
        goimport = "goimports",
        gofmt = "gofumpt",
        max_line_len = 120,
        test_dir = "",
        comment_placeholder = "   ",
        lsp_cfg = false, -- уже настроено через lspconfig
        lsp_gofumpt = true,
        lsp_on_attach = true,
        lsp_keymaps = false, -- уже настроили свои
        dap_debug = true,
        dap_debug_keymap = false, -- уже настроили свои
        dap_debug_gui = false,
        dap_debug_vt = true,
      })

      -- Клавиши для работы с тестами
      vim.keymap.set("n", "<leader>ga", ":GoAddTag<CR>", { desc = "Add tags" })
      vim.keymap.set("n", "<leader>ge", ":GoIfErr<CR>", { desc = "Add if err" })
      vim.keymap.set("n", "<leader>gT", ":GoTestFunc<CR>", { desc = "Test function" })
      vim.keymap.set("n", "<leader>gF", ":GoTestFile<CR>", { desc = "Test file" })
      vim.keymap.set("n", "<leader>gP", ":GoTestPkg<CR>", { desc = "Test package" })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
  },

  -- Настройка линтера golangci-lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangci_lint" },
      },
      linters = {
        golangci_lint = {
          cmd = "golangci-lint",
          args = {
            "run",
            "--out-format",
            "json",
            "--path-prefix",
            "$DIRNAME",
            "--config",
            vim.fn.getcwd() .. "/.golangci.yml", -- ищет конфиг в текущей директории
          },
          stdin = false,
          stream = "stdout",
          ignore_exitcode = true,
          parser = function(output, bufnr)
            local decoded = vim.json.decode(output)
            if not decoded or not decoded.Issues then
              return {}
            end

            local diagnostics = {}
            for _, issue in ipairs(decoded.Issues) do
              local severity = vim.diagnostic.severity.WARN
              if issue.Severity == "error" then
                severity = vim.diagnostic.severity.ERROR
              end

              table.insert(diagnostics, {
                lnum = issue.Pos.Line - 1,
                col = issue.Pos.Column - 1,
                end_lnum = (issue.End and issue.End.Line or issue.Pos.Line) - 1,
                end_col = (issue.End and issue.End.Column or issue.Pos.Column) - 1,
                severity = severity,
                source = "golangci-lint",
                message = issue.Text,
                code = issue.FromLinter,
              })
            end
            return diagnostics
          end,
        },
      },
    },
    config = function(_, opts)
      -- Автоматический линтинг при сохранении
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  -- Дополнительные плагины для Go
  {
    "theprimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
}
