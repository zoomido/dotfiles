#
# Fish settings
# --------------

# Add homebrew to path
set PATH /home/linuxbrew/.linuxbrew/bin/ $PATH

# Turn off fish greeting
set fish_greeting

# Set nvim as default editor
set -x EDITOR nvim

# Active VI keybindings
# fish_vi_key_bindings

# Fish extensions settings
# https://github.com/b4b4r07/enhancd
set -x ENHANCD_DOT_ARG '...'




#
# Set Abbreviations
# -----------------
if status --is-interactive
    # System
    abbr --add --global -- - 'cd -'
    abbr --add --global ...  'cd ../../..'
    abbr --add --global c    clear
    abbr --add --global v    nvim
    abbr --add --global l    exa
    abbr --add --global la   exa -a
    abbr --add --global ll   exa -l
    abbr --add --global lla  exa -la
    abbr --add --global lg   find . -name .git -type d -prune
    # Git
    abbr --add --global gs   git status
    abbr --add --global gss  git switch
    abbr --add --global gfa  git fetch --all
    abbr --add --global gpr  git pull --rebase
    abbr --add --global gp   git push
    abbr --add --global gtb  "git switch master && git pull --rebase && git switch -c"
    # Fzf
#    abbr --add --global dot  'nvim (find ~/.dotfiles -path ~/.dotfiles/.git -prune -o -print -type f | fzf)' # Search in .dotfiles folder
    abbr --add --global ff   'nvim (fzf)' # Search with fzf and open in nvim
end

function hej
    echo '
    l: exa (filelist)
    la: exa -a (filelist + hidden)
    ll: exa -l (detailed filelist)
    lla: exa -la (detailed filelist + hidden)
    lg: list git repos
    gs: git status
    gss: git switch
    gfa: git fetch --all
    gpr: git pull --rebase
    gp: git push
    gtb: Git new Theme elon Branch
    dot: search in dot folder and open in nvim
    ff: search with fzf and open in nvim
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
set -x BAT_THEME 'base16'

# Fzf global settings
set -x FZF_DEFAULT_OPTS "--info 'inline' --reverse --color 'border:#ffff00,info:#ffff00' --bind 'ctrl-d:preview-down,ctrl-u:preview-up,ctrl-o:toggle-preview,ctrl-w:toggle-preview-wrap,ctrl-l:accept,ctrl-h:clear-query'"
# set -x FZF_PREVIEW_LINES 80




#
# Source private configs if exists
# --------------------------------
if test -e ~/dotfiles-private/private.fish
    source ~/dotfiles-private/private.fish
end




#
# End of file
# ------------
