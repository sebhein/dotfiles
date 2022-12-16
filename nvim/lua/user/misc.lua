local test_current_file = function ()
  local args = vim.fn.input('pytest args? ')
  vim.cmd('botright vsplit')
  vim.cmd('vertical resize 120')
  if #args > 0 then
    vim.cmd('exe "term ' .. vim.env.REPO .. ' % -- "' .. args)
  else
    vim.cmd('exe "term ' .. vim.env.REPO .. ' %')
  end
end

vim.keymap.set('n', '<Leader>tt', test_current_file)
