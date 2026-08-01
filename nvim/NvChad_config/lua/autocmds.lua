require "nvchad.autocmds"

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = "Auto restore to last position",
  group = vim.api.nvim_create_augroup("auto-last-position", { clear = true }),
  pattern = "*",
  callback = function()
    local ignored_fts = {
      'gitcommit',
      'gitrebase',
      'xxd',
    }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(ignored_fts, vim.bo[buf].filetype) then
      return
    end

    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local line_count = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end
})
