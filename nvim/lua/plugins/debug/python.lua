return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "williamboman/mason.nvim",
  },
  config = function()
    local registry = require("mason-registry")
    local debugpy = registry.get_package("debugpy")
    local python = debugpy:get_install_path() .. "/venv/bin/python"

    require("dap-python").setup(python)

    local dap_python = require("dap-python")
    vim.keymap.set("n", "<leader>dpm", dap_python.test_method, {
      desc = "Debug Python test method",
    })
    vim.keymap.set("n", "<leader>dpc", dap_python.test_class, {
      desc = "Debug Python test class",
    })
  end,
}
