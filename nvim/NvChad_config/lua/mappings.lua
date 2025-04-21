require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<F8>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree panel" })
