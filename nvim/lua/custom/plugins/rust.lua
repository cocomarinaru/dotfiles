-- Rust tooling: rustaceanvim (rust-analyzer client, :RustLsp commands, codelldb
-- debug glue for nvim-dap) and crates.nvim (dependency versions in Cargo.toml).
-- nvim-dap and dap-ui are installed and configured in java.lua.
-- rustaceanvim replaces lspconfig's rust_analyzer entry; do not enable both.

-- rustaceanvim has no setup(); it reads this global when it loads.
vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ['rust-analyzer'] = {
        check = { command = 'clippy' }, -- run clippy instead of cargo check on save
      },
    },
  },
}

vim.pack.add {
  { src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range '^9' },
  { src = 'https://github.com/saecki/crates.nvim', version = vim.version.range '^0.7' },
}

-- Its in-process language server provides completion, hover and code actions
-- through the normal LSP path, so blink.cmp needs no extra source.
require('crates').setup {
  lsp = { enabled = true, actions = true, completion = true, hover = true },
}

local function rust_lsp(cmd)
  return function() vim.cmd.RustLsp(cmd) end
end

vim.keymap.set('n', '<leader>rr', rust_lsp 'runnables', { desc = 'Rust: [R]unnables' })
vim.keymap.set('n', '<leader>rt', rust_lsp 'testables', { desc = 'Rust: [T]estables' })
vim.keymap.set('n', '<leader>rd', rust_lsp 'debuggables', { desc = 'Rust: [D]ebuggables' })
vim.keymap.set('n', '<leader>re', rust_lsp 'explainError', { desc = 'Rust: [E]xplain error' })
vim.keymap.set('n', '<leader>rm', rust_lsp 'expandMacro', { desc = 'Rust: expand [M]acro' })
vim.keymap.set('n', '<leader>rc', rust_lsp 'openCargo', { desc = 'Rust: open [C]argo.toml' })

-- Cargo.toml only: crates.nvim popups and upgrades
vim.api.nvim_create_autocmd('BufRead', {
  group = vim.api.nvim_create_augroup('crates_keymaps', { clear = true }),
  pattern = 'Cargo.toml',
  callback = function(ev)
    local crates = require 'crates'
    vim.keymap.set('n', '<leader>rv', crates.show_versions_popup, { buffer = ev.buf, desc = 'Rust: crate [V]ersions' })
    vim.keymap.set('n', '<leader>rf', crates.show_features_popup, { buffer = ev.buf, desc = 'Rust: crate [F]eatures' })
    vim.keymap.set('n', '<leader>ru', crates.upgrade_crate, { buffer = ev.buf, desc = 'Rust: [U]pgrade crate' })
  end,
})
