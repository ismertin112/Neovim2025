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
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
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

  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialOpen" },
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {},
  },

  {
    "Shatur/neovim-session-manager",
    cmd = "SessionManager",
    opts = {},
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  { "stevearc/dressing.nvim", event = "VeryLazy", opts = {} },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = false },
    },
  },

  { "buoto/gotests.nvim", ft = "go" },

  -- UI enhancements
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {},
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "configs.lualine"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.bufferline"
    end,
  },

  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.alpha"
    end,
  },

  { "nvim-tree/nvim-web-devicons", opts = {} },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },

  { "nvimdev/lspsaga.nvim", event = "LspAttach", opts = {} },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup()
    end,
  },

  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen" } },

  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup()
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {},
    dependencies = { "folke/twilight.nvim" },
  },

  { "folke/twilight.nvim", cmd = "Twilight" },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    opts = {},
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "ui-select"
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
