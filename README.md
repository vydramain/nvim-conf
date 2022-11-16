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

## For start

#### NeoVim Plugin Manager:

- Download [vim-plug](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) file.
- Place the plugin inside autoload folder: `/home/<user_folder>/.config/nvim/autoload/plug.vim`

#### Required plugins:

The following content is `init.vim` temp-file content. The description is in the comment. Highly recommend to read the wiki in [GitHub](https://github.com/neovim/neovim/wiki/Configuration) (For downloading s1n7ax's [complete configuration](https://github.com/s1n7ax/dotvim))

```
" == VIM PLUG ================================
call plug#begin('~/.nvim/plugged')
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'

"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'

call plug#end()  
" == VIMPLUG END ================================
                                                
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================ 
```

I am not only frontend developer. Also I pursue goal about graphics programming. So. As my main tool for developing I should set up `nvim` for it:

#### ccls

With LSP client (the vim plugin) setting up we have to pick an actual language server implementation for C(++). I want to use `[ccls](https://github.com/MaskRay/ccls/wiki/Build)` because it is well maintained and documented and supported by platform by default (when using the vim IDE setting).

For the first time we need to install `[llvm](https://llvm.org/)` (Low Level Virtual Machine):

```console
$ sudo dnf install llvm
```
or
```console
$ sudo apt install llvm
```

After that lets try clone ccsl from repository and install in into system. The simplest/quickest build with all defaults (only for POSIX systems) is:

```console
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls

# Download "Pre-Built Binaries" from https://releases.llvm.org/download.html
# and unpack to /path/to/clang+llvm-xxx.
# Do not unpack to a temporary directory, as the clang resource directory is hard-coded
# into ccls at compile time!
# See https://github.com/MaskRay/ccls/wiki/FAQ#verify-the-clang-resource-directory-is-correct
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/opt/llvm/<llvm version>/lib/cmake
cmake --build Release
```

and installed it

cmake --build Release --target install

The version on homebrew is probably outdated, if you want to be on the safe side, build it from source

For the record:
 - Do not forget execute `yarn install` for building `build/index.js`
 - `:CocConfig` command runs coc configuration.
 - TSLint, Prettier, and TSServer extensions by default read project configuration files (.tslint, .prettier.config.js and tsconfig.json). Prettier TSLint capabilities can be enabled in the `:CocConfig`
 - Default autocomplete is annoying since it’s controlled by arrow keys to select. Read [completion with sources](https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources) to configure it to tab.


In inspiration by this [article](https://medium.com/@s1n7ax/neovim-for-typescript-react-development-fdc7082c8a78)

