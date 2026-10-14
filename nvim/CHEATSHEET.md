# Neovim cheat sheet

Leader key is **Space**. Press Space and pause to let which-key show every option.

Config layout:

| File | Contents |
|---|---|
| `init.lua` | Options, core keymaps, plugin manager, UI, Telescope, LSP, formatting, completion, treesitter |
| `lua/kickstart/plugins/*.lua` | gitsigns keymaps, neo-tree, autopairs, indent guides |
| `lua/custom/plugins/navigation.lua` | harpoon, mini.files, yazi.nvim, flash.nvim |
| `lua/custom/plugins/git.lua` | lazygit.nvim |

Useful commands: `:Mason` (installed tools), `:checkhealth`, `:lua vim.pack.update()` (update plugins).

---

## Finding and moving

### telescope.nvim
Fuzzy finder for files, text, help and LSP results.

| Key | Action |
|---|---|
| `Space s f` | Find files |
| `Space s g` | Live grep in project |
| `Space s w` | Grep word under cursor |
| `Space Space` | Open buffers |
| `Space /` | Fuzzy search in current buffer |
| `Space s r` | Resume last search |
| `Space s h` | Search help |
| `Space s k` | Search keymaps |
| `Space s n` | Search Neovim config files |

### harpoon
Bookmark the handful of files you are actively working on. Saved per project.

| Key | Action |
|---|---|
| `Space a` | Add current file |
| `Space e` | Open editable list (delete a line to remove) |
| `Space 1` … `Space 4` | Jump to slot 1 to 4 |
| `Space n` / `Space p` | Next / previous file in list |

### flash.nvim
Jump anywhere on screen with labels.

| Key | Action |
|---|---|
| `s` + 1–2 chars + label | Jump to match |
| `S` | Select a syntax node (expression, block, JSX element) |
| `f` / `t` | Enhanced: labels every match on the line |
| `Ctrl+s` (while typing `/`) | Toggle labels in search |

### mini.files
Column-style directory browser you edit like text.

| Key | Action |
|---|---|
| `-` | Open at current file |
| `Enter` | Open file / enter folder |
| `-` (inside) | Go up one level |
| `=` | Apply renames, deletes, creations to disk |
| `q` | Close |

### yazi.nvim
The yazi terminal file manager in a floating window.

| Key | Action |
|---|---|
| `Space y` | Open at current file |
| `Space Y` | Open at working directory |
| `F1` (inside) | Help |

### neo-tree.nvim
Classic sidebar tree. Closed by default.

| Key | Action |
|---|---|
| `\` | Toggle tree |

---

## Git

### gitsigns.nvim
Change markers in the gutter and hunk operations. A hunk is one block of changed lines.

| Key | Action |
|---|---|
| `]c` / `[c` | Next / previous hunk |
| `Space h s` | Stage hunk |
| `Space h r` | Reset hunk |
| `Space h p` | Preview hunk |
| `Space h b` | Blame current line |
| `Space h d` | Diff file against index |
| `Space t b` | Toggle inline blame |

### lazygit.nvim
Full git terminal UI in a floating window.

| Key | Action |
|---|---|
| `Space g g` | Open lazygit |
| `Space g f` | History of current file |
| `Space g l` | Commit log |
| `q` (inside) | Quit back to Neovim |

---

## Code intelligence

### LSP (nvim-lspconfig, mason.nvim, mason-lspconfig, mason-tool-installer)
Language servers, installed automatically by Mason:
`lua_ls`, `jdtls` (Java), `ts_ls` (TypeScript), `eslint`, `jsonls`, `yamlls`, `dockerls`.

| Key | Action |
|---|---|
| `grd` | Go to definition |
| `grr` | References |
| `gri` | Implementation |
| `grt` | Type definition |
| `grn` | Rename |
| `gra` | Code action |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `K` | Hover documentation |
| `Ctrl+t` | Jump back after go-to |
| `]d` / `[d` | Next / previous diagnostic |
| `Space q` | Diagnostics list |
| `Space t h` | Toggle inlay hints |

### blink.cmp + LuaSnip
Autocompletion and snippets.

| Key | Action |
|---|---|
| `Ctrl+y` | Accept completion |
| `Ctrl+n` / `Ctrl+p` | Next / previous item |
| `Ctrl+space` | Open menu, or docs if open |
| `Ctrl+e` | Close menu |
| `Tab` / `Shift+Tab` | Move between snippet fields |

### conform.nvim
Formatting. stylua for Lua, prettier for JS, TS, TSX, JSON. Format-on-save is on for JS and TS files.

| Key | Action |
|---|---|
| `Space f` | Format buffer |

### fidget.nvim, nvim-treesitter
LSP progress widget; syntax highlighting and indentation. No keys.

---

## Editing helpers

### mini.ai
Better text objects.

| Key | Action |
|---|---|
| `viq` | Select inside any quote |
| `va)` | Select around parentheses |
| `aa` / `ii` | Around / inside the *next* object |

### mini.surround
Add, delete, replace brackets and quotes. Prefix is `gs`.

| Key | Action |
|---|---|
| `gsaiw"` | Add: wrap word in quotes |
| `gsd"` | Delete surrounding quotes |
| `gsr)]` | Replace `()` with `[]` |

### No-key plugins
- **nvim-autopairs**: auto-closes brackets and quotes
- **guess-indent.nvim**: detects file indentation
- **indent-blankline.nvim**: vertical indent guides
- **todo-comments.nvim**: highlights TODO, NOTE, FIXME

---

## Appearance and help

- **tokyonight.nvim**: colorscheme, night variant
- **mini.statusline**, **mini.icons**: status bar and icons
- **which-key.nvim**: shows available keys after a prefix

---

## Built-in keys worth remembering

| Key | Action |
|---|---|
| `Ctrl+h/j/k/l` | Move between splits |
| `Esc` | Clear search highlight |
| `Esc Esc` (terminal) | Leave terminal mode |
| `cl` | Substitute character (replaces the old `s`) |
