vim.opt.clipboard = "unnamedplus"

-- TODO: Dupulicated
-- Visual mode keymap to prevent clipboard overwrite on paste
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true, silent = true })
