return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    "saghen/blink.cmp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")
    local keymap = vim.keymap -- for conciseness
    local base_opts = { noremap = true, silent = true }

    local function on_attach(client, bufnr)
      local opts = vim.tbl_extend("force", base_opts, { buffer = bufnr })

      opts.desc = "Go to declaration"
      keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts)
    end

    -- C/C++ clangd用の専用on_attach
    local function on_attach_clangd(client, bufnr)
      on_attach(client, bufnr)
      keymap.set(
        "n",
        "<leader>ch",
        "<cmd>ClangdSwitchSourceHeader<cr>",
        vim.tbl_extend("force", base_opts, { buffer = bufnr, desc = "Switch Source/Header (C/C++)" })
      )
    end

    local servers = {
      html = {},
      cssls = {},
      tailwindcss = {},
      prismals = {},
      pyright = {},
      gleam = {},
      yamlls = {
        filetypes = { "yaml", "yml" },
      },
      graphql = {
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      },
      emmet_ls = {
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      },
      gh_actions_ls = {
        filetypes = { "yaml.github" },
        root_dir = util.root_pattern(".github"),
        single_file_support = true,
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      },
      svelte = {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              if client.name == "svelte" then
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
              end
            end,
          })
        end,
      },
      clangd = {
        on_attach = on_attach_clangd,
        root_dir = function(fname)
          return util.root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or util.root_pattern("compile_commands.json", "compile_flags.txt")(fname) or util.find_git_ancestor(
            fname
          )
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
      elmls = {},
    }

    -- clangd_extensions.nvimを利用する場合の拡張セットアップ
    local function setup_clangd_with_extensions(config)
      local ok, clangd_ext = pcall(require, "clangd_extensions")
      if ok then
        local LazyVim_ok, LazyVim = pcall(require, "lazyvim")
        -- clangd_extensions.nvimのオプションを取得、マージ
        local clangd_ext_opts = (LazyVim_ok and LazyVim.opts and LazyVim.opts("clangd_extensions.nvim")) or {}
        clangd_ext.setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = config }))
        return true
      end
      return false
    end

    -- Setup all language servers
    for server, config in pairs(servers) do
      -- clangdはclangd_extensionsを優先利用
      if server == "clangd" then
        if not setup_clangd_with_extensions(config) then
          config.on_attach = config.on_attach or on_attach
          lspconfig[server].setup(config)
        end
      else
        config.on_attach = config.on_attach or on_attach
        lspconfig[server].setup(config)
      end
    end
  end,
}
