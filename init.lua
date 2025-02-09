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

-- Coc configuration with keybindings
-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply source code actions for current file.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Apply the most preferred quickfix action on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)


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

