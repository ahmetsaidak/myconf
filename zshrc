export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.toolbox/bin:$HOME/Library/Python/3.7/bin

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
# Path to your oh-my-zsh installation.

export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
#
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo git history taskwarrior zsh-autosuggestions zsh-syntax-highlighting adb dircycle)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# User configuration
 export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# my additions
bindkey '^[[Z' autosuggest-accept

alias vi=vim
export AWS_PROFILE=arnold-dev
export PYTHONPATH=$PYTHONPATH:~/BotoCoreAmazon
zshrc () {
    vim ~/.zshrc
    source ~/.zshrc
}  
tmuxrc () {
	vim ~/.tmux.conf
}
alias arnold="unison ws;\arnold"
alias ab="arnold ws build --ccache"
alias as="arnold ws show"
alias abb="arnold ws build --ccache --build-only"
alias asf="arnold ws set-flavour"
alias acw="arnold ws create -vs AlexaHybridEngine"
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:/home/asaidak/tools/ArnoldTheBuilder/bin
for f in SDETools envImprovement AmazonAwsCli OdinTools; do
    if [[ -d /apollo/env/$f ]]; then
        export PATH=$PATH:/apollo/env/$f/bin
    fi
done

export TZ='Europe/Warsaw'
alias dus="du -sh * | sort -h"
alias amend="git commit --amend"
alias grp="grep -rni"
alias reboot="echo 'dont use reboot'"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir custom_arnold_flavour vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time)
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"

alias kill="kill -9"
alias cpm="cp -r ~/models ."
eval "$(_ARNOLD_COMPLETE=source_zsh \arnold)"
mkdir -p $HOME/.ccache
export ARNOLD_CCACHE_DIR=$HOME/.ccache
zsh_arnold_flavour() {
    arnold_pwd=$PWD
    while [[ ! -d "$arnold_pwd/arnold-config" ]]; do
        [[ ${arnold_pwd:A} == '/' ]] && return
        arnold_pwd+='/..'
    done
    arnold_pwd=${arnold_pwd:A}
    #    echo -en "\U0001F366 "
    if [ $COLUMNS -lt 60 ]; then return; fi
    echo $(jq -r '.["flavour"]' "$arnold_pwd/arnold-config/workspace.config.json" | tr -d '\n')'@'$(basename $arnold_pwd)
}

POWERLEVEL9K_CUSTOM_ARNOLD_FLAVOUR="zsh_arnold_flavour"
