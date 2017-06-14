if [[ -f ~/.profile ]]; then
  source ~/.profile
fi

export ZSH=$HOME/.oh-my-zsh

if [[ -f ~/.zshrc.theme ]]; then
  ZSH_THEME=$(cat ~/.zshrc.theme)
else
  ZSH_THEME="robbyrussell"
fi


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if [[ `uname` == 'Darwin' ]] then
  plugins=(brew compleat catimg gitfast sublime vagrant vi-mode autojump)
else
  plugins=(compleat catimg gitfast sublime vagrant vi-mode autojump)
fi

source $ZSH/oh-my-zsh.sh


# User configuration

export PATH="./.bundle/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/lib/node_modules"
if ! (command -v rvm >/dev/null 2>&1 ); then
  export PATH="${HOME}/.rbenv/bin:${PATH}"
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi


alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias l='ls -CF'
alias -- +='pushd .'
alias -- -=popd

alias be='bundle exec'
if (command -v rvm >/dev/null 2>&1 ); then
  alias bi='bundle check --path=.bundle || bundle install --path=.bundle --binstubs .bundle/bin --jobs=4 --retry=3'
  alias bu='bundle update --path .bundle --verbose --binstubs .bundle/bin'
else
  alias bi='bundle check --path=.bundle || bundle install --path=.bundle --binstubs .bundle/bin --jobs=4 --retry=3; rbenv rehash'
  alias bu='bundle update --path .bundle --verbose --binstubs .bundle/bin; rbenv rehash'
fi

alias esli='eslint'
alias eslintfix='eslint --fix'
alias brucop='bundle exec rubocop'
alias brucoprun='bundle exec rubocop -l && bundle exec rubocop --only-guide-cops'
alias brucopfix='bundle exec rubocop -a'
alias bife='bundle exec knife'
alias bagrant='bundle exec vagrant'
alias brake='bundle exec foreman run rake'
alias brails='bundle exec foreman run rails'
alias brespec='SHOW_COUNTS=on bundle exec rspec --color --drb'
alias boreman='reset && bundle exec foreman start'
alias bap='bundle exec cap'
alias npmlist='npm list -g --depth 0'
alias x='exit'

alias rscp="rsync --partial --progress --rsh=ssh"
alias convim='vim -u /usr/share/vim/vimrc'

alias ios_log='tail -f ~/Library/Logs/CoreSimulator/*/system.log'

export RSPEC=true
export EDITOR=vim

if ! (command -v rvm >/dev/null 2>&1 ); then
  eval "$(rbenv init - --no-rehash zsh)"
fi

set -o vi
bindkey -v
bindkey '^R' history-incremental-search-backward


export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bin.local:$PATH"


export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:./node_modules/.bin:./vendor/node_modules/.bin"
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
export JRUBY_OPTS='--dev'

if (command -v docker-machine >/dev/null 2>&1 ); then
  #eval $(docker-machine env default)
fi

###-tns-completion-start-###
if [ -f ${HOME}/.tnsrc ]; then
    source ${HOME}/.tnsrc
fi
###-tns-completion-end-###
