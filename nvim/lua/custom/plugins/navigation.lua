-- Navigation plugins: harpoon (working-set bookmarks), mini.files (directory
-- buffer), flash.nvim (jump labels).
--
-- Telescope (<leader>sf) remains the main way to find a file by name.

-- [[ harpoon ]] https://github.com/ThePrimeagen/harpoon (harpoon2 branch)
-- Mark a handful of files per project and jump to them with one key each.
vim.pack.add { { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' } }

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Harpoon: [A]dd current file' })
vim.keymap.set('n', '<leader>e', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: toggle m[E]nu' })
for i = 1, 4 do
  vim.keymap.set('n', '<leader>' .. i, function() harpoon:list():select(i) end, { desc = 'Harpoon: go to file ' .. i })
end
vim.keymap.set('n', '<leader>n', function() harpoon:list():next() end, { desc = 'Harpoon: [N]ext file' })
vim.keymap.set('n', '<leader>p', function() harpoon:list():prev() end, { desc = 'Harpoon: [P]revious file' })

-- [[ mini.files ]] part of mini.nvim, already installed in init.lua
-- Miller-column file browser. Edit the buffer (rename, delete, create lines)
-- then press `=` to apply the changes to disk. `-` goes up, `<CR>` enters/opens.
require('mini.files').setup {
  windows = {
    preview = true,
    width_preview = 60,
  },
}

vim.keymap.set('n', '-', function()
  -- Open at the current file when the buffer is a real file, otherwise at cwd
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
  MiniFiles.open(path)
end, { desc = 'Open mini.files at current file' })

-- [[ flash.nvim ]] https://github.com/folke/flash.nvim
-- Jump anywhere on screen: press `s`, type 1-2 characters, press the label
-- that appears next to the match. Also labels `f`/`t` targets and `/` search
-- results. mini.surround was moved to the `gs` prefix in init.lua to free `s`.
vim.pack.add { { src = 'https://github.com/folke/flash.nvim', version = vim.version.range '*' } }

local flash = require 'flash'
flash.setup {
  modes = {
    -- Label results of a normal `/` search as well. Set to false if you prefer
    -- plain search behaviour; <C-s> toggles it while typing a search.
    search = { enabled = true },
    -- Enhance `f`, `F`, `t`, `T` with labels for every match on the line
    char = { enabled = true },
  },
}

vim.keymap.set({ 'n', 'x', 'o' }, 's', flash.jump, { desc = 'Flash jump' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', flash.treesitter, { desc = 'Flash treesitter select' })
vim.keymap.set('o', 'r', flash.remote, { desc = 'Flash remote operation' })
vim.keymap.set({ 'o', 'x' }, 'R', flash.treesitter_search, { desc = 'Flash treesitter search' })
vim.keymap.set('c', '<C-s>', flash.toggle, { desc = 'Toggle flash labels in search' })
