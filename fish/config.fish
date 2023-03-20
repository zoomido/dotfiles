#
# Fish settings
# --------------

# Add homebrew to path on Linux
switch (uname)
    case Linux
        set HOMEBREW_PATH /home/linuxbrew/.linuxbrew/bin/
        contains $HOMEBREW_PATH $PATH; or set -x PATH $PATH $HOMEBREW_PATH
#    case Darwin
#        echo using macos!
end

# Turn off fish greeting
set fish_greeting

# Set nvim as default editor
set EDITOR nvim

# Active VI keybindings
# fish_vi_key_bindings

# Fish extensions settings
# https://github.com/b4b4r07/enhancd
set ENHANCD_COMMAND 'cde'

# Start zoxide change dir tool
zoxide init fish | source



#
# Set Abbreviations
# -----------------
if status --is-interactive
    # System
    # abbr --add --global -- - 'cd -'
    # abbr --add --global ...  'cd ../../..'
    abbr --add --global c    clear
    abbr --add --global v    nvim
    abbr --add --global l    exa --icons --group-directories-first
    abbr --add --global la   exa -a --icons --group-directories-first
    abbr --add --global ll   exa -l --icons --group-directories-first --git
    abbr --add --global lla  exa -la --icons --group-directories-first --git
    abbr --add --global diskusage   ncdu
    # Git
    abbr --add --global gs   git status
    abbr --add --global gss  git switch
    abbr --add --global gfa  git fetch --all
    abbr --add --global gpr  git pull --rebase
    abbr --add --global gpf   git push --force-with-lease
    #abbr --add --global gtb  "git switch master && git pull --rebase && git switch -c"
    abbr --add --global lg   find . -type d -name \'.git\' -exec echo {} \\\; -exec git -C {} branch --show-current \\\;
    # Fzf
    # abbr --add --global dot  'nvim (find ~/.dotfiles -path ~/.dotfiles/.git -prune -o -print -type f | fzf)' # Search in .dotfiles folder
    # abbr --add --global ff   'nvim (fzf)' # Search with fzf and open in nvim
    abbr --add --global cdf   'cd (fd --type directory | fzf)'
end

function hej
    echo '
    --: cd -
    l: exa (filelist)
    la: exa -a (filelist + hidden)
    ll: exa -l (detailed filelist)
    lla: exa -la (detailed filelist + hidden)
    lg: list git repos
    cdf: find directory with fzf

    gs: git status
    gss: git switch
    gfa: git fetch --all
    gpr: git pull --rebase
    gp: git push

    Ctrl+r: Fzf history search
    '
end




#
# External applications
# ---------------------

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Bat global settings
#set -x BAT_THEME 'base16'

# Fzf global settings
set -x FZF_DEFAULT_OPTS "--info 'inline' --reverse --color 'border:#ffff00,info:#ffff00' --bind 'ctrl-d:preview-down,ctrl-u:preview-up,ctrl-o:toggle-preview,ctrl-w:toggle-preview-wrap,ctrl-l:accept,ctrl-h:clear-query'"
# set -x FZF_PREVIEW_LINES 80




#
# Configs
# -------

# Source private configs if exists
#if test -e ~/dotfiles-private/private.fish
#    source ~/dotfiles-private/private.fish
#end

# Source NNN config if nnn exists
if command -v nnn &> /dev/null
    source $HOME/.config/fish/nnn.fish
end




#
# End of file
# ------------
