-- Git plugins beyond gitsigns (which lives in lua/kickstart/plugins/gitsigns.lua).

-- [[ lazygit.nvim ]] https://github.com/kdheepak/lazygit.nvim
-- Opens the `lazygit` terminal UI (installed via Homebrew) in a floating window.
-- Requires the `lazygit` binary on PATH. Quit lazygit with `q` to return to Neovim.
-- Pressing `e` on a file inside lazygit opens it in this Neovim instance rather
-- than a nested one; the plugin sets the required environment variables.
vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim', -- already installed; listed for completeness
  'https://github.com/kdheepak/lazygit.nvim',
}

-- Plugin is configured through global variables, it has no setup() function.
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- fraction of the editor the float occupies
vim.g.lazygit_floating_window_use_plenary = 0 -- use the plugin's own float (plenary's has no border)
vim.g.lazygit_use_neovim_remote = 0 -- not needed; the plugin handles opening files in this instance

vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[G]it' })
vim.keymap.set('n', '<leader>gf', '<Cmd>LazyGitFilterCurrentFile<CR>', { desc = 'LazyGit: current [F]ile history' })
vim.keymap.set('n', '<leader>gl', '<Cmd>LazyGitFilter<CR>', { desc = 'LazyGit: commit [L]og' })
