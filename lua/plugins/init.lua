return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require "configs.toggleterm"
    end,
  },

  {
    "vim-test/vim-test",
    config = function()
      require "configs.test"
    end,
  },

  {
    "ray-x/go.nvim",
    ft = { "go", "gomod", "gosum", "gowork" },
    dependencies = { "ray-x/guihua.lua" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup()
    end,
  },

  { "hashivim/vim-terraform", ft = { "terraform", "hcl" } },

  { "pearofducks/ansible-vim", ft = { "yaml", "ansible" } },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.lint"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "go",
        "gomod",
        "gosum",
        "gowork",
        "json",
        "yaml",
        "terraform",
        "hcl",
        "typescript",
        "tsx",
        "javascript",
      })
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
