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
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Go to declaration"
      keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts) -- show diagnostics for line
    end

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    lspconfig["html"].setup({
      on_attach = on_attach,
    })
    lspconfig["ts_ls"].setup({
      on_attach = on_attach,
    })
    lspconfig["cssls"].setup({
      on_attach = on_attach,
    })
    lspconfig["tailwindcss"].setup({
      on_attach = on_attach,
    })
    lspconfig["svelte"].setup({
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
    })
    lspconfig["prismals"].setup({
      on_attach = on_attach,
    })
    lspconfig["graphql"].setup({
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })
    lspconfig["emmet_ls"].setup({
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })
    lspconfig["pyright"].setup({
      on_attach = on_attach,
    })
    lspconfig["gopls"].setup({
      on_attach = on_attach,
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
    })
    lspconfig["yamlls"].setup({
      on_attach = on_attach,
      filetypes = { "yaml", "yml" },
    })

    lspconfig.gh_actions_ls.setup({
      on_attach = on_attach,
      filetypes = { "yaml.github" },
      root_dir = util.root_pattern(".github"),
      single_file_support = true,
    })

    lspconfig.gleam.setup({
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
