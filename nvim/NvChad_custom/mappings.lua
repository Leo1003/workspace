---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<F8>"] = { ":NvimTreeToggle<CR>", "Toggle NvimTree panel", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
