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
    abbr --add l    eza --icons --group-directories-first
    abbr --add ll   eza -a --icons --group-directories-first
    abbr --add lll  eza -la --icons --group-directories-first --git
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

    # Magento (uses -l for login-shell to respect nvm settings)
    abbr --add ws       'warden shell'
    abbr --add m2ccc    'warden env exec php-fpm bash -lc "/home/www-data/bin/m2ccc.sh"'
    abbr --add m2ccce   'warden env exec php-fpm bash -lc "/home/www-data/bin/m2ccc.sh" && exit'
    abbr --add m2css    'warden env exec php-fpm bash -lc "/home/www-data/bin/m2css.sh"'
    abbr --add m2csse   'warden env exec php-fpm bash -lc "/home/www-data/bin/m2css.sh" && exit'

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
if test -e ~/dotfiles-private/private.fish
    source ~/dotfiles-private/private.fish
end

set -x OPENAI_API_KEY (head -1 $HOME/.openai_api_key)




#
# End of file
# ------------
