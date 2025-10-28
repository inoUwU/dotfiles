return {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.yaml", "*.yml" },
    })
  end,
}
