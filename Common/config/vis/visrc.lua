require('vis')
require('plugins/filetype')
require('vis-filetype-settings/vis-filetype-settings')
settings = {
	python = {"set expandtab on", "set tabwidth 4"};
	nix = {"set expandtab on", "set tabwidth 2"}
}
--plugins--
----require('plugins/twofinger-surround')
--require('plugins/vis-commentary/vis-commentary')
--require('plugins/vis-ctags/ctags')
--require('plugins/vis-fzf-open/fzf-open')
--require('plugins/vis-modelines/vis-modelines')
--require('plugins/vis-surround/vis-surround')
--require('plugins/vis-vim-compatibility-pack/vis-vim-compatible')

vis.events.subscribe(vis.events.INIT, function()
	--global configuration--
	vis:command('set change-256colors off') --see vis#613
--	vis:command('set theme base16-tomorrow-night')

	--keyboard shortcuts--
--	vis:command('map insert <C-s> <Escape>:w<Enter>')
--	vis:command('map normal <C-s> :w<Enter>')
--	vis:command('map! insert <M-C-h> <Escape>dbi')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	--per-window configuration--
	vis:command('set relativenumbers on')
	vis:command('set colorcolumn 80')
	vis:command('set cursorline on')
	vis:command('set show-eof on')
	vis:command('set show-tabs on')
	vis:command('set autoindent on')
	vis:command('set cursorline on')
	vis:command('set expandtab on')
	vis:command('set tabwidth 4')
end)
