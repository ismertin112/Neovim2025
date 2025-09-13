return {

  -- уведомления
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },

  -- toggleterm для плавающего терминала
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
  -- LSP + Treesitter + форматирование
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      lspconfig.terraformls.setup({
        cmd = { "terraform-ls", "serve" },
        filetypes = { "terraform", "tf", "hcl" },
        root_dir = util.root_pattern(".terraform", ".git"),
      })

      lspconfig.tflint.setup({
        root_dir = util.root_pattern(".git", ".terraform"),
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        hcl = { "terraform_fmt" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "hcl" },
    },
  },

  {
    "hashivim/vim-terraform",
    ft = { "terraform", "hcl" },
    config = function()
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 0
    end,
  },

  -- хоткеи
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>tf"] = { name = "+terraform" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.add(opts.defaults)

      local notify = require("notify")
      local Terminal = require("toggleterm.terminal").Terminal

      -- короткие (notify)
      local function run_notify(cmd, title)
        vim.fn.jobstart(cmd, {
          stdout_buffered = true,
          on_stdout = function(_, data)
            if data and #data > 0 then
              notify(table.concat(data, "\n"), "info", { title = title, timeout = 5000 })
            end
          end,
          on_stderr = function(_, data)
            if data and #data > 0 then
              notify(table.concat(data, "\n"), "error", { title = title, timeout = 8000 })
            end
          end,
        })
      end

      -- длинные (float term)
      local function run_float(cmd)
        Terminal:new({
          cmd = cmd,
          direction = "float",
          close_on_exit = false,
          hidden = true,
        }):toggle()
      end

      -- бинды
      vim.keymap.set("n", "<leader>tfi", function()
        run_notify({ "terraform", "init" }, "Terraform Init")
      end, { desc = "Terraform Init" })
      vim.keymap.set("n", "<leader>tfv", function()
        run_notify({ "terraform", "validate" }, "Terraform Validate")
      end, { desc = "Terraform Validate" })
      vim.keymap.set("n", "<leader>tfp", function()
        run_float("terraform plan")
      end, { desc = "Terraform Plan" })
      vim.keymap.set("n", "<leader>tfa", function()
        run_float("terraform apply -auto-approve")
      end, { desc = "Terraform Apply" })
      vim.keymap.set("n", "<leader>tfd", function()
        run_float("terraform destroy -auto-approve")
      end, { desc = "Terraform Destroy" })
    end,
  },
}
