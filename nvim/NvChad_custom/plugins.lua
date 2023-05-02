local mason = require("custom.options.mason")
local treesitter = require("custom.options.treesitter")
local nvim_tree = require("custom.options.nvim_tree")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Personal install plugins
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

  -- override plugin configs
  {
    "nvim-tree/nvim-tree.lua",
    opts = nvim_tree,
  },

  {
    "williamboman/mason.nvim",
    opts = mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = treesitter,
  },
}

return plugins
