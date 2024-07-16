# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# ---------------------------------------
# Check for OS and use specific settings
# ---------------------------------------
case "$OSTYPE" in
    darwin*)
        # Load iterm2 shell integrations
        source ~/.iterm2_shell_integration.zsh
        # Load gnu utilities directly, overriding built in ones
        PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        # Add mysql-client 'mysql' to path
        PATH="/usr/local/opt/mysql-client/bin:$PATH"
        # Alias ctags if you used homebrew
        # alias ctags="`brew --prefix`/bin/ctags"
        # Add specific keybindings for jumping words on macos
        bindkey "^[[1;3C" forward-word
        bindkey "^[[1;3D" backward-word
        ;;
    linux*)
        # Load devbox functions on linux
        . ~/.dotfiles-private/devbox.zsh
        # Set linuxbrew path
        PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
        PATH="$HOME/.dotfiles/bin:$PATH"
        ;;
esac


# Fix less output to terminal
LESS="-XRF"; export LESS



# -------------------
# ZSH Settings
# -------------------

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder



# ----------
# Oh My Zsh
# ----------

# Theme
# ------
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="sunaku"
ZSH_THEME="spaceship"

# -- Spaceship theme settings
SPACESHIP_HOST_SHOW=false
SPACESHIP_USER_COLOR="white"
SPACESHIP_DIR_PREFIX="> "
SPACESHIP_DIR_TRUNC=4
SPACESHIP_DIR_TRUNC_PREFIX="…/"
# Hide Node & Php versions
SPACESHIP_NODE_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
# Show the exit code when other than 0
SPACESHIP_EXIT_CODE_SHOW=true

# -- Base16 theme settings
#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


# Plugins
# --------
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    mercurial
    zsh-autosuggestions
    zsh-syntax-highlighting
    vagrant
    gulp
    nvm
    z
)


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh



# -------------------
# User configuration
# -------------------

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR=vim
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# History options
setopt SHARE_HISTORY             # Share history between all sessions.
setopt APPEND_HISTORY            # Append to history
setopt INC_APPEND_HISTORY        # Adds commands as they are typed, not at shell exit
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Verify history entry before running in terminal
SAVEHIST=5000
HISTSIZE=2000

# Set Auto Change Directory
setopt AUTO_CD

# Auto correct spelling
setopt CORRECT
setopt CORRECT_ALL

# Load advanced tab completion features
autoload -Uz compinit && compinit
# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# Partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix



# -------------------------
# Load fzf & configuration
# -------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
#export FZF_DEFAULT_OPTS="--preview '(bat --style=numbers --color=always {} || less {})'"



# ----------------------------------------
# Load Z command for directory navigation
# Using zsh plugin z instead now
# ----------------------------------------
# . ~/.dotfiles/z.sh



# ------
# Alias
# ------

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cd="pushd $1 > /dev/null"
alias dc="popd > /dev/null"
# Not needed when using AUTO_CD
#alias ..="cd .."
#alias ...="cd ../.."
#alias ....="cd ../../.."
alias c="clear"
alias l="ls -F --color --group-directories-first"
alias ll="ls -aF --color --group-directories-first"
alias lll="ls -lahF --color --group-directories-first"
# Vim
alias v='nvim'
#alias vf='vim $(fzf --preview "bat --style=numbers --color=always {}")'
# alias vf='nvim -c "Files!"'
# alias vff='nvim -c ":Rg!"'
# alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
# Mercurial
# alias hgcb='hg update $(hgb-fzf)'
# alias hgd='hg diff -r default'
# alias hgdf='hg diff --stat -r default'
# alias vhg='nvim $(hgd-fzf)'



# ----------
# Functions
# ----------

# Print a help for custom commands
function hej () {
    print '
    fd: find-dir - fuzzy find dir
    ff: find-file - fzf with preview
    fh: find-history - history search (CTRL-R)
    hgcb: hg change branch
    hgd: hg diff (compare with default branch)
    hgdf: hg diff files (compare with default branch)
    vhg: vim open hg branch files
    vf: vim-find - open file in vim
    vff: vim-findIn-file - fuzzy find in files in vim
    '
}


# Find Directory - Fuzzy search for directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}


# Find In File - Fuzzy search for contents in files - usage: fif <searchTerm>
# fif() {
#   if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
#   vim $(rg --files-with-matches --no-messages "$1" | fzf --preview "(bat --style=numbers --color=always {} || highlight -O ansi -l {}) 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}")
# }


# Find History - Fuzzy search in typed history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}


# Fuzzy search branch
hgb-fzf() {
    hg branches | fzf | cut -d' ' -f1
}


# Fuzzy search diff files
hgd-fzf() {
    hg diff --stat -r default | cut -d' ' -f2 | fzf
}



# ----------------------------------------
# Mercurial & SSH  in prompt
# Currently using spaceship theme instead
# ----------------------------------------

# if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#   SESSION_TYPE=remote/ssh
# else
#   case $(ps -o comm= -p $PPID) in
#     sshd|*/sshd) SESSION_TYPE=remote/ssh;;
#   esac
# fi
# if [ -n "$SESSION_TYPE" ]; then
#     local SSH_PROMPT="%{$fg_bold[blue]%}%n@%m "
# else
#     local SSH_PROMPT="%{$fg_em[green]%}%n "
# fi

#ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[gray]%}(hg:%{$fg[yellow]%}"
#ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[gray]%}) %{$fg[yellow]%}✗%{$reset_color%}"
#ZSH_THEME_HG_PROMPT_CLEAN="%{$fg[gray]%})"
#PROMPT='%(?..%{$fg_bold[red]%}exit %?'\
# '%{$reset_color%})
# $SSH_PROMPT%{$fg[magenta]%}%~%{$reset_color%} '\
# '%{$bold_color%}$(git_prompt_status)%{$reset_color%}'\
# '$(git_prompt_info)'\
# '$(hg_prompt_info)
# %(!.#.$) '
