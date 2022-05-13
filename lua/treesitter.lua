local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	--   ensure_installed = {'c','cpp','python','cmake','lua',},
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { 'org' }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
}

require('orgmode').setup {
	org_agenda_files = { '~/OrgMode/org/*', '~/my-orgs/**/*' },
	org_default_notes_file = '~/OrgMode/org/refile.org',
}
require('orgmode').setup_ts_grammar()

require 'colorizer'.setup()
