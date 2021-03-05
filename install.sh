#!/usr/bin/env zsh

# Use this install guide for all commands needed
# https://www.freecodecamp.org/news/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38/


# Symlinks for git repo
# https://codingkilledthecat.wordpress.com/2012/08/08/git-dotfiles-and-hardlinks/


# Source the zshrc file for variables
. ~/.zshrc



# Install spaceship theme
# -----------------------
function install_spaceship() {
    echo -n "Install spaceship-prompt (y/N)? "
    read -q answer
    echo # insert newline
    if [[ ! "$answer" =~ ^[Yy]$ ]];then
        return 0
    fi

    echo "Cloning spaceship-prompt to $ZSH_CUSTOM/themes/spaceship-prompt & symlinking"
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    # Symlink spaceship.zsh-theme to your oh-my-zsh custom themes directory
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
}
install_spaceship



# Check for OS and use specific settings
case "$OSTYPE" in
  darwin*)
  ;;
  linux*)
      # Not needed with new symlink alternative
      #echo "OS: $OSTYPE. Symlink ,zshrc & .vimrc to .dotfiles/"
      #ln ~/.dotfiles/.zshrc ~/.zshrc -f
      #ln ~/.dotfiles/.vimrc ~/.vimrc -f
  ;;
esac
