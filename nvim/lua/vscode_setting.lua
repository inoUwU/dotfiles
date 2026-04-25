vim.opt.clipboard = "unnamedplus"

-- TODO: Dupulicated
-- Visual mode keymap to prevent clipboard overwrite on paste
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true, silent = true })
if vim.fn.has("win64") == 1 then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "C:\\MyTools\\win32yank-x64\\win32yank.exe -i --crlf",
      ["*"] = "C:\\tools\\win32yank-x64\\win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "C:\\MyTools\\win32yank-x64\\win32yank.exe -o --lf",
      ["*"] = "C:\\MyTools\\win32yank-x64\\win32yank.exe -o --lf",
    },
  }
end
