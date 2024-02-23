return {
  "L3MON4D3/LuaSnip",
  -- This event makes it run when the buffer is entered, making sure the sources are added before the completions are generated
  event = "BufEnter",
  -- Modified so that typescript files also get typescriptreact snippets (Now redundant because I set ts files to typescriptreact)
  config = function()
    require("luasnip").filetype_extend("typescript", { "typescriptreact" })
  end,
}
