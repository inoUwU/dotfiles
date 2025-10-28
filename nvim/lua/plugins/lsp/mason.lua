return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "rust_analyzer",
        "vtsls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "eslint",
        "denols",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
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
        servers = {
          rust_analyzer = {
            enabled = false,
          },
          tsserver = {
            enabled = false,
          },
          ts_ls = {
            enabled = false,
          },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
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
