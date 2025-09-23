return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        terraformls = {
          cmd = { "terraform-ls", "serve" },
          filetypes = { "terraform", "tf" },
          root_dir = require("lspconfig.util").root_pattern(".terraform", ".git", "."),
        },
      },
    },
  },
}
