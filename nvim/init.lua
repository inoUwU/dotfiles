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
require("lazy_nvim")
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("snacks").dashboard.setup()
  end,
})
-- init.luaまたはlsp-config.luaの適切な場所に追加
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.github",
  callback = function()
    print("GitHub Actions YAML file detected!")
  end,
})
