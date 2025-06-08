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

    local servers = {
      html = {},
      cssls = {},
      tailwindcss = {},
      prismals = {},
      pyright = {},
      gleam = {},
      gopls = {
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
      },
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
    }

    -- Set diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Setup all language servers
    for server, config in pairs(servers) do
      config.on_attach = config.on_attach or on_attach
      lspconfig[server].setup(config)
    end
  end,
}
