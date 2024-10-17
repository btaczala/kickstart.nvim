return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
    'echasnovski/mini.pick', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    local diffview = require 'diffview'
    neogit.setup {
      mappings = {
        status = {
          ['l'] = 'MoveUp',
          ['k'] = 'MoveDown',
        },
      },
    }
    local actions = require 'diffview.actions'
    diffview.setup {
      keymaps = {
        rebase_editor = {
          ['p'] = false,
          ['r'] = false,
          ['e'] = false,
          ['s'] = false,
          ['f'] = false,
          ['x'] = false,
          ['d'] = false,
          ['b'] = false,
          ['q'] = false,
          ['<cr>'] = 'OpenCommit',
          ['gl'] = 'MoveUp',
          ['gk'] = 'MoveDown',
          ['<c-c><c-c>'] = 'Submit',
          ['<c-c><c-k>'] = 'Abort',
          ['[c'] = 'OpenOrScrollUp',
          [']c'] = 'OpenOrScrollDown',
        },
        file_history_panel = {
          { 'n', 'j', actions.close_fold, { desc = 'Collapse fold' } },
          { 'n', 'k', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
          { 'n', 'l', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
          { 'n', ';', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
        },
        file_panel = {
          { 'n', 'k', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
          { 'n', '<down>', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
          { 'n', 'l', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
          { 'n', '<up>', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
          { 'n', '<cr>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', 'o', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', ';', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', '<2-LeftMouse>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', 'j', actions.close_fold, { desc = 'Collapse fold' } },
          { 'n', 'zc', actions.close_fold, { desc = 'Collapse fold' } },
        },
      },
    }
    vim.keymap.set('n', '<leader>g', '<cmd>Neogit<cr>', { desc = 'Neo[g]it' })
  end,
}
