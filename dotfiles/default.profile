export NODE_PATH="/usr/local/lib/node"
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export PATH=/usr/local/bin:/usr/local/share/npm/bin:$PATH

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

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

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done

# the prompt itself
PS1='\[\e[32m\]lo\[\e[1m\]\[\e[22m\]:\[\e[1;34m\]\w\[\e[22;35m\]$(__git_ps1 " [\[\e[33m\]$(__git_status_flag)\[\e[35m\]%s]")\[\e[33m\] \$ \[\e[0m\]'

# cert.pem file for openssl 
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
