# Install brew

# Install exa for colorful ls
# $ brew install exa

# Install bat for file highlighting
# $ brew install bat

# Install yarn for coc-plugin and some other stuff ?
# $ brew install yarn

# Set git to always push bew branches to a remote branch with same name. This won't require you to use the -u or --set-upstream when pushing new branches
# git config --global push.default current

# Todo for neovim
# $ brew install neovim
# Download vim plug
# $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# $ mkdir ~/.config/nvim
# $ ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
# Run :PlugInstall in neovim

# Todo for fish
# $ ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish
# $ ln -s ~/.dotfiles/fishfile ~/.config/fish/fishfile
# $ ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml
# Install starhip prompt
# $ brew install starship

# $ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
# Or do the below function instead
# To automate the installation process in a new system, installing packages listed in your fishfile, add the following code to your fish configuration file.
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
