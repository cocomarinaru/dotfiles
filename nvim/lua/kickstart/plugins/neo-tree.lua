-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

-- `\` opens the tree (revealing the current file) and closes it when it is already open.
vim.keymap.set('n', '\\', '<Cmd>Neotree toggle reveal<CR>', { desc = 'NeoTree toggle', silent = true })

require('neo-tree').setup {
  filesystem = {
    -- Never open the tree automatically. By default neo-tree takes over when
    -- Neovim is started on a directory (e.g. `nvim .`); this keeps it closed
    -- until you press `\`.
    hijack_netrw_behavior = 'disabled',
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
