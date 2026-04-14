-- Shared on_attach: keybindings applied to every LSP-attached buffer
local function on_attach(_, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc, noremap = true, silent = true })
  end
  map("gd",         vim.lsp.buf.definition,     "Go to definition")
  map("gD",         vim.lsp.buf.declaration,    "Go to declaration")
  map("gr",         vim.lsp.buf.references,     "Go to references")
  map("gi",         vim.lsp.buf.implementation, "Go to implementation")
  map("K",          vim.lsp.buf.hover,          "Hover docs")
  map("<C-k>",      vim.lsp.buf.signature_help, "Signature help")
  map("<leader>rn", vim.lsp.buf.rename,         "Rename symbol")
  map("<leader>ca", vim.lsp.buf.code_action,    "Code action")
  map("<leader>D",  vim.diagnostic.open_float,  "Show diagnostics")
  map("[d",         vim.diagnostic.goto_prev,   "Prev diagnostic")
  map("]d",         vim.diagnostic.goto_next,   "Next diagnostic")
end

return {
  -- LSP server installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Auto-install LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",   -- C++
          "ts_ls",    -- TypeScript / JavaScript (used as fallback; typescript-tools is primary)
          "eslint",   -- JS/TS linting via LSP
          "cssls",    -- CSS
          "html",     -- HTML
          "jsonls",   -- JSON
          "lua_ls",   -- Lua (for this config)
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Diagnostic UI
      vim.diagnostic.config({
        virtual_text  = { prefix = "●", spacing = 4 },
        severity_sort = true,
        float         = { border = "rounded", source = "always" },
        signs         = true,
        underline     = true,
      })

      -- Common defaults for all servers
      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach    = on_attach,
      })

      -- C++ (clangd)
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
        },
      })

      -- JSON with schema support
      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      -- ESLint (auto-fix on save)
      vim.lsp.config("eslint", {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      -- Lua (nvim config)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.enable({ "clangd", "cssls", "html", "jsonls", "eslint", "lua_ls" })
    end,
  },

  -- JSON schema catalog (used by jsonls)
  { "b0o/schemastore.nvim", lazy = true },

  -- TypeScript: better than plain ts_ls — organise imports, add missing, etc.
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup({
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "TS: " .. desc, noremap = true, silent = true })
          end
          map("<leader>oi", ":TSToolsOrganizeImports<CR>",      "Organize imports")
          map("<leader>ai", ":TSToolsAddMissingImports<CR>",    "Add missing imports")
          map("<leader>ru", ":TSToolsRemoveUnusedImports<CR>",  "Remove unused imports")
          map("<leader>rf", ":TSToolsRenameFile<CR>",           "Rename file (update imports)")
          map("<leader>fi", ":TSToolsFixAll<CR>",               "Fix all")
        end,
        settings = {
          tsserver_file_preferences = {
            importModuleSpecifierPreference = "non-relative",
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = true,
          },
          expose_as_code_action = "all",
        },
      })
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets", -- VSCode snippets for TS/JS/etc
      "onsails/lspkind.nvim",         -- icons in completion menu
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"]     = cmp.mapping.select_next_item(),
          ["<C-k>"]     = cmp.mapping.select_prev_item(),
          ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode     = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })
    end,
  },

  -- Linting (eslint_d for TS, cpplint for C++)
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        typescript      = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        javascript      = { "eslint_d" },
        javascriptreact = { "eslint_d" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = "ConformInfo",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua             = { "stylua" },
          typescript      = { "prettier" },
          typescriptreact = { "prettier" },
          javascript      = { "prettier" },
          javascriptreact = { "prettier" },
          json            = { "prettier" },
          html            = { "prettier" },
          css             = { "prettier" },
          cpp             = { "clang_format" },
          c               = { "clang_format" },
        },
        format_on_save = {
          timeout_ms   = 2000,
          lsp_fallback = true,
        },
      })
    end,
  },
}
