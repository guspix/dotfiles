return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- I only want to load obsidian.nvim for markdown files in your vault:
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Documents/obsidian/guspix/**.md",

    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/obsidian/guspix/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "guspix",
        path = "~/Documents/obsidian/guspix",
      },
    },
    daily_notes = {
      folder = "Daily",
      template = "Daily.md",
    },
    templates = {
      subdir = "Templates",
    },
  },
}
