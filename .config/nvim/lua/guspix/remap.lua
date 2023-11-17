-- Map Space to Leader in normal mode
vim.api.nvim_set_keymap('n', '<Space>', '<Leader>', {}) 
vim.api.nvim_set_keymap('v', '<Space>', '<Leader>', {}) 

vim.keymap.set({ "n", "x" }, "y", '"+y')
vim.keymap.set({ "n", "x" }, "p", '""p')


-- Map ñ to ; in normal mode
vim.keymap.set('n', 'ñ', ';')
-- Map ñ to ; in visual mode
vim.keymap.set('v', 'ñ', ';')

-- Map Ñ to : in normal mode
vim.keymap.set('n', 'Ñ', ':')
-- Map Ñ to ; in visual mode
vim.keymap.set('v', 'Ñ', ':')

-- Map Ctrl-C to ESC
vim.keymap.set("i", "<C-c>", "<Esc>")

-- If using using VSCode use tabs, if not use buffers
if vim.g.vscode then
    vim.keymap.set("n", '<C-k>', 'gt')
    vim.keymap.set("n", '<C-j>', 'gT')
else
-- Map previous and next buffer to leader k and j
    vim.keymap.set("n", '<C-k>', '<cmd>bn<CR>')
    vim.keymap.set("n", '<C-j>', '<cmd>bp<CR>')
end

-- Delete current buffer with Leader x
vim.keymap.set('n', '<Leader>x', '<cmd>b#<BAR>bd#<CR>')
-- Delete current buffer without saving with Leader X
vim.keymap.set('n', '<Leader>X', '<cmd>bdelete!<CR>')

-- See errors in line on a popup with Leader e
vim.keymap.set("n", '<Leader>e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')

-- Save with Ctrl s
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')

-- Save session file and quit with Leader q
vim.keymap.set('n', '<Leader>q', '<cmd>SaveSession<CR><cmd>q<CR>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keep cursor centered when scrolling with ctrl d or ctrl u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Go to last used buffer with leader l
vim.keymap.set("n", "<Leader>l", "<cmd>b#<CR>")
vim.keymap.set("n", "<Leader>b", "<cmd>ls<CR>:b<space>") -- This is overwritten in the Telescope file, I keep it in case it doesn't load
