local vim = vim
local Plug = vim.fn['plug#']

-- Plugin Section
vim.call('plug#begin')

 Plug('vim-scripts/c.vim')                                              -- Statement oriented editing of  C / C++ programs
 Plug('vim-scripts/DoxygenToolkit.vim')                                 -- Usefull tools for Doxygen (comment, author, license)

 Plug('dracula/vim')                                                 	-- Theme for Neovim.
 Plug('ryanoasis/vim-devicons')                                      	-- Devicon support for nerdtree. 
 Plug('SirVer/ultisnips')                                            	-- ASnippets engine.                                            
 Plug('honza/vim-snippets')                                          	-- A collection of snippets
 Plug('scrooloose/nerdtree')                                         	-- A file explorer for neovim. Netrw comes as default for neovim.
 Plug('preservim/nerdcommenter')                                     	-- An easy way for commenting outlines. 
 Plug('mhinz/vim-startify')                                          	-- A really handy start page with lots of customizations
 Plug('neoclide/coc.nvim')		     	                     	        -- A fast code completion engine

 Plug('tveskag/nvim-blame-line')                                     	-- A small plugin that uses neovims virtual text to print git blame info at the end of the current line.
 Plug('numkil/ag.nvim')                                              	-- A code searching tool similar to ack, with a focus on speed.
 Plug('tc50cal/vim-terminal')                                        	-- Vim Terminal
 Plug('preservim/tagbar')                                            	-- Tagbar for code navigation
 Plug('sbdchd/neoformat')                                            	-- A (Neo)vim plugin for formatting code.
 Plug('deoplete-plugins/deoplete-clang')                                -- To provide C++/C code autocompletion

 Plug('vim-airline/vim-airline')                                      	-- Status bar
 Plug('rafi/awesome-vim-colorschemes')                                	-- Colorschemens

 Plug('mfussenegger/nvim-dap')                                        	-- Debug Adapter Protocol client implementation

vim.call('plug#end')

-- Vim options
vim.o.showmatch = true 							                        -- Show matching
vim.o.ignorecase = true 						                        -- Case insensitive search
vim.o.mouse = "v" 							                            -- Middle-click paste with mouse
vim.o.hlsearch = true 							                        -- Highlight search
vim.o.incsearch = true 							                        -- Incremental search
vim.o.tabstop = 4 							                            -- Number of columns occupied by a tab vim.o.softtabstop = 4
vim.o.expandtab = true 							                        -- Convert tabs to white space
vim.o.shiftwidth = 4 							                        -- Width for auto-indents
vim.o.autoindent = true 						                        -- Indent a new line the same amount as the line just typed
vim.o.number = true 							                        -- Add line numbers
vim.o.relativenumber = true 						                    -- Show relative row numbers of current
vim.o.wildmode = "longest,list" 					                    -- Get bash-like tab completions
vim.o.cindent = true 							                        -- Use 'C' style program indenting
vim.o.smarttab = true 							                        -- Enable smart-tabs
vim.o.smartindent = true 						                        -- Enable smart-indent
vim.o.mouse = "a" 							                            -- Enable mouse click
vim.o.clipboard = "unnamedplus" 					                    -- Use system clipboard
vim.o.cursorline = true 						                        -- Highlight current cursorline
vim.o.ttyfast = true 							                        -- Speed up scrolling in Vim
vim.o.backspace = 'indent,eol,start'					                -- Backspace behavior
vim.o.guicursor = 'a:hor100-Cursor-inverse/lCursor'			            -- Set cursor type to underline for normal mode
vim.o.encoding = "UTF-8" 						                        -- Set encoding to UTF-8
vim.o.background = "dark"						                        -- Set background to dark

vim.cmd('syntax on') 							                        -- Enable syntax highlighting
vim.cmd('filetype plugin indent on') 					                -- Allow auto-indenting depending on file type
vim.cmd('colorscheme jellybeans')					                    -- Theme

