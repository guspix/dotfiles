if vim.g.vscode then
    return
end


require('telescope').setup {
    defaults = {
        wrap_results = true,
        layout_strategy = "vertical",
    },
    extensions = {
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ph', function()
    builtin.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})
end, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

require("telescope").load_extension "file_browser"

vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<Leader>b", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<Leader>o", "<cmd>Telescope oldfiles<CR>")

