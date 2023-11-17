-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.list = true
vim.opt.listchars = 'eol:¬,trail:~,tab:>-,nbsp:␣,lead:·'

-- Enable mouse support
vim.opt.mouse = 'a'

-- Use clipboard
vim.opt.clipboard = ""

-- Search settings
vim.opt.ignorecase = true  -- Ignore case in search
vim.opt.smartcase = true   -- Enable smartcase
vim.opt.hlsearch = false   -- Disable highlight search

-- Indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true  -- Enable break indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.signcolumn = "yes"

-- Scroll
vim.opt.scrolloff = 5

-- Enable true colors
vim.opt.termguicolors = true

-- Enable persistent undo
local home_dir
if jit.os == "Windows" then
  home_dir = os.getenv("USERPROFILE")
else
  home_dir = os.getenv("HOME")
end

local undodir_path
if jit.os == "Windows" then
  undodir_path = home_dir .. "\\nvim\\undodir"
else
  undodir_path = home_dir .. "/.vim/undodir"
end

vim.opt.undodir = undodir_path
vim.opt.undofile = true

-- Add specific filetypes
vim.filetype.add({pattern = {["bash%-fc.*"] = "sh"}})
