export NODE_PATH="/usr/local/lib/node"
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export PATH=/usr/local/bin:/usr/local/share/npm/bin:$PATH

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# generic aliases
alias ls="ls -G"
alias ll="ls -laG"
alias wget="curl -OL"
alias c="clear"

# GIT alias
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gco='git checkout'
alias gcob='git checkout - B'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# rails aliases
alias be="bundle exec"
alias bi="bundle install"
alias t="RAILS_ENV=test"
alias d="RAILS_ENV=development"
alias s="RAILS_ENV=staging"
alias p="RAILS_ENV=production"

# postgresql aliases
alias pgstart="sudo sysctl -w kern.sysv.shmall=8192 && pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres -m fast stop"

# tab-completion for git subcommands
source /usr/local/git/contrib/completion/git-completion.bash

# git status with a dirty flag
function __git_status_flag {
git_status="$(git status 2> /dev/null)"
remote_pattern="^# Your branch is (.*) of"
diverge_pattern="# Your branch and (.*) have diverged"
if [[ ! ${git_status}} =~ "working directory clean" ]]; then
state="⚡"
  spacer=" "
fi

if [[ ${git_status} =~ ${remote_pattern} ]]; then
spacer=" "
  if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
remote="↑"
  else
remote="↓"
  fi
fi

if [[ ${git_status} =~ ${diverge_pattern} ]]; then
remote="↕"
  spacer=" "
fi

echo "${state}${remote}${spacer}"
}

# the prompt itself
PS1='\[\e[32m\]lo\[\e[1m\]\[\e[22m\]:\[\e[1;34m\]\w\[\e[22;35m\]$(__git_ps1 " [\[\e[33m\]$(__git_status_flag)\[\e[35m\]%s]")\[\e[33m\] \$ \[\e[0m\]'
if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi

# cert.pem file for openssl 
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
