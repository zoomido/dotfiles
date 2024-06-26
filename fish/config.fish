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

# Active VI keybindings
# fish_vi_key_bindings

# Fish extensions settings
# https://github.com/b4b4r07/enhancd
# set ENHANCD_COMMAND 'cde'



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
    abbr --add todo nvim ~/notes/zettelkasten/todo.md
    # +"lua require('telescope.builtin').find_files()"
    abbr --add l    eza --icons --group-directories-first
    abbr --add ll   eza -a --icons --group-directories-first
    abbr --add lll  eza -la --icons --group-directories-first --git
    abbr --add del  trash
    abbr --add rm   use del (or rip if installed)

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
set -x RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

# Base16 Shell
#if status --is-interactive
#    set BASE16_SHELL "$HOME/.config/base16-shell"
#    source "$BASE16_SHELL/profile_helper.fish"
#end

# Bat global settings
#set -x BAT_THEME 'base16'

# Fzf global settings
#set -x FZF_DEFAULT_OPTS "--info 'inline' --reverse --color 'border:#ffff00,info:#ffff00' --bind 'ctrl-d:preview-down,ctrl-u:preview-up,ctrl-o:toggle-preview,ctrl-w:toggle-preview-wrap,ctrl-l:accept,ctrl-h:clear-query'"
# set -x FZF_PREVIEW_LINES 80
##set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --glob "!.git"'

# Fzf fish settings
##set fzf_fd_opts --hidden --no-ignore

# Start FZF in explorer mode
# function fzfexplorer
#     # Store the STDOUT of fzf in a variable
#     set SELECTION (find . -type d | fzf --multi --height=80% --border=sharp \
#             --preview='tree -C --filelimit 100 --dirsfirst {}' --preview-window='45%,border-sharp' \
#             --prompt='Dirs > ' \
#             --bind='ctrl-x:execute(rip -i {+})' \
#             --bind='ctrl-p:toggle-preview' \
#             --bind='ctrl-d:change-prompt(Dirs > )' \
#             --bind='ctrl-d:+reload(find . -type d)' \
#             --bind='ctrl-d:+change-preview(tree -C {})' \
#             --bind='ctrl-d:+refresh-preview' \
#             --bind='ctrl-f:change-prompt(Files > )' \
#             --bind='ctrl-f:+reload(find . -type f)' \
#             --bind='ctrl-f:+change-preview(cat {})' \
#             --bind='ctrl-f:+refresh-preview' \
#             --bind='ctrl-l:accept' \
#             --bind='ctrl-t:toggle-all' \
#             --header '
#             CTRL-D to display directories | CTRL-F to display files
#             CTRL-T to select/deselect all
#             CTRL-L to open | CTRL-X to delete
#             CTRL-P to toggle preview
#             '
#     )
#
#     # Determine what to do depending on the selection
#     if test -d "$SELECTION"
#     echo "this should cd to $SELECTION"
#         cd $SELECTION
#         else if test -f "$SELECTION"
#     echo "this should open vim with $SELECTION"
#         eval "$EDITOR $SELECTION"
#     else
#         echo "No file or dir selected"
#     end
# end

# Start zoxide change dir tool
zoxide init fish | source



#
# Configs
# -------

# Source private configs if exists
if test -e ~/dotfiles-private/private.fish
    source ~/dotfiles-private/private.fish
end

# Source NNN config if nnn exists
#if command -v nnn &> /dev/null
#    source $HOME/.config/fish/nnn.fish
#end

#todo.sh list




#
# End of file
# ------------
