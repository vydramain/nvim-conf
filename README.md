# nvim-conf
My personal nvim configuration for quick start on another machine:
How to setup NeoVim for React and Typescript development:

## Descripions:
Files from this repository are keeping in the `~/.config/nvim` catalog.

## Prerequisites:
- [Git](https://git-scm.com/) (vim plug use git to clone vim/nvim plugins to the local computer)
- [CMake](https://cmake.org/)
- [Clang](https://clang.llvm.org/)
- [Neovim](https://neovim.io/)
- [Node](https://nodejs.org/en/) (coc extension require a javascript runtime to do the job)
- [Yarn](https://yarnpkg.com/) (coc nvim using yarn to install packages)
- [Python Package Index(PyPI)](https://developer.fedoraproject.org/tech/languages/python/pypi-installation.html)

## Usages:
 - [Coc](https://github.com/neoclide/coc.nvim)
 - [Vim-TSX](https://github.com/ianks/vim-tsx)
 - [TypeScript-Vim](https://github.com/leafgarland/typescript-vim)
 - [Minimalist](https://github.com/dikiaap/minimalist)
 - [NERDTree](https://github.com/scrooloose/nerdtree)
 - [Vim-fswitch](https://github.com/derekwyatt/vim-fswitch)
 - [Vista.vim](https://github.com/liuchengxu/vista.vim)
 - [Vimspector](https://github.com/puremourning/vimspector)
 - [Vimtex](https://github.com/lervag/vimtex)
 - [UltiSnips](https://github.com/sirver/ultisnips)
 - [Vim-Snippets](https://github.com/honza/vim-snippets)
 - [Cppman](https://github.com/aitjcize/cppman)
 - [Vim-Cpp-Modern](https://github.com/bfrg/vim-cpp-modern)
 - [Markdown-Preview](https://github.com/iamcco/markdown-preview.nvim)

## For start

#### NeoVim Plugin Manager:

- Download [vim-plug](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) file.
- Place the plugin inside autoload folder: `/home/<user_folder>/.config/nvim/autoload/plug.vim`

#### Required plugins:

The following content is `init.vim` temp-file content. The description is in the comment. Highly recommend to read the wiki in [GitHub](https://github.com/neovim/neovim/wiki/Configuration) (For downloading s1n7ax's [complete configuration](https://github.com/s1n7ax/dotvim))

#### Install dependencies

Before install plugins and start to use them intall dependencies.

For Fedora:

```console
$ sudo dnf isntall python-neovim
```

#### How to debug note:

For each project we need to create vimspector.json which contains information about how to start a debugger session. This file is pretty simple, and you will usually just copy it between your projects with minimal changes. Here is an example content:

```json
{
  "configurations": {
    "Launch": {
      "adapter": "vscode-cpptools",
      "configuration": {
        "request": "launch",
        "program": "${gadgetDir}/vscode-cpptools/debugAdapters/bin/OpenDebugAD7",
        "externalConsole": true
      }
    }
  }
}
```

---

Inspirated by:
 - [Vim Cheat Sheet](https://vim.rtorr.com/)
 - [Vim Awesome](https://vimawesome.com/)
 - [NeoVim for Typescript + React Development](https://medium.com/@s1n7ax/neovim-for-typescript-react-development-fdc7082c8a78) by s1n7ax
 - [Using (neo)vim for C++ development](https://idie.ru/posts/vim-modern-cpp/) by idie
 - [How I'm able to take notes in mathematics lectures using LaTeX and Vim](https://castel.dev/post/lecture-notes-1/)
