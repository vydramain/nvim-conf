# Neovim C++ IDE Configuration

This repository provides a modular Neovim configuration optimized for C++ development, delivering an IDE-like experience similar to CLion.

---

## Features

- **LSP** with `clangd` for code completion, navigation, and diagnostics  
- **Autocompletion** with `nvim-cmp` and snippet support (`LuaSnip`)  
- **Syntax highlighting & indentation** powered by Treesitter  
- **File explorer** via `nvim-tree`  
- **Fuzzy search** using `telescope.nvim`  
- **Git integration** through `gitsigns.nvim`  
- **Formatting on save** via `clang-format` with `conform.nvim`  
- **Debugging** support with `nvim-dap` and `nvim-dap-ui` (GDB backend)  

---

## Plugins Used (17 total)

| Plugin                              | Purpose                       |
|-------------------------------------|-------------------------------|
| `nvim-lualine/lualine.nvim`         | Statusline UI                 |
| `nvim-tree/nvim-tree.lua`           | File explorer                 |
| `nvim-telescope/telescope.nvim`     | Fuzzy finder                  |
| `nvim-lua/plenary.nvim`             | Telescope dependency          |
| `hrsh7th/nvim-cmp`                  | Completion engine             |
| `hrsh7th/cmp-nvim-lsp`              | LSP completion source         |
| `L3MON4D3/LuaSnip`                  | Snippet engine                |
| `saadparwaiz1/cmp_luasnip`          | Snippet completion source     |
| `nvim-treesitter/nvim-treesitter`   | Syntax highlighting           |
| `lewis6991/gitsigns.nvim`           | Git integration               |
| `williamboman/mason.nvim`           | LSP/DAP installer             |
| `williamboman/mason-lspconfig.nvim` | Mason extension for LSP       |
| `neovim/nvim-lspconfig`             | LSP configurations            |
| `mfussenegger/nvim-dap`             | Debug Adapter Protocol client |
| `nvim-neotest/nvim-nio`             | Dependency for dap-ui         |
| `rcarriga/nvim-dap-ui`              | Debugger UI                   |
| `stevearc/conform.nvim`             | Formatter wrapper             |

---

## Prerequisites

Make sure the following packages are installed on your Arch Linux system:

| Package                                                                | Purpose                     | Installation Command     | More Info                                |
|------------------------------------------------------------------------|-----------------------------|--------------------------|------------------------------------------|
| [neovim](https://archlinux.org/packages/community/x86_64/neovim/)      | Text editor                 | `sudo pacman -S neovim`  | [Neovim](https://neovim.io/)             |
| [clang](https://archlinux.org/packages/extra/x86_64/clang/)            | Compiler & `clangd` LSP     | `sudo pacman -S clang`   | [Clang](https://clang.llvm.org/)         |
| [gdb](https://archlinux.org/packages/extra/x86_64/gdb/)                | Debugger                    | `sudo pacman -S gdb`     | [GDB](https://www.gnu.org/software/gdb/) |
| [git](https://archlinux.org/packages/core/x86_64/git/)                 | Version control             | `sudo pacman -S git`     | [Git](https://git-scm.com/)              |

*Note:* `clang-format` is included with `clang` on Arch Linux.

---

## Installation

1. **Clone this repository** as your Neovim configuration:

```bash
git clone <your-repo-url> ~/.config/nvim
```

2. **Open Neovim**:

```bash
nvim
```

3. **Install plugins** with Lazy.nvim:

```vim
:Lazy sync
```

4. **Install `clangd` and other tools via Mason** inside Neovim (optional if not using system `clangd`):

```vim
:MasonInstall clangd
```

---

## Project Setup

- To enable accurate LSP features, generate a `compile_commands.json` file in your project root:

```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON <your-source-directory>
```

This improves autocompletion, diagnostics, and navigation.

---

## Keybindings

| Keybinding     | Action                              |
|----------------|-------------------------------------|
| `<leader>e`    | Toggle file explorer (`nvim-tree`)  |
| `<leader>ff`   | Find files (Telescope)              |
| `<leader>fg`   | Live grep search (Telescope)        |
| `gd`           | Go to definition                    |
| `gr`           | List references                     |
| `K`            | Show hover documentation            |
| `<leader>rn`   | Rename symbol                       |
| `F5`           | Start/continue debugging            |
| `F10`          | Step over                           |
| `F11`          | Step into                           |
| `F12`          | Step out                            |

## Debugging

- Uses GDB backend via `nvim-dap`.  
- UI enhancements provided by `nvim-dap-ui`.  
- GDB is required (`sudo pacman -S gdb`).  
- Optionally use Microsoft’s `OpenDebugAD7` debugger from [vscode-cpptools](https://github.com/microsoft/vscode-cpptools).

---

## Troubleshooting

- If you encounter errors about missing `nvim-nio`, ensure the plugin `nvim-neotest/nvim-nio` is installed.  
- Avoid naming config files the same as plugins (e.g., rename `cmp.lua` to `cmp_config.lua`).  
- Verify `clang-format` and `clangd` executables are available.  
- Generate or update `compile_commands.json` to improve LSP accuracy.

---

## Customization

- Add your own keymaps in `lua/keymaps.lua`.  
- Extend or tweak LSP configs in `lua/config/lsp_config.lua`.  
- Modify plugin list or settings in `lua/plugins/init.lua`.

---

Happy coding with your Neovim-powered C++ IDE!
