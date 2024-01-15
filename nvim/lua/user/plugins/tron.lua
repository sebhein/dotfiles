local tron = require('tron')

vim.keymap.set('n', '<leader>tt', tron.run_test, {})
vim.keymap.set('n', '<leader>ts', tron.show_output, {})
vim.keymap.set('n', '<leader>tc', tron.clear_signs, {})
