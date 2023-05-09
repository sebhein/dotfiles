local test_current_file = function ()
  local args = vim.fn.input('pytest args? ')
  vim.cmd('botright vsplit')
  vim.cmd('vertical resize 120')
  if #args > 0 then
    vim.cmd('exe "term pants test % -- ' .. args .. '"')
  else
    vim.cmd('exe "term pants test %"')
  end
end

vim.keymap.set('n', '<Leader>tt', test_current_file, {})

-- prevent `wq` and `q` typos
vim.cmd([[
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
  cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
  cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]])
