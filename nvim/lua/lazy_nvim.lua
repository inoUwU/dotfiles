local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins
if vim.g.vscode then
  -- vscodeでも使用できるプラグイン
  plugins = { import = "plugins.utils.hop-nvim" }
else
  plugins = {
    { import = "plugins.ai" },
    { import = "plugins.debug" },
    { import = "plugins.colorscheme" },
    { import = "plugins.lsp" },
    { import = "plugins.lang" },
    { import = "plugins.window" },
    { import = "plugins.editor" },
    { import = "plugins.utils" },
  }
end

local opts = {
  colorscheme = "solarized-osaka",
  checker = { enabled = true }, -- automatically check for plugin update
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
}

require("lazy").setup(plugins, opts)
