local actions, builtin = require("telescope.actions"), require('telescope.builtin')
require("telescope").setup {
  pickers = {
    buffers = {
      mappings = {
        n = {
          ["d"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  }
}

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
