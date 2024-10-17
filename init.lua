-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
require 'options'

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`

require 'lazy-bootstrap'
require 'plugins'
require 'keymaps'

vim.api.nvim_create_augroup('CppFiles', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.h', '*.hpp', '*.cpp', '*.cxx', 'CMakeLists.txt', '*.qml' },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>jj', '<cmd>CMakeBuild<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ja', '<cmd>CMakeBuild<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>jc', '<cmd>CMakeGenerate<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>jr', '<cmd>CMakeRun<CR>', { noremap = true, silent = true })
  end,
  group = 'CppFiles',
})
