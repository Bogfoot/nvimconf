# nvimconf
This is my full neovim configuration folder. In order to use it you will need the packer
plugin manager installed. Then, cd to $HOME/.config/nvim. From there enter the command
git clone https://github.com/Bogfoot/nvimconf.git.
In the above mentioned folder create a file called init.vim and in it place the following command: lua require("init").
From there open neovim and run the :PackerInstall, :PackerSync, or :PackerUpdate command in order to install all of the plugins.
