vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  group = vim.api.nvim_create_augroup('auto-checktime', { clear = true }),
  desc = 'Auto check for file changes when entering Neovim or switching buffers',
  callback = function()
    vim.cmd 'checktime'
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'FocusLost' }, {
  group = vim.api.nvim_create_augroup('auto-save', { clear = true }),
  desc = 'Auto save buffer when leaving window or switching tmux panes',
  callback = function()
    if vim.bo.modified and vim.bo.buftype == '' and vim.fn.expand '%' ~= '' then
      vim.cmd 'silent! write'
    end
  end,
})
