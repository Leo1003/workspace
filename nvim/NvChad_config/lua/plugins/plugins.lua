
---@type LazyPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Personal install plugins
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPre",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    config = true,
  },
  {
    "Wansmer/treesj",
    keys = {
      { '<space>m', desc = "Split or Join code block with autodetect" },
      { '<space>j', desc = "Join code block" },
      { '<space>s', desc = "Split code block" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      max_join_length = 120,
    },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
  },
  {
    "Saecki/crates.nvim",
    event = {"BufReadPre Cargo.toml"},
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
      },
    },
    config = function(_, opts)
      require("crates").setup(opts)

      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer({ sources = { { name = "crates" } } })
        end,
      })
    end,
    opts = {},
  },

  -- override plugin configs
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvim_tree"),
  },

  {
    "williamboman/mason.nvim",
    opts = require("configs.mason"),
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.treesitter"),
  },
}

return plugins
