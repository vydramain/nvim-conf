# Neovim Config

Personal Neovim configuration for TypeScript/Node.js and C++ development.
Built on [lazy.nvim](https://github.com/folke/lazy.nvim) with a modular structure.

---

## Features

- **TypeScript / Node.js** — typescript-tools with organize imports, add missing imports, rename file with import updates, inlay hints
- **C++** — clangd LSP with clang-tidy, codelldb debugger (auto-installed)
- **Autocompletion** — nvim-cmp with LSP, snippets (LuaSnip + friendly-snippets), path and buffer sources
- **Syntax highlighting** — Treesitter for TS/JS/TSX/C++/HTML/CSS and more
- **File explorer** — neo-tree (VSCode-like sidebar)
- **Fuzzy search** — Telescope with fzf-native backend
- **Git UI** — gitsigns, Neogit (rebase, commit, branch), Diffview (diff review, file history)
- **Debugging** — nvim-dap with DAP UI (auto-opens on session start)
- **Formatting on save** — conform.nvim (prettier for TS/JS, clang-format for C++)
- **Linting** — nvim-lint (eslint_d for TS/JS)
- **Theme** — Catppuccin Mocha

---

## Prerequisites

Install the following before deploying the config.

### Required

| Tool | Purpose | Arch Linux | Ubuntu/Debian |
|------|---------|------------|---------------|
| `neovim >= 0.10` | Editor | `sudo pacman -S neovim` | [AppImage or PPA](https://github.com/neovim/neovim/releases) |
| `git` | Plugin bootstrap & Neogit | `sudo pacman -S git` | `sudo apt install git` |
| `make` | Build telescope-fzf-native | `sudo pacman -S make` | `sudo apt install make` |
| `gcc` / `clang` | Build some plugins + clangd | `sudo pacman -S clang` | `sudo apt install clang` |
| `ripgrep` | Telescope live grep | `sudo pacman -S ripgrep` | `sudo apt install ripgrep` |
| `node` + `npm` | TypeScript LSP, eslint_d | `sudo pacman -S nodejs npm` | `sudo apt install nodejs npm` |

### Recommended (installed automatically by Mason on first launch)

Mason will auto-install LSP servers and tools into `~/.local/share/nvim/mason/`.
No manual steps needed; the list is for reference only.

| Tool | Purpose |
|------|---------|
| `clangd` | C++ LSP |
| `ts_ls` | TypeScript/JavaScript LSP |
| `eslint` | JS/TS linting via LSP |
| `cssls` | CSS LSP |
| `html` | HTML LSP |
| `jsonls` | JSON LSP |
| `lua_ls` | Lua LSP (for editing this config) |
| `codelldb` | C/C++ debugger (LLDB) |
| `prettier` | TS/JS/CSS/HTML formatter |
| `stylua` | Lua formatter |
| `eslint_d` | Fast eslint linter daemon |

---

## Installation

### 1. Back up existing config (if any)

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak   # optional: clears plugin cache
```

### 2. Clone the repository

```bash
git clone https://github.com/vydramain/nvim-config ~/.config/nvim
```

> Replace the URL with your actual repository URL.

### 3. Launch Neovim

```bash
nvim
```

On the first launch lazy.nvim will bootstrap itself, then install all plugins automatically.
This takes 1–3 minutes depending on your connection.

### 4. Install Mason tools

After plugins finish installing, run inside Neovim:

```vim
:MasonInstall clangd ts_ls eslint cssls html jsonls lua_ls codelldb prettier stylua eslint_d
```

Or open the Mason UI and install interactively:

```vim
:Mason
```

### 5. Install Treesitter parsers (optional, auto-installed on file open)

```vim
:TSUpdate
```

### Verification

Check that everything loaded correctly:

```vim
:Lazy        " plugin manager status
:Mason       " LSP / tool status
:LspInfo     " active LSP servers for current buffer
:checkhealth " overall health check
```

---

## C++ Project Setup

For accurate diagnostics and navigation, generate a `compile_commands.json` in your project root.

**CMake:**
```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B build
ln -s build/compile_commands.json compile_commands.json
```

**Bear (any build system):**
```bash
sudo pacman -S bear   # or: sudo apt install bear
bear -- make
```

clangd will pick it up automatically.

---

## Config Structure

```
~/.config/nvim/
├── init.lua                  # bootstrap lazy.nvim, load options + keymaps
├── lua/
│   ├── options.lua           # vim settings
│   ├── keymaps.lua           # global keybindings
│   └── plugins/
│       ├── colorscheme.lua   # Catppuccin Mocha theme
│       ├── ui.lua            # neo-tree, lualine, bufferline, which-key, trouble
│       ├── telescope.lua     # fuzzy finder
│       ├── treesitter.lua    # syntax highlighting + text objects
│       ├── lsp.lua           # mason, LSP, typescript-tools, cmp, lint, format
│       ├── git.lua           # gitsigns, neogit, diffview
│       ├── debug.lua         # nvim-dap + codelldb
│       └── editor.lua        # autopairs, comments, surround, ts-autotag
```

To add a plugin, create a new file in `lua/plugins/` or add a spec to an existing one.
lazy.nvim loads every `.lua` file in that directory automatically.

---

## Keybindings

`<leader>` is `Space`.

### Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between splits |
| `<S-l>` / `<S-h>` | Next / previous buffer |
| `<leader>bd` | Close buffer |
| `<Esc>` | Clear search highlight |

### File Explorer (neo-tree)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `a` (in tree) | Create file / directory |
| `d` (in tree) | Delete |
| `r` (in tree) | Rename |
| `y` (in tree) | Copy |
| `x` (in tree) | Cut |
| `p` (in tree) | Paste |
| `H` (in tree) | Toggle hidden files |
| `?` (in tree) | Show all keymaps |

### Telescope (Fuzzy Search)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search inside files) |
| `<leader>fw` | Grep word under cursor |
| `<leader>fb` | Open buffers |
| `<leader>fr` | Recent files |
| `<leader>fs` | Document symbols |
| `<leader>fd` | Diagnostics |
| `<leader>fh` | Help tags |
| `<C-j>` / `<C-k>` | Move selection (inside Telescope) |
| `<C-q>` | Send selection to quickfix list |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<C-k>` | Signature help (insert mode) |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>D` | Show diagnostics for current line |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>fm` | Format file |

### TypeScript (typescript-tools)

| Key | Action |
|-----|--------|
| `<leader>oi` | Organize imports |
| `<leader>ai` | Add all missing imports |
| `<leader>ru` | Remove unused imports |
| `<leader>rf` | Rename file + update all imports |
| `<leader>fi` | Fix all auto-fixable issues |

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open Neogit (full git UI) |
| `<leader>gd` | Open Diffview (current changes) |
| `<leader>gh` | File history (current file) |
| `<leader>gc` | Close Diffview |
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hR` | Reset entire buffer |
| `<leader>hb` | Full blame for current line |
| `<leader>hd` | Diff this file |
| `<leader>tb` | Toggle inline blame |

#### Neogit workflow

Open with `<leader>gg`. Inside Neogit:

| Key | Action |
|-----|--------|
| `s` | Stage file / hunk |
| `u` | Unstage file / hunk |
| `c` | Open commit panel |
| `l` | Open log / history |
| `b` | Branch operations |
| `r` | Rebase |
| `P` | Push |
| `F` | Pull / fetch |
| `?` | Show all keymaps |
| `q` | Close |

### Debugging (nvim-dap)

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>bp` | Toggle breakpoint |
| `<leader>bP` | Conditional breakpoint |
| `<leader>du` | Toggle DAP UI |
| `<leader>dr` | Open REPL |
| `<leader>dl` | Run last configuration |

The DAP UI opens automatically when a debug session starts and closes when it ends.

For C++, on first debug run you will be prompted for the path to your compiled binary.

### Diagnostics (Trouble)

| Key | Action |
|-----|--------|
| `<leader>xx` | All project diagnostics |
| `<leader>xd` | Current file diagnostics |
| `<leader>xl` | Location list |
| `<leader>xq` | Quickfix list |

### Editor

| Key | Action |
|-----|--------|
| `gcc` | Toggle comment (line) |
| `gc` + motion | Toggle comment (visual / motion) |
| `ys` + motion + char | Add surrounding (e.g. `ysiw"`) |
| `cs` + old + new | Change surrounding (e.g. `cs'"`) |
| `ds` + char | Delete surrounding (e.g. `ds"`) |

### Text Objects (Treesitter)

These work with operators like `d`, `c`, `v`, `y`:

| Object | Selects |
|--------|---------|
| `af` / `if` | outer / inner function |
| `ac` / `ic` | outer / inner class |
| `aa` / `ia` | outer / inner argument |

**Examples:** `daf` — delete entire function; `cif` — change function body; `vac` — select class.

Movement: `]f` / `[f` jump to next/previous function; `]c` / `[c` jump to next/previous class.

---

## Troubleshooting

**Plugins not loading**
Run `:Lazy sync` to re-install. Check `:Lazy` for errors.

**LSP not attaching**
Run `:LspInfo` to see which servers are active. Run `:Mason` to verify tools are installed.
For C++, make sure `compile_commands.json` exists in the project root.

**TypeScript LSP slow or not starting**
typescript-tools requires `node` on your PATH. Verify with `node --version`.

**codelldb not found (C++ debug)**
Run `:MasonInstall codelldb` or open `:Mason` and install it from there.

**Telescope live grep not working**
`ripgrep` must be installed. Verify with `rg --version`.

**fzf-native not built**
`make` must be available. Run `:Lazy build telescope-fzf-native.nvim` to rebuild.

**Formatter not running on save**
Check `:ConformInfo` to see which formatter is configured for the current filetype and whether it is found on PATH.

---

## Updating

Update all plugins:

```vim
:Lazy update
```

Update Mason tools:

```vim
:MasonUpdate
```
