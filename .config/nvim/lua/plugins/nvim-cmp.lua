return {
  "hrsh7th/nvim-cmp",
  dependencies = { "kristijanhusak/vim-dadbod-completion" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "vim-dadbod-completion" } }))
    opts.mapping["<CR>"] = nil
  end,
}
