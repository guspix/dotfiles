if vim.g.vscode then
	return
end

-- ### Lazy Plugin Manager ###

-- Define the lazy table and functions
local lazy = {}

-- Install function for lazy.nvim
function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

-- Setup function for lazy.nvim and other plugins
function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	-- Install lazy.nvim if not already installed
	lazy.install(lazy.path)

	-- Add lazy.nvim to runtime path
	vim.opt.rtp:prepend(lazy.path)

	-- Setup lazy.nvim and other plugins
	require("lazy").setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

-- Set the path and options for lazy.nvim
lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}

-- Initialize lazy setup with plugins
lazy.setup({
	{ "folke/tokyonight.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"SmiteshP/nvim-navbuddy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim",
			},
			opts = { lsp = { auto_attach = true } },
		},
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	-- init.lua:
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					undo = {},
				},
			})
			require("telescope").load_extension("undo")
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{ "m4xshen/autoclose.nvim" },
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "tpope/vim-fugitive" },
	{ "ThePrimeagen/vim-be-good" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", "postgres" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	-- {
	--     "folke/flash.nvim",
	--     event = "VeryLazy",
	--     ---@type Flash.Config
	--     opts = {},
	--     -- stylua: ignore
	--     keys = {
	--         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	--         { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	--         { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	--         { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	--         { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	--     },
	-- }
})