-- Move line or visually selected block - alt+j/k
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Move split panes to left/bottom/top/right
vim.api.nvim_set_keymap('n', '<A-h>', '<C-W>H', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-W>J', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-W>K', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-W>L', { noremap = true })

-- Move between panes to left/bottom/top/right
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Press i to enter insert mode, and ii to exit insert mode.
vim.api.nvim_set_keymap('i', 'ii', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {})
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('v', 'kj', '<Esc>', {})

-- Open file in a text by placing text and gf
vim.api.nvim_set_keymap('n', 'gf', ':vert winc f<CR>', { noremap = true })

-- Copies filepath to clipboard by pressing yf
vim.api.nvim_set_keymap('n', 'yf', ':let @+=expand(\'%:p\')<CR>', { noremap = true })

-- Copies pwd to clipboard: command yd
vim.api.nvim_set_keymap('n', 'yd', ':let @+=expand(\'%:p:h\')<CR>', { noremap = true })

-- Vim jump to the last position when reopening a file
if vim.api.nvim_has_autocmd and vim.api.nvim_has_autocmd("BufReadPost") then
    vim.api.nvim_exec([[
        augroup jump_to_last_position
            autocmd!
            autocmd BufReadPost * if line("'\"") > 0 and line("'\"") <= line("$") | execute "normal! g'\"" | endif
        augroup end
    ]], false)
end


-- NERDTree keybindings
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':call CocActionAsync(\'jumpDefinition\')<CR>', { noremap = true })

-- Blame line keybindings
vim.api.nvim_set_keymap('n', '<leader>eb', ':ToggleBlameLine<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>db', ':DisableBlameLine<CR>', { noremap = true, silent = true })

-- Tagbar keybindings
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true })

-- Use tab for trigger completion with characters ahead and navigate
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config
-- vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : CheckBackspace() ? "<Tab>" : "<C-x><C-o>"', { expr = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? coc#_select_confirm("<C-p>") : "<C-h>"', { expr = true, silent = true })

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
-- vim.api.nvim_set_keymap('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { silent = true, expr = true })
-- function CheckBackspace()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col) == ' '
-- end

-- Use <c-space> to trigger completion
if vim.fn.has('nvim') == 1 then
  vim.api.nvim_set_keymap('i', '<silent><expr> <c-space>', 'coc#refresh()', { expr = true, silent = true })
else
  vim.api.nvim_set_keymap('i', '<silent><expr> <c-@>', 'coc#refresh()', { expr = true, silent = true })
end


-- Use `[g` and `]g` to navigate diagnostics
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

-- GoTo code navigation
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Use K to show documentation in preview window
vim.api.nvim_set_keymap('n', 'K', ':call ShowDocumentation()<CR>', { silent = true })
function ShowDocumentation()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_feedkeys('K', 'in', true)
  end
end

-- Highlight the symbol and its references when holding the cursor
vim.cmd('autocmd CursorHold * silent call CocActionAsync("highlight")')

-- Symbol renaming
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

-- Formatting selected code
-- vim.api.nvim_set_keymap('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })

-- Setup formatexpr specified filetype(s)
vim.cmd([[
  augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction("formatSelected")
    autocmd User CocJumpPlaceholder call CocActionAsync("showSignatureHelp")
  augroup end
]])

-- Applying code actions to the selected code block
-- Example: `<leader>aap` for current paragraph
vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', { silent = true })

-- Remap keys for applying code actions at the cursor position
vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)', { silent = true })
-- Remap keys for apply code actions affect whole buffer
vim.api.nvim_set_keymap('n', '<leader>as', '<Plug>(coc-codeaction-source)', { silent = true })
-- Apply the most preferred quickfix action to fix diagnostic on the current line
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true })

-- Remap keys for applying refactor code actions
vim.api.nvim_set_keymap('n', '<silent> <leader>re', '<Plug>(coc-codeaction-refactor)', { silent = true })
vim.api.nvim_set_keymap('x', '<silent> <leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<silent> <leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })

-- Run the Code Lens action on the current line
vim.api.nvim_set_keymap('n', '<leader>cl', '<Plug>(coc-codelens-action)', { silent = true })

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)', { silent = true })
vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)', { silent = true })
vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)', { silent = true })
vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)', { silent = true })
vim.api.nvim_set_keymap('x', 'ic', '<Plug>(coc-classobj-i)', { silent = true })
vim.api.nvim_set_keymap('o', 'ic', '<Plug>(coc-classobj-i)', { silent = true })
vim.api.nvim_set_keymap('x', 'ac', '<Plug>(coc-classobj-a)', { silent = true })
vim.api.nvim_set_keymap('o', 'ac', '<Plug>(coc-classobj-a)', { silent = true })

