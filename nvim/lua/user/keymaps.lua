vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Reload all buffers
vim.keymap.set('n', '<Leader>rr', ':bufdo! e<CR>')

-- Unset last search pattern register by hitting return
vim.keymap.set('n', '<CR>', ':noh<CR><CR>')

-- Navigate splits using Ctrl-move keys
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Move text up and down
vim.keymap.set('i', '<A-j>', '<ESC>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<ESC>:move .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', ':move .+1<CR>')
vim.keymap.set('v', '<A-k>', ':move .-2<CR>')

-- Center cursor after scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
