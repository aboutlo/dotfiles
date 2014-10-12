JAVA_OPTS="-Xms128m -Xmx1024m -XX:MaxPermSize=256m -Dfile.encoding=UTF8"
export M2_HOME=/Applications/apache-maven-3.0
#export M2_HOME=/Applications/Maven-3.0-beta-1
#export M2_HOME=/Applications/Mavien_2.2.1

export M2_REPO=/open/maven2/repository
export MAVEN_OPTS="-Xms512M -Xmx1024M -XX:PermSize=384m -XX:MaxPermSize=512m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -server"
#export MAVEN_OPTS="-Xms512M -Xmx1024M -XX:PermSize=384m -XX:MaxPermSize=512m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -server -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC"
export GRAILS_HOME=/Users/lorenzo/grails
export NODE_PATH="/usr/local/lib/node"
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export PATH=/usr/local/bin:/Xcode3.1.4/usr/bin:/Applications/android-sdk-macosx/platform-tools:$GRAILS_HOME/bin:/Applications/Adobe\ Flash\ Builder\ 4.5/sdks/4.5.1/bin:/usr/local/share/npm/bin:$PATH
export FLEX_HOME=/Applications/Adobe\ Flash\ Builder\ 4.5/sdks/4.5.1/
#export flexsdk.dir=/Applications/Adobe\ Flash\ Builder\ 4.5/sdks/4.5.1/
# aliases
alias ls="ls -G"
alias ll="ls -laG"
alias wget="curl -OL"
alias pgstart="sudo sysctl -w kern.sysv.shmall=8192 && pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres -m fast stop"
alias t="RAILS_ENV=test"
alias d="RAILS_ENV=development"
alias s="RAILS_ENV=staging"
alias p="RAILS_ENV=production"

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
