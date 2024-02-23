-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set ctrl d and u to center cursor after moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Set yank to copy to system clipboard
vim.keymap.set({ "n", "x" }, "y", '"+y')

-- Set paste to paste from unnamed register
-- vim.keymap.set({ "n", "x" }, "p", '""p')

-- Map ñ to ; in normal mode
vim.keymap.set("n", "ñ", ";")
-- Map ñ to ; in visual mode
vim.keymap.set("v", "ñ", ";")

-- Map Ñ to : in normal mode
vim.keymap.set("n", "Ñ", ":")
-- Map Ñ to ; in visual mode
vim.keymap.set("v", "Ñ", ":")

-- Switch to "Other buffer" with leader b
vim.keymap.set("n", "<leader>p", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true, desc = "Go to file under the cursor" })
