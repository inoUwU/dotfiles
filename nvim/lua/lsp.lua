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
  end,
})
