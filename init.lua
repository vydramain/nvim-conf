local vim = vim
local Plug = vim.fn['plug#']

-- Plugin Section
vim.call('plug#begin')

 Plug('vim-scripts/c.vim')                                              -- Statement oriented editing of  C / C++ programs
 Plug('vim-scripts/DoxygenToolkit.vim')                                 -- Usefull tools for Doxygen (comment, author, license)

 Plug('ryanoasis/vim-devicons')                                      	-- Devicon support for nerdtree. 
 Plug('mhinz/vim-startify')                                          	-- A really handy start page with lots of customizations
 Plug('honza/vim-snippets')                                          	-- A collection of snippets
 Plug('tc50cal/vim-terminal')                                        	-- Vim Terminal
 Plug('vim-airline/vim-airline')                                      	-- Status bar
 Plug('rafi/awesome-vim-colorschemes')                                	-- Colorschemens

 Plug('tveskag/nvim-blame-line')                                     	-- A small plugin that uses neovims virtual text to print git blame info at the end of the current line.

 Plug('SirVer/ultisnips')                                            	-- ASnippets engine.                                            

 Plug('scrooloose/nerdtree')                                         	-- A file explorer for neovim. Netrw comes as default for neovim.
 Plug('preservim/nerdcommenter')                                     	-- An easy way for commenting outlines. 

 Plug('numkil/ag.nvim')                                              	-- A code searching tool similar to ack, with a focus on speed.
 Plug('stevearc/overseer.nvim')                                         -- A task runner and job management plugin for Neovim
 Plug('nvim-lua/plenary.nvim')                                          -- All the lua functions I don't want to write twice

 Plug('neoclide/coc.nvim')		     	                     	        -- A fast code completion engine
 Plug('deoplete-plugins/deoplete-clang')                                -- To provide C++/C code autocompletion

 Plug('Civitasv/cmake-tools.nvim')                                      -- CMake Tools for Neovim

 Plug('mfussenegger/nvim-dap')                                        	-- Debug Adapter Protocol client implementation
 Plug('nvim-neotest/nvim-nio')                                          -- A library for asynchronous IO in Neovim, inspired by the asyncio library in Python. The library focuses on providing both common asynchronous primitives and asynchronous APIs for Neovim's core.
 Plug('rcarriga/nvim-dap-ui')                                           -- A UI for nvim-dap which provides a good out of the box configuration.
 Plug('theHamsta/nvim-dap-virtual-text')                                -- This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.

 Plug('preservim/tagbar')                                            	-- Tagbar for code navigation

 Plug('rhysd/vim-clang-format')                                         -- A (Neo)vim plugin for formatting code.


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
vim.o.guicursor = 'a:hor90-Cursor-inverse/lCursor'			            -- Set cursor type to underline for normal mode
vim.o.ttyfast = true 							                        -- Speed up scrolling in Vim
vim.o.backspace = 'indent,eol,start'					                -- Backspace behavior
vim.o.encoding = "UTF-8" 						                        -- Set encoding to UTF-8
vim.o.background = "dark"						                        -- Set background to dark

vim.cmd('syntax on') 							                        -- Enable syntax highlighting
vim.cmd('filetype plugin indent on') 					                -- Allow auto-indenting depending on file type
vim.cmd('colorscheme jellybeans')					                    -- Theme

vim.g.mapleader = "\\"

-- Move line or visually selected block - alt+j/k
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Move between panes to left/bottom/top/right
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Press i to enter insert mode, and ii to exit insert mode.
vim.api.nvim_set_keymap('i', 'ii', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {})

-- Open file in a text by placing text and gf
vim.api.nvim_set_keymap('n', 'gf', ':vert winc f<CR>', { noremap = true })

-- Copies filepath to clipboard by pressing yf
vim.api.nvim_set_keymap('n', 'yf', ':let @+=expand(\'%:p\')<CR>', { noremap = true })

-- Copies pwd to clipboard: command yd
vim.api.nvim_set_keymap('n', 'yd', ':let @+=expand(\'%:p:h\')<CR>', { noremap = true })

-- Add // commentary for current line
vim.api.nvim_set_keymap('n', '<C-/>', 'I// <Esc>', { noremap = true, silent = true })

-- Vim jump to the last position when reopening a file
if vim.api.nvim_has_autocmd and vim.api.nvim_has_autocmd("BufReadPost") then
    vim.api.nvim_exec([[
        augroup jump_to_last_position
            autocmd!
            autocmd BufReadPost * if line("'\"") > 0 and line("'\"") <= line("$") | execute "normal! g'\"" | endif
        augroup end
    ]], false)
end

-- Formatting style options
vim.g["clang_format#style_options"] = {
  BasedOnStyle = "LLVM",
  IndentWidth = 2,
}

-- Key mapping to toggle ClangFormat auto-formatting
vim.api.nvim_set_keymap('n', '<leader>cf', ':ClangFormat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>cf', ':ClangFormat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>C', ':ClangFormatAutoToggle<CR>', { noremap = true, silent = true })

