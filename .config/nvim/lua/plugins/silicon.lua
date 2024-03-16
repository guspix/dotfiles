return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  keys = {
    -- I have to use colon instead of <cmd> because of visual mode
    { "<leader>cs", ":Silicon<CR>", mode = "x", desc = "Copy screenshot of code to clipboard" },
  },

  config = function()
    require("silicon").setup({
      font = "hack nerd font=34",
      to_clipboard = true,
      theme = "Dracula",
    })
  end,
}
