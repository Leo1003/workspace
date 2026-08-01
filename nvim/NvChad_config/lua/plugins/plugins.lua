---@type LazyPluginSpec[]
local plugins = {
  -- Personal install plugins
  {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPre',
    opts = {
      auto_cmd = true,
      override_editorconfig = false,
      filetype_exclude = {
      },
      buftype_exclude = {
        "help",
        "nofile",
        "terminal",
        "prompt",
      },
      on_tab_options = {
        ["expandtab"] = false,
      },
      on_space_options = {
        ["expandtab"] = true,
        ["tabstop"] = "detected",
        ["softtabstop"] = "detected",
        ["shiftwidth"] = "detected",
      },
    },
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
      { "<space>m", desc = "Split or Join code block with autodetect" },
      { "<space>j", desc = "Join code block" },
      { "<space>s", desc = "Split code block" },
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
    event = { "BufReadPre Cargo.toml" },
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
          require("cmp").setup.buffer { sources = { { name = "crates" } } }
        end,
      })
    end,
    opts = {
      completion = {
        cmp = {
          enabled = true,
        }
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
      popup = {
        autofocus = true,
        border = "single",
      },
    },
  },
}

return plugins
