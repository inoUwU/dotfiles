return {
  root_dir = function(bufnr, callback)
    local buf_path = vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr))
    local start_dir = vim.fs.dirname(buf_path)
    local found = vim.fs.find(".github/workflows", {
      upward = true,
      path = start_dir,
      type = "directory",
    })
    if #found > 0 then
      return callback(vim.fs.dirname(found[1]))
    end
    return callback(start_dir)
  end,
}
