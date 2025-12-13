local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true, noremap = true }

    opts.desc = "Go to declaration"
    keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts)

    local signs = { Error = "", Warn = "", Info = "", Hint = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      severity_sort = true,
      virtual_text = false,
      virtual_lines = {
        current_line = true,
      },
      underline = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
    })
  end,
})
