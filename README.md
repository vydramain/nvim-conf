# nvim-conf
My personal nvim configuration for quick start on another machine: 
How to setup NeoVim for React and Typescript development:

## Descripions:
Files from this repository are keeping in the `~/.config/nvim` catalog.

## Prerequisites:
- [Neovim](https://neovim.io/)
- [Node](https://nodejs.org/en/) (coc extension require a javascript runtime to do the job)
- [Git](https://git-scm.com/) (vim plug use git to clone vim/nvim plugins to the local computer)
- [Yarn](https://yarnpkg.com/) (coc nvim using yarn to install packages)

## For start

#### NeoVim Plugin Manager:

- Download [vim-plug](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) file.
- Place the plugin inside autoload folder: `/home/<user_folder>/.config/nvim/autoload/plug.vim`

#### Required plugins:

The following content is `init.vim` temp-file content. The description is in the comment. Highly recommend to read the wiki in [GitHub](https://github.com/neovim/neovim/wiki/Configuration) (For downloading s1n7ax's [complete configuration](https://github.com/s1n7ax/dotvim))

```
" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
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

For the record:
 - `:CocConfig` command runs coc configuration.
 - TSLint, Prettier, and TSServer extensions by default read project configuration files (.tslint, .prettier.config.js and tsconfig.json). Prettier TSLint capabilities can be enabled in the `:CocConfig`
 - Default autocomplete is annoying since it’s controlled by arrow keys to select. Read [completion with sources](https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources) to configure it to tab.


In inspiration by this [article](https://medium.com/@s1n7ax/neovim-for-typescript-react-development-fdc7082c8a78)
