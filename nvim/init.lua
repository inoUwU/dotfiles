--                                     ██
--                                    ░░
--  ███████   █████   ██████  ██    ██ ██ ██████████
-- ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
--  ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
--  ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
--  ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
-- ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░

vim.g.mapleader = " "
if vim.g.vscode then
  require("vscode_setting")
else
  require("base")
end

vim.filetype.add({
  pattern = {
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
})

require("lsp")
require("lazy_nvim")

local theme = require("last-color").recall() or "yoda"
vim.cmd.colorscheme(theme)

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("snacks").input.enable()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.github",
  callback = function()
    print("GitHub Actions YAML file detected!")
  end,
})
