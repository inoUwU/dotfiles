return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "vtsls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "eslint",
        "denols",
        "zls",
        "codelldb",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
      opts = {
        setup = {
          automatic_enable = {
            exclude = {
              "rust_analyzer",
            },
          },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d",
        "luacheck",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