-- Remap <C-f> and <C-b> to scroll float windows/popups
if vim.fn.has('nvim-0.4.0') or vim.fn.has('patch-8.2.0750') then
  vim.api.nvim_set_keymap('n', '<silent><nowait><expr> <C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { silent = true, expr = true })
  vim.api.nvim_set_keymap('n', '<silent><nowait><expr> <C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { silent = true, expr = true })
  vim.api.nvim_set_keymap('i', '<silent><nowait><expr> <C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', { silent = true, expr = true })
  vim.api.nvim_set_keymap('i', '<silent><nowait><expr> <C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', { silent = true, expr = true })
  vim.api.nvim_set_keymap('v', '<silent><nowait><expr> <C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { silent = true, expr = true })
  vim.api.nvim_set_keymap('v', '<silent><nowait><expr> <C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { silent = true, expr = true })
end

-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
vim.api.nvim_set_keymap('n', '<silent> <C-s>', '<Plug>(coc-range-select)', { silent = true })
vim.api.nvim_set_keymap('x', '<silent> <C-s>', '<Plug>(coc-range-select)', { silent = true })

-- Add `:Format` command to format current buffer
vim.cmd('command! -nargs=0 Format :call CocActionAsync("format")')

-- Add `:Fold` command to fold current buffer
vim.cmd('command! -nargs=? Fold :call CocAction("fold", <f-args>)')

-- Add `:OR` command for organizing imports of the current buffer
vim.cmd('command! -nargs=0 OR :call CocActionAsync("runCommand", "editor.action.organizeImport")')

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.o.statusline = [[%{coc#status()}%{get(b:,'coc_current_function','')}]]

-- Use <Tab> for completion and snippet expansion.
vim.cmd [[
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
]]

-- Mappings for CoCList
-- Show all diagnostics
vim.api.nvim_set_keymap('n', '<silent><nowait> <space>a', ':<C-u>CocList diagnostics<CR>', { silent = true })
-- Manage extensions
vim.api.nvim_set_keymap('n', '<silent><nowait> <space>e', ':<C-u>CocList extensions<CR>', { silent = true })
-- Show commands
vim.api.nvim_set_keymap('n', '<silent><nowait> <space>c', ':<C-u>CocList commands<CR>', { silent = true })
-- Find symbol of current document
vim.api.nvim_set_keymap('n', '<silent><nowait> <space>o', ':<C-u>CocList outline<CR>', { silent = true })
-- Search workspace symbols
vim.api.nvim_set_keymap('n', '<silent><nowait> <space>s', ':<C-u>CocList -I symbols<CR>', { silent = true })
-- Do default action for next item
vim.api.nvim_set_keymap('n', '<silent><nowait> <space>j', ':<C-u>CocNext<CR>', { silent = true })
-- Do default action for previous item
vim.api.nvim_set_keymap('n', '<silent><nowait> <space>k', ':<C-u>CocPrev<CR>', { silent = true })
-- Resume latest coc list
vim.api.nvim_set_keymap('n', '<silent><nowait> <space>p', ':<C-u>CocListResume<CR>', { silent = true })

-- DoxygenToolkit set up
vim.g.DoxygenToolkit_commentType = "C++"
vim.g.DoxygenToolKit_briefTag_pre = "\brief"
vim.g.DoxygenToolKit_noteTag_pre = "\note"
vim.grDoxygenToolKit_detailsTag_pre = "\\details"

-- Custom setting for clangformat
-- vim.g.neoformat_cpp_clangformat = {
--     exe = 'clang-format',
--     args = {'-i', '--style=file'}
-- }
-- vim.g.neoformat_enabled_cpp = {'clangformat'}
-- vim.g.neoformat_enabled_c = {'clangformat'}

-- Debug Adapter Protocol configuration
local dap = require("dap")
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

