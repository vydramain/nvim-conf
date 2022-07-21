# nvim-conf
My personal nvim configuration for quick start on another machine: 
How to setup NeoVim for React and Typescript development:

## Prerequisites:
- [Neovim](https://neovim.io/)
- [Node](https://nodejs.org/en/) (coc extension require a javascript runtime to do the job)
- [Git](https://git-scm.com/) (vim plug use git to clone vim/nvim plugins to the local computer)
- [Yarn](https://yarnpkg.com/) (coc nvim using yarn to install packages)

## For start

#### NeoVim Plugin Manager:

Well, Vim and NeoVim have multiple communities developed plugin managers. Good humans ❤. With plugins, it’s so easy to install pretty much any plugin (I don’t know if there are not compatible once). So easy to back up the configuration with all installed plugins (save init.vim somewhere it’s that easy and you got all the plugins and their configurations in that).

   - Download [vim-plug](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) file.
   - Place the plugin inside autoload folder: `/home/<user_folder>/.config/nvim/autoload/plug.vim`

#### Required plugins:

Add the following content to init.vim file we previously created. The description is in the comment however I highly recommend you to read the wiki in GitHub (You can download my complete configuration here if you are interested)

```
" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'call plug#end()
" == VIMPLUG END ================================" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================
```



In inspiration by this [article](https://medium.com/@s1n7ax/neovim-for-typescript-react-development-fdc7082c8a78)
