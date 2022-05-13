local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end --
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
return require('packer').startup(function(use)
	use "mfussenegger/nvim-dap" --Basic debugger
	use 'nvim-orgmode/orgmode' --Like VimWikki but better
	use 'norcalli/nvim-colorizer.lua'
	-- use {
	-- 	"folke/todo-comments.nvim",
	-- 	requires = "nvim-lua/plenary.nvim",
	-- 	config = function()
	-- 		require("todo-comments").setup {
	-- 			signs = true, -- show icons in the signs column
	-- 				sign_priority = 8, -- sign priority
	-- 				-- keywords recognized as todo comments
	-- 				keywords = {
	-- 					FIX = {
	-- 						icon = " ", -- icon used for the sign, and in search results
	-- 						color = "error", -- can be a hex color, or a named color (see below)
	-- 						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
	-- 						-- signs = false, -- configure signs for some keywords individually
	-- 					},
	-- 					TODO = { icon = "", color = "info" },
	-- 					HACK = { icon = "", color = "warning" },
	-- 					WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
	-- 					PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
	-- 					NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
	-- 				},
	-- 				merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- 				-- highlighting of the line containing the todo comment
	-- 				-- * before: highlights before the keyword (typically comment characters)
	-- 				-- * keyword: highlights of the keyword
	-- 				-- * after: highlights after the keyword (todo text)
	-- 				highlight = {
	-- 					before = "", -- "fg" or "bg" or empty
	-- 					keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
	-- 					after = "fg", -- "fg" or "bg" or empty
	-- 					pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
	-- 					comments_only = true, -- uses treesitter to match keywords in comments only
	-- 					max_line_len = 400, -- ignore lines longer than this
	-- 					exclude = {}, -- list of file types to exclude highlighting
	-- 				},
	-- 				-- list of named colors where we try to extract the guifg from the
	-- 				-- list of hilight groups or use the hex color if hl not found as a fallback
	-- 				colors = {
	-- 					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
	-- 					warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
	-- 					info = { "DiagnosticInfo", "#2563EB" },
	-- 					hint = { "DiagnosticHint", "#10B981" },
	-- 					default = { "Identifier", "#7C3AED" },
	-- 				},
	-- 				search = {
	-- 					command = "rg",
	-- 					args = {
	-- 						"--color=never",
	-- 						"--no-heading",
	-- 						"--with-filename",
	-- 						"--line-number",
	-- 						"--column",
	-- 					},
	-- 					-- regex that will be used to match keywords.
	-- 					-- don't replace the (KEYWORDS) placeholder
	-- 					pattern = [[\b(KEYWORDS):]], -- ripgrep regex
	-- 					-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	-- 				},
	-- 		}
	-- 	end
	-- }
	use 'nvim-lua/plenary.nvim' --Utility functions
	use 'p00f/clangd_extensions.nvim' --C/C++ linter
	use 'nvim-telescope/telescope.nvim'
	use 'tpope/vim-fugitive'
	use 'hrsh7th/cmp-nvim-lsp' --Completion plugins
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "kdheepak/cmp-latex-symbols" },
		},
		sources = {
			{ name = "latex_symbols" },
		},
	})
	-- For vsnip use rs.
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	-- use 'hrsh7th/cmp-vsnip'
	-- use 'hrsh7th/vim-vsnip'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use { --syntax highlightin
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'nvim-treesitter/nvim-treesitter-refactor',
			'RRethy/nvim-treesitter-textsubjects',
		},
		run = ':TSUpdate',
	}
	use 'tpope/vim-surround' --Use ysw to surround a word, line, paragraph,... in a symbol (a-Z, 0-9, {[<()>]}, ...)
	use 'tpope/vim-commentary' --For commenting out a block of code
	use 'rafi/awesome-vim-colorschemes' --Vim colorschemes
	use 'kana/vim-smartinput' --This one matches containers
	use 'frazrepo/vim-rainbow' --Colours matching containers in .c, .cpp,... files
	use 'vim-airline/vim-airline' --Statusbar
	use 'vim-airline/vim-airline-themes' --Statusbar themes
	use 'lervag/vimtex' --vimtex for editing TEX files in VIM
	use 'jakewvincent/texmagic.nvim'
	use 'vimwiki/vimwiki' --Personal wiki page, leader ww
	use 'pboettch/vim-cmake-syntax' --cmake syntax highlighting

	-- use 'kyazdani42/nvim-web-devicons' -- for file icons
	use 'ryanoasis/vim-devicons'
	use 'preservim/nerdtree' --File explorer for VIM
	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	}
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if Packer_bootstrap then
		require('packer').sync()
	end
end)
