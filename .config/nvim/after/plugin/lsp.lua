if vim.g.vscode then
    return
end

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
    html = function()
      require('lspconfig').html.setup({
				filetypes = {"html", "htmldjango"}
      })
    end,
  }
})

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'vim-dadbod-completion'},
  },
  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
})
