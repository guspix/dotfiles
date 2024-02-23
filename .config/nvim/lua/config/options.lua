-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = ""

-- Add specific filetypes
vim.filetype.add({ pattern = { ["bash%-fc.*"] = "sh" }, extension = {
  ts = "typescriptreact",
} })
