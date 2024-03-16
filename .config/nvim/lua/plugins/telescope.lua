return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Add keymap to search oldfiles
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Search in Oldfiles" },
  },
  opts = {
    defaults = {
      wrap_results = true,
      layout_strategy = "vertical",
      hidden = true,
    },
  },
}
