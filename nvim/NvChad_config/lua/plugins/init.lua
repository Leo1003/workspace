return {
  {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    event = 'BufWritePre',
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

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
}
