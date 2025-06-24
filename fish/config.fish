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
set -x EDITOR nvim




#
# Set Abbreviations
# -----------------
if status --is-interactive
    # System
    # abbr --add --global -- - 'cd -'
    # abbr --add --global ...  'cd ../../..'
    abbr --add c    clear
    abbr --add v    nvim
    abbr --add vp   nvim +"\"lua require('telescope').extensions.possession.list()"\"
    abbr --add vf   nvim +"\"lua require('telescope.builtin').find_files()"\"
    abbr --add vg   nvim +"\"lua require('telescope').extensions.live_grep_args.live_grep_args()"\"
    abbr --add vn   nvim +"\"lua require('telekasten').find_notes()"\"
    abbr --add vng  nvim +"\"lua require('telekasten').search_notes()"\"
    abbr --add todo nvim ~/notes/zettelkasten/todo.md
    # +"lua require('telescope.builtin').find_files()"
    abbr --add l    eza --icons --group-directories-first --classify -a
    abbr --add ll   eza --icons --group-directories-first --classify -la
    abbr --add lll  eza --icons --group-directories-first --classify -la --git --git-repos --header
    # When eza not available use below
    #abbr --add l    ls --classify --tabsize=0 --group-directories-first --human-readable --almost-all --literal
    #abbr --add ll   ls --classify --tabsize=0 --group-directories-first --human-readable --almost-all -l
    #abbr --add lll  ls --classify --tabsize=0 --group-directories-first --human-readable --almost-all -l --quoting-style=escape
    abbr --add rm   use trash [for macos or rip if installed]

    # Git
    abbr --add gs      git status
    abbr --add gss     git switch
    abbr --add gpr     git pull --rebase
    abbr --add gpf     git push --force-with-lease
    #abbr --add --global gtb    "git switch master && git pull --rebase && git switch -c"
    abbr --add cdg     "cd (git rev-parse --show-toplevel)"
    abbr --add lg      find . -type d -name \'.git\' -exec echo {} \\\; -exec git -C {} branch --show-current \\\;
    abbr --add lgs     find . -type d -name .git -print -execdir git status \\\;
    abbr --add mgs     find . -type d -name .git -print -execdir git sw XXX \\\; -execdir git pull --rebase \\\;

    # Fzf
    #abbr --add --global dot  'nvim (find ~/.dotfiles -path ~/.dotfiles/.git -prune -o -print -type f | fzf)' # Search in .dotfiles folder
    #abbr --add --global ff   'nvim (fzf)' # Search with fzf and open in nvim
    #abbr --add --global cdf   'cd (fd --type directory | fzf)' # Change directory

    # Tools
    abbr --add diskusage   ncdu
    abbr --add weather 'curl v2d.wttr.in'
    abbr --add explorer yazi
end

function hej
	cat $HOME/dotfiles/documentation.txt
end




#
# External applications
# ---------------------

# Ripgrep config file dir
# set -x RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

# Bat global settings
#set -x BAT_THEME 'base16'

# Fzf global settings
#set -x FZF_DEFAULT_OPTS "--info 'inline' --reverse --color 'border:#ffff00,info:#ffff00' --bind 'ctrl-d:preview-down,ctrl-u:preview-up,ctrl-o:toggle-preview,ctrl-w:toggle-preview-wrap,ctrl-l:accept,ctrl-h:clear-query'"
# set -x FZF_PREVIEW_LINES 80
##set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --glob "!.git"'

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Start zoxide change dir tool
zoxide init fish | source



#
# Configs
# -------

# Source private configs if exists
if test -e $HOME/dotfiles-private/private.fish
    source $HOME/dotfiles-private/private.fish
end

if test -e $HOME/.openai_api_key
    set -x OPENAI_API_KEY (head -1 $HOME/.openai_api_key)
end




#
# End of file
# ------------
