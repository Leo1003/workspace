require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "ansiblels",
  "rust_analyzer",
}
vim.lsp.enable(servers)
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        features = "all",
      },
      check = {
        command = "clippy",
      },
    },
  },
})
