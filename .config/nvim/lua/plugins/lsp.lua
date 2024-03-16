-- add pyright to lspconfig
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {
        settings = {
          python = {
            -- pyright seemed to be looking for the executable for python3 instead of python
            pythonPath = vim.fn.exepath("python"),
          },
        },
      },
    },
  },
}
