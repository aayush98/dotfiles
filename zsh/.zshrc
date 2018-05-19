# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PAT
	export PATH="$PATH:/home/aayushg9/bin/"
# Path to your oh-my-zsh installation.
  export ZSH=/home/aayushg9/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# POWERLEVEL9K_MODE='nerdfont-complete'
neofetch
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_DEFAULT_ICON=''
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="000"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="010"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="036"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="234"
POWERLEVEL9K_DIR_HOME_BACKGROUND="036"
POWERLEVEL9K_DIR_HOME_FOREGROUND="234"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="036"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="234"
POWERLEVEL9K_NODE_VERSION_BACKGROUND="black"
POWERLEVEL9K_NODE_VERSION_FOREGROUND="248"
POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_COLOR="036"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="248"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M} %F{036}  "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=("os_icon" 'context' 'dir')
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('vcs' 'time' 'battery')
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B2'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0'
POWERLEVEL9K_OS_ICON_BACKGROUND='010'
POWERLEVEL9K_LINUX_ICON='%F{234} '
POWERLEVEL9K_BATTERY_HIGH_THRESHOLD=98
POWERLEVEL9K_BATTERY_ICON=""
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="248"
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='161'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="071"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="104"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
	alias 408project="cd ~/Documents/ece408/project"
	alias home="cd ~/"
	alias mp3_nodebug="(cd ~ ; exec ./mp3_nodebug)"
	alias mp3_debug="(cd ~ ; exec ./mp3_debug)"
	alias devel="(cd ~ ; exec ./devel)"
	alias packageUpdate="sudo pacman -Syu; yaourt -Syua"
	alias 391work="cd ~/ece391/ece391_share/work/mp3"