-- NERDTree keybindings
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>nf', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- Split files view keybindings
vim.api.nvim_set_keymap('n', '<leader>sh', ':set splitbelow<CR>:split<CR>:buffer %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':set splitright<CR>:vsplit<CR>:buffer %<CR>', { noremap = true, silent = true })


-- Blame line keybindings
vim.api.nvim_set_keymap('n', '<leader>eb', ':ToggleBlameLine<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>db', ':DisableBlameLine<CR>', { noremap = true, silent = true })

-- Coc configuration with keybindings
-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua
vim.api.nvim_set_keymap('n', '<C-l>', ':call CocActionAsync(\'jumpDefinition\')<CR>', { noremap = true })

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

-- Configuration from README from CMake Tools
local osys = require("cmake-tools.osys")
require("cmake-tools").setup {
  cmake_command = "cmake", -- this is used to specify cmake command path
  ctest_command = "ctest", -- this is used to specify ctest command path
  cmake_use_preset = true,
  cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
  cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
  -- support macro expansion:
  --       ${kit}
  --       ${kitGenerator}
  --       ${variant:xx}
  cmake_build_directory = function()
    if osys.iswin32 then
      return "out\\${variant:buildType}"
    end
    return "out/${variant:buildType}"
  end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
  cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
  cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
  cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
  cmake_variants_message = {
    short = { show = true }, -- whether to show short message
    long = { show = true, max_length = 40 }, -- whether to show long message
  },
  cmake_dap_configuration = { -- debug settings for cmake
    name = "cpp",
    type = "codelldb",
    request = "launch",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },
  cmake_executor = { -- executor to use
    name = "quickfix", -- name of the executor
    opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
    default_opts = { -- a list of default and possible values for executors
      quickfix = {
        show = "always", -- "always", "only_on_error"
        position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
        size = 10,
        encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
        auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
      },
      toggleterm = {
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = false, -- whether close the terminal when exit
        auto_scroll = true, -- whether auto scroll to the bottom
        singleton = true, -- single instance, autocloses the opened one, if present
      },
      overseer = {
        new_task_opts = {
            strategy = {
                "toggleterm",
                direction = "horizontal",
                auto_scroll = true,
                quit_on_exit = "success"
            }
        }, -- options to pass into the `overseer.new_task` command
        on_new_task = function(task)
            require("overseer").open(
                { enter = false, direction = "right" }
            )
        end,   -- a function that gets overseer.Task when it is created, before calling `task:start`
      },
      terminal = {
        name = "Main Terminal",
        prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
        split_direction = "horizontal", -- "horizontal", "vertical"
        split_size = 11,

        -- Window handling
        single_terminal_per_instance = true, -- Single viewport, multiple windows
        single_terminal_per_tab = true, -- Single viewport per tab
        keep_terminal_static_location = true, -- Static location of the viewport if avialable
        auto_resize = true, -- Resize the terminal if it already exists

        -- Running Tasks
        start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
        focus = false, -- Focus on terminal when cmake task is launched.
        do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
      }, -- terminal executor uses the values in cmake_terminal
    },
  },
  cmake_runner = { -- runner to use
    name = "terminal", -- name of the runner
    opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
    default_opts = { -- a list of default and possible values for runners
      quickfix = {
        show = "always", -- "always", "only_on_error"
        position = "belowright", -- "bottom", "top"
        size = 10,
        encoding = "utf-8",
        auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
      },
      toggleterm = {
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = false, -- whether close the terminal when exit
        auto_scroll = true, -- whether auto scroll to the bottom
        singleton = true, -- single instance, autocloses the opened one, if present
      },
      overseer = {
        new_task_opts = {
            strategy = {
                "toggleterm",
                direction = "horizontal",
                autos_croll = true,
                quit_on_exit = "success"
            }
        }, -- options to pass into the `overseer.new_task` command
        on_new_task = function(task)
        end,   -- a function that gets overseer.Task when it is created, before calling `task:start`
      },
      terminal = {
        name = "Main Terminal",
        prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
        split_direction = "horizontal", -- "horizontal", "vertical"
        split_size = 11,

        -- Window handling
        single_terminal_per_instance = true, -- Single viewport, multiple windows
        single_terminal_per_tab = true, -- Single viewport per tab
        keep_terminal_static_location = true, -- Static location of the viewport if avialable
        auto_resize = true, -- Resize the terminal if it already exists

        -- Running Tasks
        start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
        focus = false, -- Focus on terminal when cmake task is launched.
        do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
      },
    },
  },
  cmake_notifications = {
    runner = { enabled = true },
    executor = { enabled = true },
    spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
    refresh_rate_ms = 100, -- how often to iterate icons
  },
  cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
}

-- nvim-dap configuration
local dap = require('dap')
local dapui = require('dapui')
dapui.setup()

-- Use the same config for C files
dap.configurations.c = dap.configurations.cpp

-- Open and close dap-ui automatically
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

-- nvim-dap-virtual-text configuration
require('nvim-dap-virtual-text').setup()

-- overseer.nvim configuration
require('overseer').setup()

-- coc.nvim configuration
vim.cmd([[
  " Use coc-clangd for C++ language server
  let g:coc_global_extensions = ['coc-clangd']

  " Map keys for nvim-dap
  nmap <F5> <Cmd>lua require'dap'.continue()<CR>
  nmap <F10> <Cmd>lua require'dap'.step_over()<CR>
  nmap <F11> <Cmd>lua require'dap'.step_into()<CR>
  nmap <F12> <Cmd>lua require'dap'.step_out()<CR>
  nmap <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
  nmap <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  nmap <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
  nmap <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
  nmap <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
]])

