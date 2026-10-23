# Neovim cheat sheet

Leader key is **Space**. Press Space and pause to let which-key show every option.

Config layout:

| File | Contents |
|---|---|
| `init.lua` | Options, core keymaps, plugin manager, UI, Telescope, LSP, formatting, completion, treesitter |
| `lua/kickstart/plugins/*.lua` | gitsigns keymaps, autopairs, indent guides |
| `lua/custom/plugins/navigation.lua` | harpoon, mini.files, flash.nvim |
| `lua/custom/plugins/git.lua` | lazygit.nvim |
| `lua/custom/plugins/java.lua` | nvim-jdtls, nvim-dap, nvim-dap-ui, debug keymaps |
| `ftplugin/java.lua` | Starts jdtls per Java buffer (Lombok, tests, debugger), Java keymaps |

Useful commands: `:Mason` (installed tools), `:checkhealth`, `:checkhealth vim.lsp` (attached servers), `:lua vim.pack.update()` (update plugins).

---

## Finding and moving

### telescope.nvim
Fuzzy finder for files, text, help and LSP results.

| Key | Action |
|---|---|
| `Space s f` | Find files |
| `Space s g` | Live grep in project |
| `Space s w` | Grep word under cursor |
| `Space s /` | Live grep in open files only |
| `Space Space` | Open buffers |
| `Space /` | Fuzzy search in current buffer |
| `Space s r` | Resume last search |
| `Space s .` | Recent files |
| `Space s d` | Diagnostics of whole project |
| `Space s h` | Search help |
| `Space s k` | Search keymaps |
| `Space s c` | Search commands |
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
| `S` | Select a syntax node (expression, block, method) |
| `f` / `t` | Enhanced: labels every match on the line |
| `Ctrl+s` (while typing `/`) | Toggle labels in search |

### mini.files
Column-style directory browser you edit like text. Changes hit disk only after `=`.

| Key | Action |
|---|---|
| `-` | Open at current file |
| `Enter` / `l` | Open file / enter folder |
| `-` / `h` (inside) | Go up one level |
| `o` + name | Create file; end with `/` for a folder |
| edit line | Rename |
| `dd` / `p` | Cut / paste (move) |
| `yy` / `p` | Copy / paste |
| `=` | Apply pending changes to disk |
| `q` | Close |
| `g?` | Show all keys |

---

## Git

### gitsigns.nvim
Change markers in the gutter and hunk operations. A hunk is one block of changed lines.

| Key | Action |
|---|---|
| `]c` / `[c` | Next / previous hunk |
| `Space h s` | Stage hunk |
| `Space h r` | Reset hunk |
| `Space h S` / `Space h R` | Stage / reset whole buffer |
| `Space h p` | Preview hunk |
| `Space h i` | Preview hunk inline |
| `Space h b` | Blame current line |
| `Space h d` | Diff file against index |
| `Space h D` | Diff file against last commit |
| `Space h q` / `Space h Q` | Hunks of file / repo into quickfix |
| `Space t b` | Toggle inline blame |
| `Space t w` | Toggle word diff |
| `ih` | Text object: select hunk |

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
Language servers, installed by Mason:
`lua_ls`, `ts_ls` (TypeScript), `eslint`, `jsonls`, `yamlls`, `dockerls`.
`jdtls` (Java) is also installed by Mason but started by nvim-jdtls, see Java below.

| Key | Action |
|---|---|
| `K` | Hover: docs and type of symbol under cursor |
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `grr` | References |
| `gri` | Implementation |
| `grt` | Type definition |
| `grn` | Rename across project |
| `gra` | Code action (normal and visual) |
| `gO` | Symbols in current file |
| `gW` | Symbols across workspace |
| `Ctrl+t` | Jump back after go-to |
| `]d` / `[d` | Next / previous diagnostic, opens message float |
| `Space q` | Diagnostics of current file in a list |
| `Space s d` | Diagnostics of project in Telescope |
| `Space t h` | Toggle inlay hints |
| `Ctrl+s` (insert) | Signature help |

### Java (nvim-jdtls)
Extra Java features on top of LSP. Only in Java buffers. Lombok is loaded, so
generated getters, setters, builders and `@Slf4j` loggers resolve.

| Key | Action |
|---|---|
| `Space j t` | Run test method under cursor |
| `Space j T` | Run all tests in class |
| `Space j o` | Organize imports |
| `Space j v` | Extract variable (normal or visual) |
| `Space j c` | Extract constant (normal or visual) |
| `Space j m` | Extract method (visual) |

Tests run through the debug adapter: the debug UI opens with console output,
a summary appears when done, failures go to the quickfix list (`:copen`).
Breakpoints set before the run are hit.

### Debugger (nvim-dap, nvim-dap-ui)
Works in any language with an adapter; Java is configured.
For Quarkus: run `./mvnw quarkus:dev`, then `Space d c` and pick "Attach to Quarkus dev (port 5005)".

| Key | Action |
|---|---|
| `Space d b` | Toggle breakpoint |
| `Space d B` | Breakpoint with condition |
| `Space d c` | Start / continue (asks which config the first time) |
| `Space d i` | Step into |
| `Space d o` | Step over |
| `Space d O` | Step out |
| `Space d q` | Quit session |
| `Space d u` | Toggle UI panels |
| `Space d r` | Toggle REPL (evaluate expressions) |

### blink.cmp + LuaSnip
Autocompletion and snippets.

| Key | Action |
|---|---|
| `Ctrl+y` | Accept completion (auto-imports) |
| `Ctrl+n` / `Ctrl+p` | Next / previous item |
| `Ctrl+space` | Open menu, or docs if open |
| `Ctrl+e` | Close menu |
| `Ctrl+k` | Toggle signature help |
| `Tab` / `Shift+Tab` | Move between snippet fields |

### conform.nvim
Formatting on demand only. stylua for Lua, prettier for JS, TS, TSX, JSON, the language server otherwise.

| Key | Action |
|---|---|
| `Space f` | Format whole file |
| `Space f` (visual) | Format selected lines only |

### fidget.nvim, nvim-treesitter
LSP progress widget; syntax highlighting, indentation and folds. Folds are open when a file opens.

| Key | Action |
|---|---|
| `za` | Toggle fold under cursor |
| `zM` / `zR` | Close / open all folds |
| `zc` / `zo` | Close / open one level |

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
